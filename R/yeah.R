yeah <- function(pkgname=NULL){
  sound_path <- ifelse(is.null(pkgname), 
                       system.file("sounds/yeah.wav", package="yeah"),
                       system.file("sounds/yeah.wav", package=pkgname)
  )
  if(!(nchar(sound_path)>0)){
    stop("\nHmm...this package doesn't have no yeah.")
  }
  beep(sound_path)
}

libraryy <- function(package=NULL,...){
  pkg <- as.character(substitute(package))
  library(package=pkg, character.only = TRUE, ...)
  yeah(pkg)
}

detayo <- function(){
  path <- system.file("sounds/yuuisa.wav", package="yeah")
  beep(path)
}