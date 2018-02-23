###################################################################
# @gilbellosta / Rocío Roso
# 20180223
# Reads the "EVR" microdata (Encuesta de Variaciones Residenciales)
###################################################################

evr2016 <- function(file){
  
  mdat.1 <- read.table(system.file("metadata", "EVR_2016_mdat1.txt", package = "MicroDatosEs"), 
                       header = T, sep = "\t", 
                       fileEncoding = "UTF-8",
                       stringsAsFactors = FALSE)
  
  suppressMessages(
    dat <- read_fwf(file, fwf_widths(mdat.1$width, col_names = mdat.1$var))
  )
  
  foo <- function(prov, mun){
    mascara <- is.na(mun)
    res <- paste0(prov, mun)
    res[mascara] <- NA
    res
  }
  
  dat$MUNINAC  <- foo(dat$PROVNAC, dat$MUNINAC)
  dat$MUNIALTA <- foo(dat$PROVALTA, dat$MUNIALTA)
  dat$MUNIBAJA <- foo(dat$PROVBAJA, dat$MUNIBAJA)
  
  read.fwf.microdata(dat, 
                     system.file("metadata", "EVR_2016_mdat1.txt", package = "MicroDatosEs"),
                     system.file("metadata", "EVR_2016_mdat2.txt", package = "MicroDatosEs"),
                     fileEncoding = "UTF-8")
}

