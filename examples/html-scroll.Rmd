---
title: Scrollable code blocks
output: html_document
---

```{css, echo=FALSE}
pre {
  max-height: 300px;
  overflow-y: auto;
}

pre[class] {
  max-height: 100px;
}
```

We have defined some CSS rules to limit the height of
code blocks. Now we can test if these rules work on code
blocks and text output:

```{r}
# pretend that we have a lot of code in this chunk
if (1 + 1 == 2) {
  # of course that is true
  print(mtcars)
  # we just printed a lengthy data set
}
```

Next we add rules for a new class `scroll-100` to limit
the height to 100px, and add the class to the output of
a code chunk via the chunk option `class.output`:

```{css, echo=FALSE}
.scroll-100 {
  max-height: 100px;
  overflow-y: auto;
  background-color: inherit;
}
```

```{r, class.output="scroll-100"}
print(mtcars)
```
