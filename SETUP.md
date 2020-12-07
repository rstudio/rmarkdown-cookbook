# Contributing

Thank you for considering contributing to the R Markdown Cookbook.

These instructions describe the steps and system requirements needed to build this book. 

When contribution to the book, it is a good practice to build it locally to ensure that any modifications that you have made worked as expected. However, please do not include the built HTML in your pull request. It is easier to merge in plain text R, Markdown, and R Markdown files and to only re-knit the book on the master branch. 

## System Requirements

### R Packages

To render the book, you must first install the `bookdown` R package. 

Additional dependencies are installed automatically the first time you buid the book. Packages that are used within the book are listed in the [index.Rmd](https://github.com/yihui/rmarkdown-cookbook/blob/master/index.Rmd) file, and packages referenced in the book (and used to generate their own references) are listed in the [18-references.Rmd](https://github.com/yihui/rmarkdown-cookbook/blob/master/18-references.Rmd) file. 

### LaTeX Packages

The TinyTex LaTeX distribution is required to build the book. This is installed on the first render of [01-installation.Rmd](https://github.com/yihui/rmarkdown-cookbook/blob/master/18-references.Rmd) if not already installed (which can be done with `tinytex::install_tinytex()`).

Additionally, the `pgf`, `preview`, and `xcolor` packages are required to build [11-chunk-options.Rmd](https://github.com/yihui/rmarkdown-cookbook/blob/master/11-chunk-options.Rmd) and will be installed as needed when running that chapter. 

### Fonts

To make the "Build All" button (described below) work, you will need the [Alegraya font family](https://fonts.google.com/specimen/Alegreya) from Google Fonts. For Windows 10, you may follow the instructions [here](https://winaero.com/how-to-install-and-use-google-fonts-in-windows-10/) to download (or find similar instructions for your OS).

Importantly, on Windows, be sure to install the font to your system instead of simply your account.

### Other System Dependencies

For Windows users, the section of the book on the [Asymptote language engine](https://bookdown.org/yihui/rmarkdown-cookbook/eng-asy.html) does not build properly so it will be skipped. For users with other operating systems, this section will be skipped if Asymptote is not installed on your computer. If they wish to build this section, they must download and install the [Asymptote software](https://asymptote.sourceforge.io/) from its website. After you install it, you may confirm that it is on your system's path by running the terminal command `where asy` or `Sys.which("asy")` from within R.

Phantom JS is also required for use with the **webshot** package. This is automatically installed on the first run of `index.Rmd`, but if you wish you may pre-install it with the command `webshot::install_phantomjs()`.

## Building the Book

### Building the Whole Book

Once you have set up all needed dependencies, there are multiple ways to build the book. 

If you currently use `make` (or set it up following [Software Carpentry's instructions](https://swcarpentry.github.io/make-novice/)), you may type `make gitbook` in the terminal. Equivalently, if you work in RStudio, you may click `Build All` in the Build pane.

If you are simply testing changes locally and not planning to publish the version you render, you may also run `bookdown::render_book()` in the R console or click `Addins > Preview Book` in the RStudio IDE. However, these methods will not completely reproduce the book because the custom `_render.R` file will not be executed.

### Building a Chapter

You may also build just one chapter of the book at a time to ensure that any contributions or updates you are making render correctly. To do so, you may run, `bookdown::preview_chapter()` (e.g. `bookdown::preview_chapter("04-content.Rmd")`) in the console. 


