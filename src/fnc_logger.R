get_log_file_name <- function(file_name="log_file")
{
  file_name <- paste(file_name,format(Sys.time(), "%Y%m%d"),sep="_")
  file_name <- paste(cPath, paste(file_name,"log", sep="."), sep="/")
  return(file_name)
}

logit <- function(msg, ...) 
{
  cat(format(Sys.time(), "%Y-%m-%d %X"), ":", paste(msg, ...), "\n", append = T,
      file = logFile)
}