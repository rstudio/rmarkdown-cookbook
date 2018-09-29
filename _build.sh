#!/usr/bin/env Rscript
webshot::install_phantomjs()

bookdown::render_book('index.Rmd', 'bookdown::gitbook')
bookdown::render_book("index.Rmd", "bookdown::pdf_book")
bookdown::render_book("index.Rmd", "bookdown::epub_book")


