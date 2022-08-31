# install.packages("ggvis")
library(rvest)
library(plyr)
library(dplyr)
library(ggvis)
library(knitr)
options(digits = 4)

# Let phantomJS scrape techstars, output is written to techstars.html
system("./phantomjs scrape_loterias.js")



# url_sorteo <- paste(url_domain,numero_sorteo,sep = "")
resultados_sorteos_primitiva <- read_html("loterias.html") %>%
  html_nodes(xpath = '//*[@class="c-resultados-buscador__primitiva c-resultado-sorteo--primitiva"]') %>%
  html_nodes(xpath = '//*[@class="c-resultado-sorteo__primitiva"]') %>%
  html_nodes(xpath = '//*[@class="c-resultado-sorteo__combinacion--primitiva"]') %>%
  html_nodes('li') %>%
  html_text() %>%
  as.integer() %>%
  matrix(ncol = 6, byrow = TRUE)

  resultados_sorteos_primitiva <- resultados_sorteos_primitiva[seq(1,nrow(resultados_sorteos_primitiva),2),]


fecha_sorteos_primitiva <- read_html("loterias.html") %>%
  html_nodes(xpath = '//*[@class="c-resultados-buscador__primitiva c-resultado-sorteo--primitiva"]') %>%
  html_nodes(xpath = '//*[@class="c-resultado-sorteo__primitiva"]') %>%
  html_nodes(xpath = '//*[@class="c-resultado-sorteo__cabecera--primitiva"]') %>%
  html_nodes(xpath = '//*[@class="c-resultado-sorteo__fecha"]') %>%
  html_text()

complementario_sorteos_primitiva <- read_html("loterias.html") %>%
  html_nodes(xpath = '//*[@class="c-resultados-buscador__primitiva c-resultado-sorteo--primitiva"]') %>%
  html_nodes(xpath = '//*[@class="c-resultado-sorteo__complementario"]') %>%
  html_nodes(xpath = '//*[@class="c-resultado-sorteo__complementario-li--primitiva"]') %>%
  html_text() %>%
  as.integer()

reintegro_sorteos_primitiva <- read_html("loterias.html") %>%
  html_nodes(xpath = '//*[@class="c-resultados-buscador__primitiva c-resultado-sorteo--primitiva"]') %>%
  html_nodes(xpath = '//*[@class="c-resultado-sorteo__reintegro"]') %>%
  html_nodes(xpath = '//*[@class="c-resultado-sorteo__reintegro-li--primitiva"]') %>%
  html_text() %>%
  as.integer()


n_sorteos <- nrow(resultados_sorteos_primitiva)


for (i in n_sorteos:1) {
# i<-1
    sorteo <- data.frame(resultados_sorteos_primitiva[i,1]
           , resultados_sorteos_primitiva[i,2]
           , resultados_sorteos_primitiva[i,3]
           , resultados_sorteos_primitiva[i,4]
           , resultados_sorteos_primitiva[i,5]
           , resultados_sorteos_primitiva[i,6]
           , complementario_sorteos_primitiva[[i]]
           , reintegro_sorteos_primitiva[[i]]
           , fecha_sorteos_primitiva[[i]]
           ,stringsAsFactors = FALSE, fix.empty.names = FALSE)

    names(sorteo) <- c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9")
    
   if (!(fecha_sorteos_primitiva[[i]] %in%(sorteo_anterior$V9))) {
     sorteo_anterior <- rbind(sorteo_anterior, sorteo)}else{
       next}
 

}


sorteos_anteriores <-  as.matrix(sorteo_anterior[,1:8],1:8) 

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

