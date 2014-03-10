yeah
=====

yeah connects R users with voice.
## Installation
You need to install dependents before installing yeah.

```r
#install.packages("devtools")

library(devtools)
install_github("rasmusab/pingr")
install_github("dichika/yeah")
```

Note: Windows users need [Rtools](http://www.murdoch-sutherland.com/Rtools/) and [devtools](http://CRAN.R-project.org/package=devtools) to install this way.

## Example
```r
library(yeah)
yeah("yeah")
```

## Usage
pings(pkgname)

## Arguments

### pkgname
Package name which you want to listen to author's voice in.
