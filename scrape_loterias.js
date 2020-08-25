// scrape_loterias.js

var webPage = require('webpage');
var page = webPage.create();
var fs = require('fs');
var path = 'loterias.html';


page.open('https://www.loteriasyapuestas.es/es/resultados/primitiva', function (status) {
  try{ 
    	if (status == "success"){

    	  var content = page.evaluate(function(){
           return document.getElementsByClassName('r-resultados-buscador')[0].innerHTML;
          });
	  fs.write(path,content,'w');
		phantom.exit();
		}
    
  } catch (ex) {
  var fullMessage = "\nJAVASCRIPT EXCEPTION";
        fullMessage += "\nMESSAGE: " + ex.toString();
        for (var p in ex) {
            fullMessage += "\n" + p.toUpperCase() + ": " + ex[p];
        }
        console.log(fullMessage);
}
});

