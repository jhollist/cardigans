# cardigans
Color palette for R that uses the colors of Mr. Rogers cardigans.  The current plan is to structure the functions similar to [`viridis`](https://github.com/sjmgarnier/viridis) but with the simpler palette of colors from Mr. Roger's cardigans.

# Installation  
This pacakge is not currently on CRAN, so to install

```
# Use devtools
devtools::install_github("jhollist/cardigans")
```

# Use
Still a work in progress, but at the moment you can get the data behind these palletes.

```
library(cardigans)
#Per Episode Colors
data(cardigan_colors)

# Thanks
Thanks to Owen Phillips for his blog post on [Mr. Rogers cardigans](https://theawl.com/every-color-of-cardigan-mister-rogers-wore-from-1979-2001-83c1faba2677) and to [@Henryjean's code](https://github.com/Henryjean/Rogers-Cardigans).  And the real work in getting these colors is from [Tim Lybarger](http://www.neighborhoodarchive.com/about/).  All of this work inspried this package.  Thanks also to [Meg Duffy](https://twitter.com/duffy_ma/) for sharing the post and thanks to Meg and [Dave Bridges](https://twitter.com/dave_bridges) for help with naming the package.

