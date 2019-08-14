import_example <- function(file) {
  example <- xfun::read_utf8(file.path("examples", file))
  # example <- gsub("^(```\\{)", "`r ''`\\1", example)
  example <- c(
    "````md",
    example,
    "````"
  )
  cat(example, sep = "\n")
}
