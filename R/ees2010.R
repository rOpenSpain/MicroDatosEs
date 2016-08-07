###################################################################
# cjgb
# 20120305
# Reads the "Encuesta de Estructura Salarial" with 2010 format
###################################################################

ees2010 <- function(file){
  read.fwf.microdata(file, 
                     system.file( "metadata", "ees_mdat1.txt", package = "MicroDatosEs" ),
                     system.file( "metadata", "ees_mdat2.txt", package = "MicroDatosEs" ),
                     fileEncoding = "UTF-8")
}

