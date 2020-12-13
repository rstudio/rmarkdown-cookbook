import_example <- function(file, lang = xfun::file_ext(file)) {
  x = xfun::read_utf8(file.path("examples", file))
  lang = tolower(lang)
  if (nchar(lang) > 1) {
    lang = sub('^r', '', lang)
    if (lang == 'nw') lang = 'tex'
  }
  knitr::asis_output(paste(c(sprintf("````%s", lang), x, "````"), collapse = '\n'))
}
