send_bet <- function(bet,subject_){
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
outMail[["subject"]] = subject_
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

send_bet_gmail <- function(bet,subject)
{
  require(gmailr)
  require(dplyr)
  tryCatch({
  body_ <- "Apuesta: \n"
  for (i in bet){
    body_ <- paste(body_, i, sep = "\n")
  }
  gm_auth_configure(path = "D:\\Users\\rave1\\OneDrive\\Documents\\SendUsingR.json")
  my_email_message <-gm_mime() %>%
    gm_to("rventura1+dscvxxwdjvfkm2z40yde@boards.trello.com") %>%
    gm_from("rventuradiaz@gmail.com") %>%
    gm_subject(subject) %>%
    gm_text_body(body_)
  
    gm_send_message(my_email_message)
    return(0)
  }
  ,error = function(e) 
  {
    print(paste("Error: ",e))
    return(1)
  }
  )
}





