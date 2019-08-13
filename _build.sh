#!/usr/bin/env Rscript

setwd("book")
bookdown::render_book('index.Rmd', 'bookdown::gitbook')
# bookdown::render_book("index.Rmd", "bookdown::pdf_book")
# bookdown::render_book("index.Rmd", "bookdown::epub_book")


