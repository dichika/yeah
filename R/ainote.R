ainote <- function(jrubypath=NULL,
                   soundpath=NULL,
                   type=NULL){
  if(Sys.info()["sysname"] != "Darwin"){
    stop("MacOS only",call. = FALSE, domain=NA)
  }  
  hookpath <- system.file("ruby/hook.rb", package="yeah")
  if(is.null(soundpath)){
    soundpath <- system.file("sounds/ainote/", package="yeah")    
  }
  if(is.null(jrubypath)){
    jrubypath <- "/Library/Frameworks/JRuby.framework/Versions/Current/bin/"
  }
  jrubypath <- paste0(jrubypath,"jruby")
  jnativehookpath <- system.file("java/jNativeHook.jar", package="yeah")
  comd <- paste(jrubypath, hookpath, soundpath, jnativehookpath)
  system(comd, wait=FALSE,ignore.stdout = TRUE, ignore.stderr = TRUE)
  cat(c("When you push 'return' key, you can hear 'Dokkoisho'.","To quit, push 'esc' key"),sep="\n")
}