send_bet <- function(bet){
require(RDCOMClient)
body_ <- "Apuesta: \n"
for (i in bet){
  body_ <- paste(body_, i, sep = "\n")
}

## init com api
OutApp <- COMCreate("Outlook.Application")
## create an email 
outMail = OutApp$CreateItem(0)
## configure  email parameter 
outMail[["To"]] = "rventura1+dscvxxwdjvfkm2z40yde@boards.trello.com"
outMail[["subject"]] = "TOMORROW 08:00 - APUESTA PRIMITIVA"
outMail[["body"]] = body_
# outMail[["SentOnBehalfOfName"]] = from_
## send it                     
tryCatch({
  outMail$Send()
  return(0)
  }
,error = function(e) 
{
  print(paste("Error: ",e))
  return(1)
}
)
} 





