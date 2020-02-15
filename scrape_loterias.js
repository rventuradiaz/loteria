// scrape_loterias.js

var webPage = require('webpage');
var page = webPage.create();

var fs = require('fs');
var path = 'loterias.html'

page.open('https://www.loteriasyapuestas.es/es/resultados/primitiva', function (status) {
  var content = page.content;
  fs.write(path,content,'w')
  phantom.exit();
});