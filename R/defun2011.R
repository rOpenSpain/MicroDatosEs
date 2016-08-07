###################################################################
# cjgb
# 20120811
# Reads the INE deaths microdata in its 2011 (tested) version
#	It could possibly also read microdata files for other years
###################################################################

defun2011 <- function(file){
  read.fwf.microdata(file, 
                     system.file( "metadata", "defun_2011_mdat1.txt", package = "MicroDatosEs" ),
                     system.file( "metadata", "defun_2011_mdat2.txt", package = "MicroDatosEs" ),
                     fileEncoding = "UTF-8")
}

