###################################################################
# Diego Paniagua Sánchez
# 20150906
# Reads the expenses EPF microdata in its 2011 version
###################################################################


epf.2011.gastos <- function(file){
  read.fwf.microdata(file, 
                     system.file( "metadata", "epf_2011_gastos_mdat1.txt", package = "MicroDatosEs" ),
                     system.file( "metadata", "epf_2011_gastos_mdat2.txt", package = "MicroDatosEs" ),
                     fileEncoding = "UTF-8")
}
