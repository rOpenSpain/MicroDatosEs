###################################################################
# cjgb
# 20140428
# Reads the microdata for the 2010 Spanish Census
###################################################################

censo2010 <- function(file){
  read.fwf.microdata(file, 
                     system.file( "metadata", "censo_2010_mdat1.txt", package = "MicroDatosEs" ),
                     system.file( "metadata", "censo_2010_mdat2.txt", package = "MicroDatosEs" ),
                     fileEncoding = "UTF-8")
}

