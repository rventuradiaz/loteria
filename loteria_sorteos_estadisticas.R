source("sorteos-js-web-scraping.R");

# Estadística sorteos anteriores
estadisticasorteos <- data.frame(Numero=c(1:49)
                                 ,Total=rep(0,49)
                                 ,	year.2015 = rep(0,49)
                                 , 	year.2016= rep(0,49)
                                 ,	year.2017 = rep(0,49)
                                 , year.2018 = rep(0,49)
                                 , year.2019 = rep(0,49)
                                 , year.2020 = rep(0,49)
                                 , year.2021 = rep(0,49)
                                 )
sorteos.2015 <- grepl("2015",sorteo_anterior[,"V9"])
sorteo <- sorteo_anterior[sorteos.2015,c(1:6)]

# En total:
sorteo <- sorteo_anterior[,c(1:6)]
# View(sorteo)
for (i in (1:49)){
  ensorteo <- c(FALSE)
  # Para cada ocurrencia del sorteo:
  for (j in 1:6){
    ensorteo <- append(ensorteo, sorteo[,c(j)] %in% i  )
  }
  estadisticasorteos[estadisticasorteos$Numero==i,"Total"] <- sum(ensorteo)
  
  }



# Año 2015:
sorteos.2015 <- grepl("2015",sorteo_anterior[,"V9"])
sorteo <- sorteo_anterior[sorteos.2015,c(1:6)]
# View(sorteo)
for (i in (1:49)){
  ensorteo <- c(FALSE)
  # Para cada ocurrencia del sorteo:
  for (j in 1:6){
    ensorteo <- append(ensorteo, sorteo[,c(j)] %in% i  )
  }
  estadisticasorteos[estadisticasorteos$Numero==i,"year.2015"] <- sum(ensorteo)
}

# Año 2016:
sorteos.2016 <- grepl("2016",sorteo_anterior[,"V9"])
sorteo <- sorteo_anterior[sorteos.2016,c(1:6)]
# View(sorteo)
for (i in (1:49)){
  ensorteo <- c(FALSE)
  # Para cada ocurrencia del sorteo:
  for (j in 1:ncol(sorteo)){
    ensorteo <- append(ensorteo, sorteo[,c(j)] %in% i  )
  }
  estadisticasorteos[estadisticasorteos$Numero==i,"year.2016"] <- sum(ensorteo)
}

# Año 2017:
sorteos.2017 <- grepl("2017",sorteo_anterior[,"V9"])
sorteo <- sorteo_anterior[sorteos.2017,c(1:6)]
# View(sorteo)
for (i in (1:49)){
  ensorteo <- c(FALSE)
  # Para cada ocurrencia del sorteo:
  for (j in 1:ncol(sorteo)){
    ensorteo <- append(ensorteo, sorteo[,c(j)] %in% i  )
  }
  estadisticasorteos[estadisticasorteos$Numero==i,"year.2017"] <- sum(ensorteo)
}

# Año 2018:
sorteos.2018 <- grepl("2018",sorteo_anterior[,"V9"])
sorteo <- sorteo_anterior[sorteos.2018,c(1:6)]
# View(sorteo)
for (i in (1:49)){
  ensorteo <- c(FALSE)
  # Para cada ocurrencia del sorteo:
  for (j in 1:ncol(sorteo)){
    ensorteo <- append(ensorteo, sorteo[,c(j)] %in% i  )
  }
  estadisticasorteos[estadisticasorteos$Numero==i,"year.2018"] <- sum(ensorteo)
}

# Año 2019:
sorteos.2019 <- grepl("2019",sorteo_anterior[,"V9"])
sorteo <- sorteo_anterior[sorteos.2019,c(1:6)]
# View(sorteo)
for (i in (1:49)){
  ensorteo <- c(FALSE)
  # Para cada ocurrencia del sorteo:
  for (j in 1:ncol(sorteo)){
    ensorteo <- append(ensorteo, sorteo[,c(j)] %in% i  )
  }
  estadisticasorteos[estadisticasorteos$Numero==i,"year.2019"] <- sum(ensorteo)
}

# Año 2020:
sorteos.2020 <- grepl("2020",sorteo_anterior[,"V9"])
sorteo <- sorteo_anterior[sorteos.2020,c(1:6)]
# View(sorteo)
for (i in (1:49)){
  ensorteo <- c(FALSE)
  # Para cada ocurrencia del sorteo:
  for (j in 1:ncol(sorteo)){
    ensorteo <- append(ensorteo, sorteo[,c(j)] %in% i  )
  }
  estadisticasorteos[estadisticasorteos$Numero==i,"year.2020"] <- sum(ensorteo)
}

# Año 2021:
# sorteos.2021 <- grepl("2021",sorteo_anterior[,"V9"])
# sorteo <- sorteo_anterior[sorteos.2021,c(1:6)]
# # View(sorteo)
# for (i in (1:49)){
#   ensorteo <- c(FALSE)
#   # Para cada ocurrencia del sorteo:
#   for (j in 1:ncol(sorteo)){
#     ensorteo <- append(ensorteo, sorteo[,c(j)] %in% i  )
#   }
#   estadisticasorteos[estadisticasorteos$Numero==i,"year.2021"] <- sum(ensorteo)
# }

write.table(estadisticasorteos, file = "sorteos.txt", 
            row.names=FALSE, sep = "\t")
