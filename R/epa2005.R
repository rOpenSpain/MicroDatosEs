###################################################################
# cjgb
# 20120305
# Reads the EPA microdata in its 2005 version
###################################################################

epa2005 <- function(file){
  read.fwf.microdata(file, 
                     system.file("metadata", "epa_mdat1.txt", package = "MicroDatosEs"),
                     system.file("metadata", "epa_mdat2.txt", package = "MicroDatosEs"),
                     fileEncoding = "UTF-8")
}

