checkBetIsDistinct <- function(bet){
  if(length(bet)==length(unique(bet)))
  {
    isDistinct <- TRUE
    isDistinct
  } else 
  {
    isDistinct <- FALSE
    isDistinct
    }
}