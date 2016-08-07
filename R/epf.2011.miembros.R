###################################################################
# Diego Paniagua Sánchez
# 20150906
# Reads the members EPF microdata in its 2011 version
###################################################################

epf.2011.miembros <- function(file){       
  read.fwf.microdata(file, 
                     system.file( "metadata", "epf_2011_miembros_mdat1.txt", package = "MicroDatosEs" ),
                     system.file( "metadata", "epf_2011_miembros_mdat2.txt", package = "MicroDatosEs" ),
                     fileEncoding = "UTF-8")
}

