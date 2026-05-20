source("sorteos-js-web-scraping.R")

# ---- Detect all years present in the draw history ----
# regexpr() finds the position of the first 4-digit sequence in each date string.
# regmatches() extracts it. unique() + sort() gives us the year list in order.
all_years <- sort(unique(as.integer(
  regmatches(sorteo_anterior[,"V9"], regexpr("[0-9]{4}", sorteo_anterior[,"V9"]))
)))

# ---- Initialise the statistics data frame ----
# Start with Numero and Total, then add one zero-filled column per detected year.
# Adding columns in a loop is idiomatic R: df["new_col"] <- value appends a column.
estadisticasorteos <- data.frame(Numero = c(1:49), Total = rep(0, 49))
for (yr in all_years) {
  estadisticasorteos[paste0("year.", yr)] <- 0
}

# ---- Helper: count appearances of number i across draw columns of a sorteo matrix ----
count_appearances <- function(i, sorteo_matrix) {
  ensorteo <- c(FALSE)
  for (j in 1:ncol(sorteo_matrix)) {
    ensorteo <- append(ensorteo, sorteo_matrix[, j] %in% i)
  }
  sum(ensorteo)
}

# ---- Total across all years ----
sorteo_all <- sorteo_anterior[, c(1:6)]
for (i in 1:49) {
  estadisticasorteos[estadisticasorteos$Numero == i, "Total"] <- count_appearances(i, sorteo_all)
}

# ---- Per-year counts ----
# grepl(yr_str, V9) filters rows whose date string contains the 4-digit year.
for (yr in all_years) {
  yr_str  <- as.character(yr)
  yr_col  <- paste0("year.", yr)
  yr_rows <- grepl(yr_str, sorteo_anterior[, "V9"])
  sorteo  <- sorteo_anterior[yr_rows, c(1:6)]

  for (i in 1:49) {
    estadisticasorteos[estadisticasorteos$Numero == i, yr_col] <- count_appearances(i, sorteo)
  }
}

write.table(estadisticasorteos, file = "sorteos.txt",
            row.names = FALSE, sep = "\t")
