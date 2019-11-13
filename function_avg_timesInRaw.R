avg_timesInRaw <- function(x, year = NA){
  if(is.na(year)) year <- "1900"
  years <- names(serie_numero)[grep("year", 
                                    names(serie_numero))][1:(length(grep("year", 
                                                                         names(serie_numero)))-1)]
  current_year <- c(character())
  current_year <- append(current_year, names(serie_numero)[grep("year", 
                                                      names(serie_numero))][(length(grep("year", 
                                                                                           names(serie_numero))))])

  if (year == format(Sys.Date(),"%Y")) {
    value <- as.numeric(serie_numero[serie_numero$Numero == x, current_year])
    return(value)
  } else {
    times_draw <- serie_numero[serie_numero$Numero == x,years]
    value <-  as.numeric(round(apply(times_draw, MARGIN = 1,FUN = mean),0))
    return(value)
  }
}





  