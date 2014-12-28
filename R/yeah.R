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

zoi <- function(){
  path <- system.file("sounds/zoi.wav", package="yeah")
  beepr::beep(path)
}

ganbare <- function(){
  path <- system.file("sounds/ganbare.wav", package="yeah")
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

# numacraw was originally created by Teito Nakagawa
numacraw<-function(get2=FALSE){
    set.seed(Sys.time()) 
    path_back <- system.file("data/back.png", package="yeah")
    path_front <- system.file("data/front.png", package="yeah")
    vec<-par()$usr
    SIZE<-runif(min=0.4,max=1, 1)
    X<-runif(min=0, max=1, 1)*(vec[2]-vec[1])
    Y<-runif(min=0, max=1, 1)*(vec[4]-vec[3])
    D<-ifelse(runif(min = 0 ,1)>0.3, path_front, path_back)
    if(!get2){
      rasterImage(png::readPNG(D)
                  ,X-SIZE*(vec[2]-vec[1])/2
                  ,Y-SIZE*(vec[4]-vec[3])/2
                  ,X+SIZE*(vec[2]-vec[1])/2
                  ,Y+SIZE*(vec[4]-vec[3])/2
      )
    }else{
      rasterImage(png::readPNG(D)
                  ,X-SIZE*(vec[2]-vec[1])/2
                  ,Y-SIZE*(vec[4]-vec[3])/2
                  ,X+SIZE*(vec[2]-vec[1])/4
                  ,Y+SIZE*(vec[4]-vec[3])/2
      )
      rasterImage(png::readPNG(D)
                  ,X-SIZE*(vec[2]-vec[1])/4
                  ,Y-SIZE*(vec[4]-vec[3])/2
                  ,X+SIZE*(vec[2]-vec[1])/2
                  ,Y+SIZE*(vec[4]-vec[3])/2
      )
    }
}
setNumacraw <- function(){
  .LastuserHook <<- getHook("plot.new")
  setHook("plot.new",numacraw,"append")
  
  postDrawDetails.gTree <<- function(x) {
    ggnumacraw()
  }
}
unsetNumacraw <- function(){
  setHook("plot.new",.LastuserHook,"replace")
  remove(postDrawDetails.gTree, pos = '.GlobalEnv')
}

getnumacraw <- function () {
  path_back <- system.file("data/back.png", package = "yeah")
  path_front <- system.file("data/front.png", package = "yeah")
  D <- ifelse(runif(min = 0, 1) > 0.3, path_front, path_back)
  return(png::readPNG(D))
}

ggnumacraw <- function() {
  m <- getnumacraw()
  g <- grid::rasterGrob(m, interpolate = TRUE)
  vp <- grid::viewport(x = runif(min = 0.2, max = 0.8, 1),
                       y = runif(min = 0.2, max = 0.8, 1),
                       width = runif(min = 0.5, max = 1, 1),
                       height = runif(min = 0.5, max = 1, 1),
                       just = c("center","center"))
  g <- grid::editGrob(g, vp = vp)
  grid::grid.draw(g) 
}

