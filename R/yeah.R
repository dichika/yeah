#' @export
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

#' @export
libraryy <- function(package=NULL,...){
  pkg <- as.character(substitute(package))
  library(package=pkg, character.only = TRUE, ...)
  yeah(pkg)
}


#' @export
detayo <- function(){
  path <- system.file("sounds/yuuisa.wav", package="yeah")
  beepr::beep(path)
}


#' @export
zoi <- function(){
  path <- system.file("sounds/zoi.wav", package="yeah")
  beepr::beep(path)
}


#' @export
doudesuka <- function(num=1){
  f <- sprintf("sounds/sinchoku_u_0%s.wav", num)
  path <- system.file(sprintf("sounds/sinchoku_u_0%s.wav", num), package="yeah")
  beepr::beep(path)
}


#' @export
zoitrance <- function(interval=NULL){
  interval <- ifelse(!is.null(interval), interval, sample(seq(0.2,0.8,0.1),1))
  cat("Want to Stop? Press ESC key")
  repeat{zoi();Sys.sleep(interval);}
}


#' @export
dsktrance <- function(interval=NULL,num=NULL){
  num <- ifelse(!is.null(num), num, 1)
  interval <- ifelse(!is.null(interval), interval, sample(seq(0.2,0.8,0.1),1))
  cat("Want to Stop? Press ESC key")
  repeat{doudesuka(num);Sys.sleep(interval);}
}


#' @export
ganbare <- function(){
  path <- system.file("sounds/ganbare.wav", package="yeah")
  beepr::beep(path)
}


#' @export
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

#' @export
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

#' @export
setNumacraw <- function(){
  .LastuserHook <<- getHook("plot.new")
  setHook("plot.new",numacraw,"append")
  
  postDrawDetails.gTree <<- function(x) {
    ggnumacraw()
  }
}

#' @export
unsetNumacraw <- function(){
  setHook("plot.new",.LastuserHook,"replace")
  remove(postDrawDetails.gTree, pos = '.GlobalEnv')
}


#' @export
getnumacraw <- function () {
  path_back <- system.file("data/back.png", package = "yeah")
  path_front <- system.file("data/front.png", package = "yeah")
  D <- ifelse(runif(min = 0, 1) > 0.3, path_front, path_back)
  return(png::readPNG(D))
}


#' @export
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

#' @export
yrandom <- function(){
  path_sounds <- system.file("sounds/", package = "yeah")
  voices <- grep("wav$", list.files(path_sounds), value=TRUE)
  voice <- sample(voices, 1)
  path <- paste0(path_sounds, voice)
  beepr::beep(path)
}

#' @export
teramonagi <- function(){
  f <- system.file("img/teramonagi.png", package="yeah")
  tera <- png::readPNG(f)
  ggmap::ggimage(tera)
}