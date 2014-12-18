ainote <- function(jrubypath="/Library/Frameworks/JRuby.framework/Versions/Current/bin/"){
  if(Sys.info()["sysname"] != "Darwin"){
    stop("MacOS only",call. = FALSE, domain=NA)
  }  
  soundpath <- system.file("sounds/ainote/", package="yeah")
  hookpath <- system.file("ruby/hook.rb", package="yeah")
  jrubypath <- paste0(jrubypath,"jruby")
  comd <- paste(jrubypath, hookpath, soundpath)
  system(comd, wait=FALSE,ignore.stdout = TRUE, ignore.stderr = TRUE)
  cat(c("When you push 'return' key, you can hear 'Dokkoisho'.","To quit, push 'esc' key"),sep="\n")
}