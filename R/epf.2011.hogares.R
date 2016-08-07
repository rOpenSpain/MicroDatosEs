###################################################################
# Diego Paniagua Sánchez
# 20150906
# Reads the households EPF microdata in its 2011 version
###################################################################

epf.2011.hogares <- function(file){
  read.fwf.microdata(file, 
                     system.file( "metadata", "epf_2011_hogares_mdat1.txt", package = "MicroDatosEs" ),
                     system.file( "metadata", "epf_2011_hogares_mdat2.txt", package = "MicroDatosEs" ),
                     fileEncoding = "UTF-8")
}
