# Contributing

Thank you for considering contributing to the R Markdown Cookbook.

These instructions describe the steps and system requirements needed to build this book. 

When contribution to the book, it is a good practice to build it locally to ensure that any modifications that you have made worked as expected. However, please do not include the built HTML in your pull request. It is easier to merge in plain text R, Markdown, and R Markdown files and to only reknit the book on the master branch. 

## System Requirements

### R Packages

The following R packages are required to build to book. These are the same as those which are loaded in the `index.Rmd` file, plus `bookdown` and `tinytex`.

```
reqd_pkgs <-
c('remotes', 'webshot', 'DiagrammeR', 'stargazer', 'gt', 'flextable', 'formatR',
  'equatiomatic', 'gifski', 'magick', 'pdftools', 'tikzDevice', 'xaringan',
  'kableExtra', 'blogdown', 'jsonlite', 'nomnoml', 'bookdown', 'tinytex')
```

Additionally, the following packages are referenced in the book. If you do not have them installed, the book will still build, but there references will be incomplete and you will receive numerous messages in the console of the form "pandoc-citeproc: reference R-{package name} not found". 

```
refd_pkgs <- 
  c('animation', 'blastula', 'blogdown', 'bookdown','broom', 'Cairo', 'cairoDevice', 'condformat',
    'dagitty', 'diagram', 'DiagrammeR', 'distill', 'downloadthis', 'DT', 'ezknitr', 'flair',
    'flexdashboard', 'flextable', 'formatR', 'formattable', 'gganimate', 'ggdag', 'ggplot2', 
    'gifski', 'googledrive', 'govdown', 'gt', 'gtsummary', 'here', 'huxtable', 'kableExtra', 
    'knitcitations', 'knitr', 'learnr', 'magick', 'nomnoml', 'officedown', 'officer', 'pagedown',
    'pander', 'pixiedust', 'pkgdown', 'printr', 'r2d3', 'reactable', 'reticulate', 'revealjs', 'rgl',
    'rhandsontable', 'rmarkdown', 'rmdformats', 'roxygen2', 'rsconnect', 'rticles', 'sass', 'spelling', 
    'stargazer', 'styler', 'svglite', 'tables', 'tangram', 'tikzDevice', 'tinytex', 'tufte', 'usethis',
    'webshot', 'workflowr', 'xaringan', 'xfun', 'xtable', 'yaml', 'ztable')
```

You may install packages with `install.packages()` or with the **pak** package's `pkg_install()` function, i.e.:

```
pak::pkg_install(reqd_pkgs)
```

Note the `pkg_install()` will only install missing packages (and not update current packages) unless you set `upgrade = TRUE`. It is generally a good idea to work with the latest version of packages when preparing a contribution or, at minimum if you receive errors while building, upgrading your packages is a good first step in debugging.

### LaTeX Packages

Due to the cookbook's discussion of various [graphical devices](https://bookdown.org/yihui/rmarkdown-cookbook/graphical-device.html), a number of LaTeX packages are also required. Some may already be installed in `tinytex` depending on what version of the package you have.

If you have never used LaTeX or `tinytex` before, first run:

```
tinytex::install_tinytex()
```

To check if you have the needed LaTeX packages, run:

```
tex_pkgs <- c('pgf', 'preview', 'xcolor', 'grfext')
setNames(tex_pkgs %in% tinytex::tl_pkgs(), pkgs)
```

If the results for any of the preceding packages is `FALSE`, you may install it with `tinytex::tlmgr_install()`. 

More about `tinytex` and troubleshooting missing LaTeX packages can be found in the cookbook [here](https://bookdown.org/yihui/rmarkdown-cookbook/install-latex-pkgs.html). 

### Other System Dependencies

For Windows users, the section of the book on the [Asymptote language engine](https://bookdown.org/yihui/rmarkdown-cookbook/eng-asy.html) does not build properly so it will be skipped. For users with other operating systems, this section will be skipped if Asymptote is not installed on your computer. If they wish to build this section, they must download and install the [Asymptote software](https://asymptote.sourceforge.io/) from its website. After you install it, you may confirm that it is on your system's path by running the terminal command `where asy` or `Sys.which("asy")` from within R.

## Building the Book

Once you have set up all needed dependencies, there are multiple ways to build the book. 

If you currently use `make` (or set it up following [Software Carpentry's instructions](https://swcarpentry.github.io/make-novice/)), you may type `make gitbook` in the terminal. 

Otherwise, you may preview the book by running `bookdown::render_book()` in the R console or, if you are using RStudio, clicking on `Addins > Preview Book`. 
