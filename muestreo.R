
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
# **************************************************************************


library(stats)

# Findex <- 0

Fibonacci <- function(N) {
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
    print(fn)
    f1 <- f2
    f2 <- fn
  }
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

# source("loteria_sorteos_estadisticas.R") # Obtiene los sorteos de la web de loterias y genera el fichero sorteos.txt

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
max(Fibonacci(Findex))
set.seed(Fibonacci(Findex))

# Create an oversample of less frequent numbers
total.repeticiones<-apply(as.matrix(serie_numero$Total), 2, sum)
total.2016.repeticiones<-apply(as.matrix(serie_numero$year.2016), 2, sum)
total.2017.repeticiones<-apply(as.matrix(serie_numero$year.2017), 2, sum) # v6.0
total.2018.repeticiones<-apply(as.matrix(serie_numero$year.2018), 2, sum) # v6.0
total.2019.repeticiones<-apply(as.matrix(serie_numero$year.2019), 2, sum) # v6.0

serie_numero["perc.total"]<-NA
serie_numero["perc.total.2016"]<-NA
serie_numero["perc.total.2017"]<-NA
serie_numero["perc.total.2018"]<-NA
serie_numero["perc.total.2019"]<-NA
serie_numero[,"perc.total"]<-serie_numero[,"Total"]/total.repeticiones
serie_numero[,"perc.total.2016"]<-serie_numero[,"year.2016"]/total.2016.repeticiones
serie_numero[,"perc.total.2017"]<-serie_numero[,"year.2017"]/total.2017.repeticiones
serie_numero[,"perc.total.2018"]<-serie_numero[,"year.2018"]/total.2018.repeticiones
serie_numero[,"perc.total.2019"]<-serie_numero[,"year.2019"]/total.2019.repeticiones
serie_numero["over.sampling"]<-NA

median.serienum<-median(serie_numero$perc.total)

q.serienum <-quantile(serie_numero$perc.total)
serie_numero["over.sampling.2016"]<-1
serie_numero[serie_numero$perc.total>q.serienum[[4]],"over.sampling"]<-5
serie_numero[is.na(serie_numero$over.sampling)&(serie_numero$perc.total>q.serienum[[3]]),"over.sampling"]<-3
serie_numero[is.na(serie_numero$over.sampling)&(serie_numero$perc.total>q.serienum[[2]]),"over.sampling"]<-2
serie_numero[is.na(serie_numero$over.sampling),"over.sampling"]<-1


q.serienum2016 <-quantile(serie_numero$perc.total.2016)
serie_numero[serie_numero$perc.total.2016>q.serienum2016[[4]],"over.sampling.2016"]<-1
serie_numero[is.na(serie_numero$over.sampling.2016)&(serie_numero$perc.total.2016>q.serienum2016[[3]]),"over.sampling.2016"]<-1
serie_numero[is.na(serie_numero$over.sampling.2016)&(serie_numero$perc.total.2016>q.serienum2016[[2]]),"over.sampling.2016"]<-1
serie_numero[is.na(serie_numero$over.sampling.2016),"over.sampling.2016"]<-1

# serie_numero["over.sampling.2017"]<-NA
q.serienum2017 <-quantile(serie_numero$perc.total.2017)
q.serienum2018 <-quantile(serie_numero$perc.total.2018)
q.serienum2019 <-quantile(serie_numero$perc.total.2019)

serie_numero[,"over.sampling.2017"]<-1
serie_numero[is.na(serie_numero$over.sampling.2017)&(serie_numero$perc.total.2017>=q.serienum2017[[1]]),"over.sampling.2017"]<-1
serie_numero[is.na(serie_numero$over.sampling.2017)&(serie_numero$perc.total.2017>q.serienum2017[[2]]),"over.sampling.2017"]<-2
serie_numero[is.na(serie_numero$over.sampling.2017)&(serie_numero$perc.total.2017>q.serienum2017[[3]]),"over.sampling.2017"]<-3
serie_numero[serie_numero$perc.total.2017>q.serienum2017[[4]],"over.sampling.2017"]<-5

serie_numero[,"over.sampling.2018"]<-5
serie_numero[is.na(serie_numero$over.sampling.2018)&(serie_numero$perc.total.2018>=q.serienum2018[[1]]),"over.sampling.2018"]<-1
serie_numero[is.na(serie_numero$over.sampling.2018)&(serie_numero$perc.total.2018>q.serienum2018[[2]]),"over.sampling.2018"]<-2
serie_numero[is.na(serie_numero$over.sampling.2018)&(serie_numero$perc.total.2018>q.serienum2018[[3]]),"over.sampling.2018"]<-3
serie_numero[serie_numero$perc.total.2018>q.serienum2018[[4]],"over.sampling.2018"]<-5

serie_numero[,"over.sampling.2019"]<-5
serie_numero[is.na(serie_numero$over.sampling.2019)&(serie_numero$perc.total.2019>=q.serienum2019[[1]]),"over.sampling.2019"]<-1
serie_numero[is.na(serie_numero$over.sampling.2019)&(serie_numero$perc.total.2019>q.serienum2019[[2]]),"over.sampling.2019"]<-2
serie_numero[is.na(serie_numero$over.sampling.2019)&(serie_numero$perc.total.2019>q.serienum2019[[3]]),"over.sampling.2019"]<-3
serie_numero[serie_numero$perc.total.2019>q.serienum2019[[4]],"over.sampling.2019"]<-5

# table(serie_numero$over.sampling.2016)

# We transform the matrix to obtain six columns
serie_sorteos <- rep(serie_numero[1, "Numero"], as.integer(serie_numero[1,"Total"]*serie_numero[1,"over.sampling"]))
for (i in 2:49){
  serie_sorteos <- append(serie_sorteos, 
                          rep(serie_numero[i, "Numero"], 
                              serie_numero[i,"Total"]*serie_numero[i,"over.sampling"]) ) 
}

serie_sorteos.2016 <- rep(serie_numero[1, "Numero"], as.integer(serie_numero[1,"year.2016"]*serie_numero[1,"over.sampling.2016"]))
for (i in 2:49){
  serie_sorteos.2016 <- append(serie_sorteos.2016, 
                          rep(serie_numero[i, "Numero"], as.integer(serie_numero[i,"year.2016"]*serie_numero[i,"over.sampling.2016"])))  
}

serie_sorteos.2017 <- rep(serie_numero[1, "Numero"], as.integer(serie_numero[1,"year.2017"]*serie_numero[1,"over.sampling.2017"]))
for (i in 2:49){
  serie_sorteos.2017 <- append(serie_sorteos.2017, 
                               rep(serie_numero[i, "Numero"], as.integer(serie_numero[i,"year.2017"]*serie_numero[i,"over.sampling.2017"])))  
}

serie_sorteos.2018 <- rep(serie_numero[1, "Numero"], as.integer(serie_numero[1,"year.2018"]*serie_numero[1,"over.sampling.2018"]))
for (i in 2:49){
  serie_sorteos.2018 <- append(serie_sorteos.2018, 
                               rep(serie_numero[i, "Numero"], as.integer(serie_numero[i,"year.2018"]*serie_numero[i,"over.sampling.2018"])))  
}

serie_sorteos.2019 <- rep(serie_numero[1, "Numero"], as.integer(serie_numero[1,"year.2019"]*serie_numero[1,"over.sampling.2019"]))
for (i in 2:49){
  serie_sorteos.2019 <- append(serie_sorteos.2019, 
                               rep(serie_numero[i, "Numero"], as.integer(serie_numero[i,"year.2019"]*serie_numero[i,"over.sampling.2019"])))  
}

# Calculate vector of quantiles as lottery follows a uniform distribution
par(mfcol=c(2,3), oma=c(1,1,0,0), mar=c(1,1,1,0), tcl=-0.1, mgp=c(0,0,0))


hist(serie_sorteos, breaks = as.vector(seq(1,49,by=1)), xlab=NA, ylab=NA, main=paste('sorteo: ','todos')
     ,cex.axis=0.5, font.main=1, cex.main=0.8)
hist(serie_sorteos.2016, breaks = as.vector(seq(1,49,by=1)), xlab=NA, ylab=NA, main=paste('sorteo: ','2016'), 
     cex.axis=0.5, font.main=1, cex.main=0.8)
hist(serie_sorteos.2017, breaks = as.vector(seq(1,49,by=1)), xlab=NA, ylab=NA, main=paste('sorteo: ','2017'), 
     cex.axis=0.5, font.main=1, cex.main=0.8)
hist(serie_sorteos.2018, breaks = as.vector(seq(1,49,by=1)), xlab=NA, ylab=NA, main=paste('sorteo: ','2018'), 
     cex.axis=0.5, font.main=1, cex.main=0.8)
hist(serie_sorteos.2019, breaks = as.vector(seq(1,49,by=1)), xlab=NA, ylab=NA, main=paste('sorteo: ','2019'), 
     cex.axis=0.5, font.main=1, cex.main=0.8)

# OJO: Cambiar conforme cambie el año
anyo <- as.integer(strftime(Sys.Date(), format = "%Y"))
semana <- as.integer(strftime(Sys.Date(), format = "%V"))
sorteo_anyo_actual <- if(semana < 40 & anyo == 2019 ) {append(serie_sorteos.2018, serie_sorteos.2019)} else {serie_sorteos.2019}
sorteo_anyo_anterior <- if(semana < 40 & anyo == 2019) {serie_sorteos.2017} else {serie_sorteos.2018}

#Lottery follows a uniform distribution
T=1e4;N=1000; M=100
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

hist(as.vector(vales),breaks = as.vector(seq(1,49,by=1)), xlab=NA, ylab=NA, main=paste('sorteo: ','muestra'), 
     cex.axis=0.5, font.main=1, cex.main=0.8)

source("function_avg_timesInRaw.R")

# undebug(avg_timesInRaw)

repeat {
  for (i in as.list(sort(sample(seq(1, N, by=1), 1))) ){
    apuesta <- sort(vales[i,])
  }
  below_maxdraws <- c()
  
  for (i in c(1:length(apuesta))){
    metadata_apuesta <- list()
    metadata_apuesta$apuesta <- list(apuesta)
    compo <- apuesta[i]
    metadata_apuesta$seleccion <- compo
    # print(compo)
    rep_2019 <- avg_timesInRaw(x = compo, year = "2019")
    metadata_apuesta$rep_2019 <- rep_2019
    # print(rep_2019)
    rep_previo <- avg_timesInRaw( x = compo)*as.integer(strftime(Sys.Date(), format = "%V"))/52
    metadata_apuesta$rep_previo <- rep_previo
    # print(rep_previo)
    dif_rep <- as.numeric(rep_2019) - as.numeric(rep_previo)
    metadata_apuesta$difference <- dif_rep
    print(metadata_apuesta)
    if (dif_rep < 0){
      below_maxdraws <- append(below_maxdraws, 1)
    } else {
      below_maxdraws <- append(below_maxdraws, 0)
    }
  }
  if (sum(below_maxdraws)==6){
    print(i)
    print(apuesta)
    break
  }
}


