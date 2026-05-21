
# **************************** Notas de la versión *************************
# version 4.0; 04/11/2016
#   Sobre muestreo de los resultados de 2016 (x3 en lugar de x2)
#   Cambio parámetro visualización par(mfrow = c(2, 2))
#   Histograma datos resultados de sorteos de 2016
# version 5.0; 07/11/2016
#   L. 20 - L.30: Se define último sorteo (sorteos_anteriores[1,]) y se pone el resultado del último sorteo 
#   por el orden de aparición
#   L.119 y ss: Se cambia el loop while por un loop repeat; la condición de salida es: 
#     1) El valor del muestreo no es repetido y, 
#     2) no ha salido en el sorteo anterior en el mismo orden de aparición
# Versión 5.1: 16/11/2016
#   L. 20: Crear función in.draw, que determine que la secuencia de números no se ha repetido en
#   los sorteos anteriores
#   L. 225-240: Modificar la condición if de los bucles repeat con la expresión 
#   !in.draw(muestra=as.vector(vales[i,]), orden=2, sorteos_anteriores)&!(vales[i,2] %in% as.vector(vales[i,c(1,3:6)]))ç
# version 5.2: 21/11/2016
#   Añadir un ciclo repeat para probar que la muestra no está entre los resultados de sorteos anteriores
#   Versión 5.3: 27/11/2016: Modificar la función in.draw para modificar el límite inferior
#   Version 5.4: 02/12/2016: Modificar condición de parada del ciclo repeat:
#                 not (igual que algún sorteo AND ( se repita 1-2 OR se repita 2-3 OR se repita 3-4
#                        OR se repita 4-5 OR se repita  6-5 de alguno de los sorteos)
#   Version 5.6: 08/12/2016: Modificar condición de parada del bucle repeat para descartar las combinaciones
#                           de cuatro/cinco y seis secuencias
#                           Modificar los vectores xx e yy para incluir una muestra de los resultados de los
#                           por orden de aparición.
#   Version 5.7: 17/12/2016: Modificar condición de sobre-muestreo de datos de distribución
#   version 6.0: 07/02/2017: Incluir resultados de 2017
#   versión 6.1  03/03/2017: Modificación de la regla de excepción de la muestra de apuestas líneas 197:201
#   versión 6.1  07/03/2017: Modificación de la regla de excepción de la muestra de apuestas líneas 197:201
#   version 6.2  17/03/2017: Añadir una condición de filtro fconx y fcony en las funciones genex y geney: los
#                           muestreos excluyen los valores obtenidos en los pasos previos
#   version 6.3  21/03/2017: Modificar tasa de muestreo en líneas 145-148
#   version 6.3.1 12/04/2017: Invertir la tasa de muestreo
# version 6.4.0 14/07/2019: Modificar la ponderación del muestreo de números, usando una función exponencial,
# en lugar de un entero
#   version 6.4.1 20/08/2019: Se modifica nuevamente la ponderación Q4(5), Q3(3), Q1(2), Q1(1)
#   version 6.5.0 Se obtienen mínimos y máximos locales y se definen muestros basados en varias distribuciones normales, basados
#   en https://stackoverflow.com/a/6836924
#   version 6.6.0: Usar 
# **************************************************************************


library(stats)
setwd("D:/Dropbox/R/projects/loteria")
cPath <- getwd()
source(paste(cPath,"/src/fnc_logger.R",sep = ""))
source("loteria_sorteos_estadisticas.R") # Obtiene los sorteos de la web de loterias y genera el fichero sorteos.txt
if(!exists("Findex")) Findex <- readRDS(file = "findexNumber.rds") 



logFile <- file(get_log_file_name(), open = "at")
sink(file = logFile, type = "message")


Fibonacci <- function(N) {
  sf <- c()
  n <- 1
  N <- as.integer(N)
  if (N < 1) {
    stop("Proporcione valores enteros positivos para 'n'")
  }
  
  f1 <- -1
  f2 <- 1
  while (n <= N) {
    fn <- f1 + f2
    n <- n + 1
    sf <- append(sf, fn)
    f1 <- f2
    f2 <- fn
  }
  return(sf)
}

in.draw<- function(muestra, orden=6, msorteo, limInf=1){
  indraw <- c(1)
  for (i in 1:nrow(msorteo)){
    for(j in orden:limInf){
      if(muestra[[j]] %in% as.vector(msorteo[i,j])){
        indraw <- append(indraw,1)
      } else{ indraw <- append(indraw,0)}
    }
  }
  logindraw <- as.logical(prod(indraw))
  return(logindraw)
}

is_unique <- function(x){
  sumprod <- table(x)
  return(sumprod)
}


logit("Step: ","Leer sorteos anteriores")

# Leer resultados del sorteo
serie_numero<- read.table("sorteos.txt", 
                          header=TRUE)

# ************************************************************************************************
# Taken from "https://m$valuesianblog.wordpress.com/2016/09/05/conditional-sampling/"

# zigma=c(9,1,-.9*sqrt(1*9))
# 
# geney=function(x,n=1){
#   return(rnorm(n,mean=zigma[3]*x/zigma[1],sd=sqrt(zigma[2]-
#                                                     zigma[3]^2/zigma[1])))}
# genex=function(y,n=1){
#   return(rnorm(n,mean=zigma[3]*y/zigma[2],sd=sqrt(zigma[1]-
#                                                     zigma[3]*zigma[3]/zigma[2])))}
# targ=function(x,y){ log(x^2*y^4)+x^2*cos(x^2)/y*sin(y^2)}
# 
# T=1e4;N=1e3
# vales=matrix(0,N,3)
# for (i in 1:N){
#   xx=rnorm(T,sd=sqrt(zigma[1]))
#   vales[i,1]=mean(targ(xx,geney(xx,n=T)))
#   xx=rep(rnorm(T/10,sd=sqrt(zigma[1])),10)
#   vales[i,2]=mean(targ(xx,geney(xx,n=T)))
#   yy=rep(rnorm(T/10,sd=sqrt(zigma[2])),10)
#   vales[i,3]=mean(targ(genex(yy,n=T),yy))}
# ************************************************************************************************

# I modify the function to reflect the variance: 98 Y's per each X's

# Define a target function

# 2) Need to generate a geney 
 geney=function(x,n=1, fcony=list(NA)){
   x.subset<-subset(x,!(x %in% fcony))  #versión 6.2
   return(sort(sample(x.subset,size = n, replace=TRUE)))} #versión 6.2
# 3) Need to genrate a genex
 genex=function(y,n=1,fconx=list(NA)){
   y.subset<-subset(y,!(y %in% fconx))  #versión 6.2
   return(sort(sample(y.subset, size = n, replace= TRUE)))} #versión 6.2


# Define a target function:

targ=function(x,y){ 
  m = as.vector(append(x, y))
  return(
#    as.integer(mlv(subset(m$values,m$values>=q[1] & m$values<=q[5]), method = "discrete")[1])
     sample(m, size=1, replace=TRUE)
  )
        
  }


Findex <- Findex + 1
saveRDS(Findex,file = "findexNumber.rds")

FValue <- Fibonacci(Findex)
seedvalue <- max(FValue)
set.seed(seedvalue)

logit("Step: ","Preparacion de datos")

# ---- Rolling window: last 5 years from today ----
# seq() produces a vector of integers from (current_year - 4) up to current_year,
# giving exactly 5 values — e.g. in 2026: c(2022, 2023, 2024, 2025, 2026).
# intersect() then clamps to only years that actually have a column in the data,
# so the script stays safe even when the scraper hasn't fetched the latest year yet.
current_year  <- as.integer(format(Sys.Date(), "%Y"))
available_years <- as.integer(sub("year\\.", "", grep("^year\\.", names(serie_numero), value = TRUE)))
window_years  <- sort(intersect(seq(current_year - 4, current_year), available_years))

# ---- Step 1: totals per year ----
# Instead of one variable per year (total.2022.repeticiones, etc.) we use a named list.
# A list in R can hold any type of value and each element can be accessed by a string key.
# paste0("year.", yr) builds the column name dynamically, e.g. "year.2022".
# [[yr_str]] stores or retrieves the element whose key is the year string.
total_rep_by_year <- list()
for (yr in window_years) {
  yr_str <- as.character(yr)
  col    <- paste0("year.", yr)
  total_rep_by_year[[yr_str]] <- apply(as.matrix(serie_numero[[col]]), 2, sum)
}

# ---- Step 2: all-time totals and oversampling (unchanged) ----
total.repeticiones <- apply(as.matrix(serie_numero$Total), 2, sum)
serie_numero["perc.total"] <- NA
serie_numero[, "perc.total"] <- serie_numero[, "Total"] / total.repeticiones
serie_numero["over.sampling"] <- NA

median.serienum <- median(serie_numero$perc.total)
q.serienum <- quantile(serie_numero$perc.total)

serie_numero[serie_numero$perc.total > q.serienum[[4]], "over.sampling"] <- 5
serie_numero[is.na(serie_numero$over.sampling) & (serie_numero$perc.total > q.serienum[[3]]), "over.sampling"] <- 3
serie_numero[is.na(serie_numero$over.sampling) & (serie_numero$perc.total > q.serienum[[2]]), "over.sampling"] <- 2
serie_numero[is.na(serie_numero$over.sampling), "over.sampling"] <- 1

# ---- Step 3: per-year frequency percentages ----
# We loop over the window instead of repeating the same lines for each year.
# serie_numero[[col]] lets us use a variable as a column name — $ does not allow this.
for (yr in window_years) {
  yr_str   <- as.character(yr)
  year_col <- paste0("year.", yr)
  perc_col <- paste0("perc.total.", yr)
  serie_numero[perc_col] <- NA
  serie_numero[, perc_col] <- serie_numero[[year_col]] / total_rep_by_year[[yr_str]]
}

# ---- Step 4: per-year oversampling weights ----
# Numbers that appeared more than expected (top quartile) are oversampled 5x,
# then 3x, then 2x, and everything else stays at 1x.
for (yr in window_years) {
  os_col   <- paste0("over.sampling.", yr)
  perc_col <- paste0("perc.total.", yr)
  q <- quantile(serie_numero[[perc_col]])

  serie_numero[, os_col] <- 1
  serie_numero[serie_numero[[perc_col]] > q[[4]], os_col] <- 5
  serie_numero[serie_numero[[perc_col]] > q[[3]] & serie_numero[[perc_col]] <= q[[4]], os_col] <- 3
  serie_numero[serie_numero[[perc_col]] > q[[2]] & serie_numero[[perc_col]] <= q[[3]], os_col] <- 2
}

# ---- Step 5: all-time sampling series (used as the global pool in the loop below) ----
serie_sorteos <- rep(serie_numero[1, "Numero"], as.integer(serie_numero[1, "Total"] * serie_numero[1, "over.sampling"]))
for (i in 2:49) {
  serie_sorteos <- append(serie_sorteos,
                          rep(serie_numero[i, "Numero"],
                              serie_numero[i, "Total"] * serie_numero[i, "over.sampling"]))
}

# ---- Step 6: per-year sampling series stored in a named list ----
# serie_sorteos_by_year[["2024"]] replaces what used to be the variable serie_sorteos.2024.
# Each element is a vector where every lottery number appears as many times as it was
# drawn that year, scaled by its oversampling weight.
serie_sorteos_by_year <- list()
for (yr in window_years) {
  yr_str   <- as.character(yr)
  year_col <- paste0("year.", yr)
  os_col   <- paste0("over.sampling.", yr)

  sv <- rep(serie_numero[1, "Numero"],
            as.integer(serie_numero[1, year_col] * serie_numero[1, os_col]))
  for (i in 2:49) {
    sv <- append(sv, rep(serie_numero[i, "Numero"],
                         as.integer(serie_numero[i, year_col] * serie_numero[i, os_col])))
  }
  serie_sorteos_by_year[[yr_str]] <- sv
}

# ---- Step 7: current and previous year sampling pools ----
# Use the most recent year present in window_years, not the calendar year,
# so this works even when the scraper data lags behind the current date.
semana  <- as.integer(strftime(Sys.Date(), format = "%V"))
yr_now  <- as.character(max(window_years))
yr_prev <- as.character(max(window_years) - 1)

sorteo_anyo_actual <- if (semana < 40 && yr_prev %in% names(serie_sorteos_by_year)) {
  append(serie_sorteos_by_year[[yr_now]], serie_sorteos_by_year[[yr_prev]])
} else {
  serie_sorteos_by_year[[yr_now]]
}
if (length(serie_sorteos_by_year[[yr_prev]])>0){
  sorteo_anyo_anterior <- serie_sorteos_by_year[[yr_prev]]
} else {
  sorteo_anyo_anterior <- sorteos_anteriores
}


logit("Step: ","Generar poblacion")
#Lottery follows a uniform distribution
T=1e4;N=2000; M=100
vales=matrix(0,N,6) # Now, we define a matrix with six columns
for (i in 1:N){
  repeat {
  xx=sort(sample(serie_sorteos, M, replace = FALSE))
  xx=append(xx, sample(as.vector(sorteos_anteriores[,1]),M/2,replace=FALSE))
  vales[i,1]<-sorteos_anteriores[1,1]
  repeat { vales[i,1]=targ(xx,geney(xx,n=N))[[1]]; if (vales[i,1] != sorteos_anteriores[1,1]){break}}
  xx=sort(rep(sample(serie_sorteos, M, replace = FALSE),10))
  vales[i,2] <- vales[i,1]
  # repeat {vales[i,2]=targ(xx,geney(xx,n=T))[[1]];if(!(vales[i,2] %in% as.vector(vales[i,c(1,3:6)])) & (vales[i,2] != sorteos_anteriores[1,2])){break}}
  xx=append(xx, rep(sample(as.vector(sorteos_anteriores[,2]),M/2,replace=FALSE),10))
  fcony<- as.list(vales[i,1:1]) #versión 6.2
  repeat {vales[i,2]=targ(xx,geney(xx,n=T,fcony))[[1]];if(!(vales[i,2] %in% as.vector(vales[i,c(1,3:6)]))){break}} #versión 6.2
  
  yy=append(sort(rep(sample(sorteo_anyo_anterior, M, replace = FALSE),10)),sort(rep(sample(sorteo_anyo_actual, M, replace = FALSE),10)))
  valuey=yy
  vales[i,3] <- vales[i,2]
  valuey=append(valuey, rep(sample(as.vector(sorteos_anteriores[,3]),M/2,replace=FALSE),10))  
  # repeat{vales[i,3]=targ(xx,geney(xx,n=T))[[1]];if(!(vales[i,3] %in% as.vector(vales[i,c(1:2,4:6)])) & (vales[i,3] != sorteos_anteriores[1,3])){break}}
  fcony<- as.list(vales[i,1:2]) #versión 6.2
  repeat{vales[i,3]=targ(xx,geney(xx,n=T,fcony))[[1]];if(!(vales[i,3] %in% as.vector(vales[i,c(1:2,4:6)]))){break}} #versión 6.2
  vales[i,4] <- vales[i,3]
  valuey=yy
  valuey=append(valuey, rep(sample(as.vector(sorteos_anteriores[,4]),M/2,replace=FALSE),10))  
  # repeat{vales[i,4]=targ(sort(genex(yy,n=T)),valuey)[[1]];if(!(vales[i,4] %in% as.vector(vales[i,c(1:3,5:6)])) & (vales[i,4] != sorteos_anteriores[1,4])){break}}
  fcony<- as.list(vales[i,1:3]) #versión 6.2
  repeat{vales[i,4]=targ(sort(genex(yy,n=T,fcony)),valuey)[[1]];if(!(vales[i,4] %in% as.vector(vales[i,c(1:3,5:6)]))){break}} #versión 6.2
  vales[i,5] <- vales[i,4]
  valuey=yy
  valuey=append(valuey, rep(sample(as.vector(sorteos_anteriores[,5]),M/2,replace=FALSE),10))  
  # repeat{vales[i,5]=targ(sort(genex(yy,n=T)),valuey)[[1]];if(!(vales[i,5] %in% as.vector(vales[i,c(1:4,6)])) & (vales[i,5] != sorteos_anteriores[1,5])){break}}
  fcony<- as.list(vales[i,1:4]) #versión 6.2
  repeat{vales[i,5]=targ(sort(genex(yy,n=T,fcony)),valuey)[[1]];if(!(vales[i,5] %in% as.vector(vales[i,c(1:4,6)]))){break}} #versión 6.2
  vales[i,6] <- vales[i,5]
  valuey=yy
  valuey=append(valuey, rep(sample(as.vector(sorteos_anteriores[,6]),M/2,replace=FALSE),10))  
  # repeat{vales[i,6]=targ(sort(genex(yy,n=T)),valuey)[[1]];if(!(vales[i,6] %in% as.vector(vales[i,c(1:5)])) & (vales[i,6] != sorteos_anteriores[1,6])){break}}
  fcony<- as.list(vales[i,1:5]) #versión 6.2
  repeat{vales[i,6]=targ(sort(genex(yy,n=T,fcony)),valuey)[[1]];if(!(vales[i,6] %in% as.vector(vales[i,c(1:5)]))){break}} #versión 6.2
  if(
      !(in.draw(muestra=as.vector(vales[i,]), orden=6, sorteos_anteriores, limInf = 1))
      |
      !(in.draw(muestra=as.vector(vales[i,]), orden=6, sorteos_anteriores, limInf = 2))
      |
      !(in.draw(muestra=as.vector(vales[i,]), orden=6, sorteos_anteriores, limInf = 3))
      |
      !(in.draw(muestra=as.vector(vales[i,]), orden=5, sorteos_anteriores, limInf = 1))      
      |
      !(in.draw(muestra=as.vector(vales[i,]), orden=5, sorteos_anteriores, limInf = 2))      
      |
      !(in.draw(muestra=as.vector(vales[i,]), orden=4, sorteos_anteriores, limInf = 1))      
      
    )
    {break}
  } 
}

# &
#   (in.draw(muestra=as.vector(vales[i,]), orden=6, sorteos_anteriores, limInf = 5)|
#      in.draw(muestra=as.vector(vales[i,]), orden=5, sorteos_anteriores, limInf = 4)|
#      in.draw(muestra=as.vector(vales[i,]), orden=4, sorteos_anteriores, limInf = 3)|
#      in.draw(muestra=as.vector(vales[i,]), orden=3, sorteos_anteriores, limInf = 2)             
#   ) 

# hist(as.vector(vales),breaks = as.vector(seq(1,49,by=1)), xlab=NA, ylab=NA, main=paste('sorteo: ','muestra'), 
#      cex.axis=0.5, font.main=1, cex.main=0.8)
source(paste(cPath,"/src/function_avg_timesInRaw.R",sep = ""))
source(paste(cPath,"/src/fnc_check_bet.R",sep = ""))
source(paste(cPath,"/src/fnc_send_email.R",sep = ""))


for (j in c(1:3))
{

logit("Step: ","generar apuesta")
# undebug(avg_timesInRaw)
k <- 0
set_apuesta <- list()
diff_ap <- 1e5
repeat {
    repeat {
    # Select one sample
    for (i in as.list(sort(sample(seq(1, N, by=1), 1))) ){
      if(checkBetIsDistinct(vales[i,]))apuesta <- sort(vales[i,])
    }
    
    # Define an array to flag whether a number in bet has more appereances than last year
    below_maxdraws <- c()
    
    for (i in c(1:length(apuesta))){
      metadata_apuesta <- list()
      metadata_apuesta$apuesta <- list(apuesta)
      # Select bet element
      compo <- apuesta[i]
      metadata_apuesta$seleccion <- compo
      # Get the average time element appears in draw last year
      if (exists("sorteo_anyo_anterior", mode = "numeric") & length(sorteo_anyo_anterior)>0) {
        rep_last_year <- avg_timesInRaw(x = compo, year = as.integer(strftime(Sys.Date(), format = "%Y"))-1, sorteo_anyo_anterior )
      } else {
        rep_last_year <- 0
      }
      
      
      if(!exists("rep_2019",mode = "numeric")) rep_2019 <- readRDS(file = "rep2019.rds")
      
      metadata_apuesta$rep_2019 <- rep_2019
      
      
      # Get the average occurence an element appear in draw in current year
      if (exists("sorteo_anyo_actual", mode = "numeric") & length(sorteo_anyo_actual)> 0){
        rep_current_year <- avg_timesInRaw( x = compo, current_year,sorteo_anyo_actual)   
      } else {
        rep_current_year <- 0
      }
      
      
      metadata_apuesta$rep_current_year <- rep_current_year
      
      # Calculate difference between last and current year
      dif_rep <- as.numeric(rep_current_year) - (as.numeric(rep_last_year)/52.0)*as.integer(strftime(Sys.Date(), format = "%V"))
      
      metadata_apuesta$difference <- dif_rep
      
      if (dif_rep < 0){
        below_maxdraws <- append(below_maxdraws, 1)
      } else {
        below_maxdraws <- append(below_maxdraws, 0)
      }
    }
    
    
    if (length(is_unique(c(unlist(metadata_apuesta)[1:6])))==6)  {
      if((metadata_apuesta$difference < diff_ap) & (max(table(apuesta))==1) ) diff_ap <- metadata_apuesta$difference
      set_apuesta$apuesta <- append(set_apuesta$apuesta, as.vector(unlist(metadata_apuesta[1])))
      set_apuesta$diff <- append(set_apuesta$diff, as.vector(unlist(metadata_apuesta[5])))
    }
      
    if ((sum(below_maxdraws)==6 )){
      index <- match(diff_ap, set_apuesta$diff)
      mat_apuesta <- matrix(ncol= 6, set_apuesta$apuesta, byrow = FALSE)
      bet <- sort(mat_apuesta[index,])
      logit("Bet: ",cat(bet))
      break
    }
    
    if (k > 100){
      index <- match(diff_ap, set_apuesta$diff)
      mat_apuesta <- matrix(ncol= 6, set_apuesta$apuesta, byrow = FALSE)
      bet <- sort(mat_apuesta[index,])
      logit("Bet: ",cat(bet))
      break
    }
    
    k <- k+1
}
if(checkBetIsDistinct(bet)){break}
}
# cat("Apuesta", sep = "\n")
# cat(bet, sep = "\n")

logit("Step: ","Enviar apuestas a Trello")


subject <- switch(j, "NEXT MONDAY 08:00 - APUESTA PRIMITIVA", "NEXT THURSDAY 08:00 - APUESTA PRIMITIVA", "NEXT SATURDAY 08:00 - APUESTA PRIMITIVA")

# debug(send_bet_gmail)
send_bet_gmail(bet, subject)
}

logit("Step: ","Guardar datos sorteos anteriores")

saveRDS(rep_2019, file = "rep2019.rds")

## reset message sink and close the file connection
sink(type="message")
close(logFile)
