---
title: Scrollable code blocks
output: 
  html_document: 
    highlight: tango
---

We set up an `output` hook to add a `style` attribute to the
text output when the chunk option `max.height` is set.

```{r, include=FALSE}
options(width = 60)
local({
  hook_output <- knitr::knit_hooks$get('output')
  knitr::knit_hooks$set(output = function(x, options) {
    if (!is.null(options$max.height)) options$attr.output <- c(
      options$attr.output,
      sprintf('style="max-height: %s;"', options$max.height)
    )
    hook_output(x, options)
  })
})
```

Without the `max.height` option, you will see the full output,
e.g.,

```{r}
1:100
```

Now we set `max.height` to `100px`. You will see a scrollbar
in the text output because its height is larger than 100px.

```{r, max.height='100px'}
1:100
```

Essentially the `max.height` option is converted to the
`attr.output` option. It works even if the `attr.output`
option is present, i.e., it will not override the
`attr.output` option, e.g., we show line numbers on the left
side of the text output via the `.numberLines` attribute:

```{r, max.height='100px', attr.output='.numberLines'}
1:100
```
