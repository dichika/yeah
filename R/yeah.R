yeah <- function(pkgname){
  require(pingr)
  sound_path <- system.file("sounds/yeah.wav", package=pkgname)
  if(!(nchar(sound_path)>0)){
    stop("\nHmm...this package doesn't have no yeah.")
  }
  ping(sound_path)
}