quiet = "--quiet" %in% commandArgs(FALSE)
formats = commandArgs(TRUE)

# provide default formats if necessary
if (length(formats) == 0) formats = c('bookdown::pdf_book', 'bookdown::gitbook')
# render the book to all formats unless they are specified via command-line args
for (fmt in formats) {
  cmd = sprintf("bookdown::render_book('index.Rmd', '%s', quiet = %s)", fmt, quiet)
  res = bookdown:::Rscript(c('-e', shQuote(cmd)))
  if (res != 0) stop('Failed to compile the book to ', fmt)
}
unlink('rmarkdown-cookbook.log')

# creates redirects
redirect = function(from, to) {
  to = paste0('https://bookdown.org/yihui/rmarkdown-cookbook/', to)
  writeLines(sprintf(
    '<html><head><meta http-equiv="refresh" content="0; URL=\'%s\'" /></head><body><script>window.location = "%s";</script></html>', to, to
  ), paste0('_book/', from))
}

redirect('r-markdown-components.html', 'rmarkdown-process.html')
redirect('acknowledgements.html', 'acknowledgments.html')


if (length(formats) > 1) {
  if (!is.na(Sys.getenv('CI', NA))) {
    xfun::pkg_load2("rsconnect")
    # On CI connect to server, using API KEY and deploy using appId
    rsconnect::addConnectServer('https://bookdown.org', 'bookdown.org')
    rsconnect::connectApiUser(
      account = 'GHA', server = 'bookdown.org',
      apiKey = Sys.getenv('CONNECT_API_KEY')
    )
    rsconnect::deploySite(
      appId = Sys.getenv('CONTENT_ID'),
      server = 'bookdown.org',
      render = 'none', logLevel = 'verbose',
      forceUpdate = TRUE)
  } else if (Sys.getenv('USER') == 'yihui') {
    # for local deployment when rsconnect/ is available
    bookdown::publish_book('rmarkdown-cookbook', server = 'bookdown.org', render = 'none')
  }
}
