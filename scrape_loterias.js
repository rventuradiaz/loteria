// scrape_loterias.js
// Uses Puppeteer + stealth plugin to fetch Primitiva results via the public API,
// then writes loterias.html in the structure sorteos-js-web-scraping.R expects.

const puppeteer = require('puppeteer-extra');
const StealthPlugin = require('puppeteer-extra-plugin-stealth');
const fs = require('fs');

puppeteer.use(StealthPlugin());

const OUTPUT_PATH = 'loterias.html';

(async function main() {
  const browser = await puppeteer.launch({ headless: true });
  const page = await browser.newPage();

  // intercept the JSON API response the page makes internally
  let draws = null;
  page.on('response', async function(response) {
    if (response.url().includes('buscadorSorteos')) {
      try {
        draws = await response.json();
      } catch (e) {
        console.error('Could not parse API response as JSON');
      }
    }
  });

  await page.goto(
    'https://www.loteriasyapuestas.es/es/resultados/primitiva',
    { waitUntil: 'networkidle2', timeout: 30000 }
  );

  await browser.close();

  if (!draws || !Array.isArray(draws) || draws.length === 0) {
    console.error('No draw data captured.');
    process.exit(1);
  }

  const html = buildHtml(draws);
  fs.writeFileSync(OUTPUT_PATH, html, 'utf8');
  console.log('Done — wrote', draws.length, 'draws to', OUTPUT_PATH);
})();


// combinacion format: "04 - 11 - 18 - 31 - 37 - 44 C(46) R(5)"
// extracting all digit groups gives: [04, 11, 18, 31, 37, 44, 46, 5]
//   indices 0-5 → main numbers, index 6 → complementario, index 7 → reintegro
function parseCombinacion(combinacion) {
  const all = combinacion.match(/\d+/g) || [];
  return {
    numbers: all.slice(0, 6),
    complementario: all[6] || '',
    reintegro: all[7] || ''
  };
}

function buildHtml(draws) {
  return draws.map(function(draw) {
    const parsed = parseCombinacion(draw.combinacion);
    const liNumbers = parsed.numbers.map(n => '<li>' + n + '</li>').join('');
    const fecha = draw.fecha_sorteo.substring(0, 10); // "2026-05-18"

    return (
      '<div class="c-resultados-buscador__primitiva c-resultado-sorteo--primitiva">' +
        '<div class="c-resultado-sorteo__primitiva">' +
          '<div class="c-resultado-sorteo__cabecera--primitiva">' +
            '<span class="c-resultado-sorteo__fecha">' + fecha + '</span>' +
          '</div>' +
          '<div class="c-resultado-sorteo__combinacion--primitiva">' +
            '<ul>' + liNumbers + '</ul>' +
          '</div>' +
          '<div class="c-resultado-sorteo__complementario">' +
            '<ul><li class="c-resultado-sorteo__complementario-li--primitiva">' +
              parsed.complementario +
            '</li></ul>' +
          '</div>' +
          '<div class="c-resultado-sorteo__reintegro">' +
            '<ul><li class="c-resultado-sorteo__reintegro-li--primitiva">' +
              parsed.reintegro +
            '</li></ul>' +
          '</div>' +
        '</div>' +
      '</div>'
    );
  }).join('\n');
}
