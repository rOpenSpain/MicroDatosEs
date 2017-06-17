###################################################################
# cjgb
# 20170427
# Reads the "padron" microdata in its 2016 (and probably others) version
###################################################################

padron2016 <- function(file){
  
  mdat.1 <- read.table(system.file("metadata", "padron_2016_mdat1.txt", package = "MicroDatosEs"), 
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
  
  dat$CMUN  <- foo(dat$CPRO, dat$CMUN)
  dat$CMUNN <- foo(dat$CPRON, dat$CMUNN)
  
  read.fwf.microdata(dat, 
                     system.file("metadata", "padron_2016_mdat1.txt", package = "MicroDatosEs"),
                     system.file("metadata", "padron_2016_mdat2.txt", package = "MicroDatosEs"),
                     fileEncoding = "UTF-8")
}

