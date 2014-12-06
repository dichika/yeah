yeah <- function(pkgname=NULL){
  sound_path <- ifelse(is.null(pkgname), 
                       system.file("sounds/yeah.wav", package="yeah"),
                       system.file("sounds/yeah.wav", package=pkgname)
  )
  if(!(nchar(sound_path)>0)){
    stop("\nHmm...this package doesn't have no yeah.")
  }
  beepr::beep(sound_path)
}

libraryy <- function(package=NULL,...){
  pkg <- as.character(substitute(package))
  library(package=pkg, character.only = TRUE, ...)
  yeah(pkg)
}

detayo <- function(){
  path <- system.file("sounds/yuuisa.wav", package="yeah")
  beepr::beep(path)
}

tsurami <- function(){
  path <- system.file("data/fran.csv", package="yeah")
  dat <- read.csv(path, as.is=TRUE)
  num <- sample(seq(nrow(dat)),1)
  res <- paste(collapse="\n", 
               c(sprintf("\n%s", dat$content[num]),
               sprintf("  --%s", dat$author[num]),
               sprintf("    %s", dat$URL[num])
               ))
  cat(res)
}