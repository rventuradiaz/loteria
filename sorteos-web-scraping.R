# install.packages("rvest")
library(rvest)
library(V8)

url_initial <- "https://www.loteriasyapuestas.es/es/resultados/primitiva"

url_mas_informacion <- url_initial %>% 
  read_html()

mas_informacion <- url_mas_informacion %>% 
  html_node(xpath = '//*[@id="lastResultsMoreInfoLink"]') %>% 
  html_attr(name = "href")

url_domain <- "http://www.loteriasyapuestas.es"
numero_sorteo <- mas_informacion

# url_sorteo <- paste(url_domain,numero_sorteo,sep = "")
url_sorteo <- url_initial
sorteos_primitiva <- url_sorteo %>% read_html()
fecha_sorteo <- sorteos_primitiva %>%
  html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[1]/div/h2") %>%
  html_text()
combinacion_ganadora <- sorteos_primitiva %>% 
  html_nodes(xpath = "/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[2]/ul[2]/li") %>%
  html_text() %>%
  as.numeric()
View(complementario) <- sorteos_primitiva %>% 
  # html_nodes('li') %>%
  html_nodes('script') %>%
  html_text()
ct<- v8() #initialize interface
read_html(ct$eval(gsub(
  'document.write','',complementario
)
                  )) %>%
  html_text()
reintegro <- sorteos_primitiva %>%
  html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[4]/ul/li/span") %>%
  html_text() %>%
  as.numeric()

# sorteo_anterior <- data.frame(combinacion_ganadora[[1]]
#                               , combinacion_ganadora[[2]]
#                               , combinacion_ganadora[[3]]
#                               , combinacion_ganadora[[4]]
#                               , combinacion_ganadora[[5]]
#                               , combinacion_ganadora[[6]]
#                               , complementario
#                               , reintegro
#                               , fecha_sorteo
#                               ,stringsAsFactors = FALSE, fix.empty.names = FALSE)
# names(sorteo_anterior) <- c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9")

ultimo_sorteo <- 3102

for (i in 860:1) {

    numero_sorteo <- sorteos_primitiva %>%
    html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[2]/div[1]/a") %>%
    html_attr(name="href")
    
    print(paste("i = ",as.character(i),sep=""))
    print(numero_sorteo)
    
  
  url_sorteo <- paste(url_domain,numero_sorteo,sep = "")
  
  sorteos_primitiva <- url_sorteo %>%
    html()
  
    fecha_sorteo <- sorteos_primitiva %>%
      html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[1]/div/h2") %>%
      html_text()

    combinacion_ganadora <- sorteos_primitiva %>% 
      html_nodes(xpath = "/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[2]/ul[2]/li") %>%
      html_text() %>%
  
      as.numeric()

    complementario <- sorteos_primitiva %>% 
  
      html_nodes(xpath = "/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/ul/li/span") %>%
  
      html_text() %>%
  
      as.numeric()

    reintegro <- sorteos_primitiva %>%
  
      html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[4]/ul/li/span") %>%
  
      html_text() %>%
  
      as.numeric()


    sorteo <- data.frame(combinacion_ganadora[[1]]
           , combinacion_ganadora[[2]]
           , combinacion_ganadora[[3]]
           , combinacion_ganadora[[4]]
           , combinacion_ganadora[[5]]
           , combinacion_ganadora[[6]]
           , complementario
           , reintegro
           , fecha_sorteo
           ,stringsAsFactors = FALSE, fix.empty.names = FALSE)

    names(sorteo) <- c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9")
    
   if (!(fecha_sorteo %in%(sorteo_anterior$V9))) {
     sorteo_anterior <- rbind(sorteo_anterior, sorteo)}else{
       break}
 

}

sorteos_anteriores <- sorteo_anterior[,1:8] %>% as.matrix(,1:8) 

saveRDS(sorteos_anteriores, file="sorteos-anteriores.rds")


# ## Primer sorteo de 2017
# paste(url_domain,"/es/la%2Dprimitiva/sorteos/2017/968604001", sep = "")
# 
# ## 2016
#                  
# numero_sorteo <- "/es/la-primitiva/sorteos/2016/968104105" #ultimo sorteo 2016
# 
# for (i in 105:1) {
#   
#   print(numero_sorteo)
#   
#   url_sorteo <- paste(url_domain,numero_sorteo,sep = "")
#   
#   sorteos_primitiva <- url_sorteo %>%
#     html()
#   
#   fecha_sorteo <- sorteos_primitiva %>%
#     html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[1]/div/h2") %>%
#     html_text()
#   
#   combinacion_ganadora <- sorteos_primitiva %>% 
#     html_nodes(xpath = "/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[2]/ul[2]/li") %>%
#     html_text() %>%
#     
#     as.numeric()
#   
#   complementario <- sorteos_primitiva %>% 
#     
#     html_nodes(xpath = "/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/ul/li/span") %>%
#     
#     html_text() %>%
#     
#     as.numeric()
#   
#   reintegro <- sorteos_primitiva %>%
#     
#     html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[4]/ul/li/span") %>%
#     
#     html_text() %>%
#     
#     as.numeric()
#   
#   
#   sorteo <- data.frame(combinacion_ganadora[[1]]
#                        , combinacion_ganadora[[2]]
#                        , combinacion_ganadora[[3]]
#                        , combinacion_ganadora[[4]]
#                        , combinacion_ganadora[[5]]
#                        , combinacion_ganadora[[6]]
#                        , complementario
#                        , reintegro
#                        , fecha_sorteo
#                        ,stringsAsFactors = FALSE, fix.empty.names = FALSE)
#   
#   names(sorteo) <- c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9")
#   
#   sorteo_anterior <- rbind(sorteo_anterior, sorteo)
#   
#   numero_sorteo <- sorteos_primitiva %>%
#     html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[2]/div[1]/a") %>%
#     html_attr(name="href")
#   
# }
# 
# ## Primer sorteo de 2016
# paste(url_domain,"/es/la%2Dprimitiva/sorteos/2016/931704001", sep = "")
# 
# ## 2015
# 
# numero_sorteo <- "/es/la-primitiva/sorteos/2015/931504105" #ultimo sorteo 2015
# 
# for (i in 105:1) {
#   
#   print(numero_sorteo)
#   
#   url_sorteo <- paste(url_domain,numero_sorteo,sep = "")
#   
#   sorteos_primitiva <- url_sorteo %>%
#     html()
#   
#   fecha_sorteo <- sorteos_primitiva %>%
#     html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[1]/div/h2") %>%
#     html_text()
#   
#   combinacion_ganadora <- sorteos_primitiva %>% 
#     html_nodes(xpath = "/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[2]/ul[2]/li") %>%
#     html_text() %>%
#     
#     as.numeric()
#   
#   complementario <- sorteos_primitiva %>% 
#     
#     html_nodes(xpath = "/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/ul/li/span") %>%
#     
#     html_text() %>%
#     
#     as.numeric()
#   
#   reintegro <- sorteos_primitiva %>%
#     
#     html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[4]/ul/li/span") %>%
#     
#     html_text() %>%
#     
#     as.numeric()
#   
#   
#   sorteo <- data.frame(combinacion_ganadora[[1]]
#                        , combinacion_ganadora[[2]]
#                        , combinacion_ganadora[[3]]
#                        , combinacion_ganadora[[4]]
#                        , combinacion_ganadora[[5]]
#                        , combinacion_ganadora[[6]]
#                        , complementario
#                        , reintegro
#                        , fecha_sorteo
#                        ,stringsAsFactors = FALSE, fix.empty.names = FALSE)
#   
#   names(sorteo) <- c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9")
#   
#   sorteo_anterior <- rbind(sorteo_anterior, sorteo)
#   
#   numero_sorteo <- sorteos_primitiva %>%
#     html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[2]/div[1]/a") %>%
#     html_attr(name="href")
#   
# }
# 
# ## Primer sorteo de 2014
# paste(url_domain,"/es/la%2Dprimitiva/sorteos/2015/895104001", sep = "")
# 
# numero_sorteo <- "/es/la-primitiva/sorteos/2014/894604104"
# ## 2014
# 
# for (i in 104:1) {
#   
#   print(numero_sorteo)
#   
#   url_sorteo <- paste(url_domain,numero_sorteo,sep = "")
#   
#   sorteos_primitiva <- url_sorteo %>%
#     html()
#   
#   fecha_sorteo <- sorteos_primitiva %>%
#     html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[1]/div/h2") %>%
#     html_text()
#   
#   combinacion_ganadora <- sorteos_primitiva %>% 
#     html_nodes(xpath = "/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[2]/ul[2]/li") %>%
#     html_text() %>%
#     
#     as.numeric()
#   
#   complementario <- sorteos_primitiva %>% 
#     
#     html_nodes(xpath = "/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/ul/li/span") %>%
#     
#     html_text() %>%
#     
#     as.numeric()
#   
#   reintegro <- sorteos_primitiva %>%
#     
#     html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[4]/ul/li/span") %>%
#     
#     html_text() %>%
#     
#     as.numeric()
#   
#   
#   sorteo <- data.frame(combinacion_ganadora[[1]]
#                        , combinacion_ganadora[[2]]
#                        , combinacion_ganadora[[3]]
#                        , combinacion_ganadora[[4]]
#                        , combinacion_ganadora[[5]]
#                        , combinacion_ganadora[[6]]
#                        , complementario
#                        , reintegro
#                        , fecha_sorteo
#                        ,stringsAsFactors = FALSE, fix.empty.names = FALSE)
#   
#   names(sorteo) <- c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9")
#   
#   sorteo_anterior <- rbind(sorteo_anterior, sorteo)
#   
#   numero_sorteo <- sorteos_primitiva %>%
#     html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[2]/div[1]/a") %>%
#     html_attr(name="href")
#   
# }
# 
# numero_sorteo <- "/es/la-primitiva/sorteos/2013/858204104" # ultimo sorteo 2013
# 
# # 104 sorteos
# 
# ## 2013:
# for (i in 104:1) {
#   
#   print(numero_sorteo)
#   
#   url_sorteo <- paste(url_domain,numero_sorteo,sep = "")
#   
#   sorteos_primitiva <- url_sorteo %>%
#     html()
#   
#   fecha_sorteo <- sorteos_primitiva %>%
#     html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[1]/div/h2") %>%
#     html_text()
#   
#   combinacion_ganadora <- sorteos_primitiva %>% 
#     html_nodes(xpath = "/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[2]/ul[2]/li") %>%
#     html_text() %>%
#     
#     as.numeric()
#   
#   complementario <- sorteos_primitiva %>% 
#     
#     html_nodes(xpath = "/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/ul/li/span") %>%
#     
#     html_text() %>%
#     
#     as.numeric()
#   
#   reintegro <- sorteos_primitiva %>%
#     
#     html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[4]/ul/li/span") %>%
#     
#     html_text() %>%
#     
#     as.numeric()
#   
#   
#   sorteo <- data.frame(combinacion_ganadora[[1]]
#                        , combinacion_ganadora[[2]]
#                        , combinacion_ganadora[[3]]
#                        , combinacion_ganadora[[4]]
#                        , combinacion_ganadora[[5]]
#                        , combinacion_ganadora[[6]]
#                        , complementario
#                        , reintegro
#                        , fecha_sorteo
#                        ,stringsAsFactors = FALSE, fix.empty.names = FALSE)
#   
#   names(sorteo) <- c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9")
#   
#   sorteo_anterior <- rbind(sorteo_anterior, sorteo)
#   
#   numero_sorteo <- sorteos_primitiva %>%
#     html_nodes(xpath="/html/body/div[2]/div[2]/div[1]/div[2]/div/div[2]/div[1]/a") %>%
#     html_attr(name="href")
#   
# }

