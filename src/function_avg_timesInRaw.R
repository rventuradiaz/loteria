avg_timesInRaw <- function(x, year,vsorteo){
    timesInRaw <- sum(vsorteo == x)
    return(timesInRaw)
}