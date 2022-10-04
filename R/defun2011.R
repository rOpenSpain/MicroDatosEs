#' Download data for deaths from INE
#'
#' This function downloads deaths statistcs from the Spanish Statistical Office (INE).
#'
#' @param file Character string with the name of the microdata file provided by the INE on the
#' \href{http://www.ine.es/dyngs/INEbase/es/operacion.htm?c=Estadistica_C&cid=1254736177008&menu=resultados&secc=1254736195450&idp=1254735573002}{Deaths} section. It allows either a path to a file
#' or literal data (single string or raw vector). It also allows compressed files in \code{.gz}, \code{.bz2}, \code{.xz}, or \code{.zip} format.
#'
#' @return \code{\link[tibble]{tibble}} with all avaliable requested data where each row corresponds to an anonymised citizen.
#' @details This function reads deaths microdata in Spain.
#'
#' It was originally built using the metadata for the 2011 file and may work with microdata files for other yearly submissions. Previous files have a different, non compatible, format.
#' @author Carlos J. Gil Bellosta
#' @note The \code{file} parameter allows any flat file with fixed width.
#' @references http://www.ine.es/prodyser/microdatos.htm
#' @examples
#' \dontrun{
#' raw <- defun2011("datos_2016.zip") # It will be automatically uncompressed.
#' summary(raw)
#' }
#' @seealso \code{\link[readr]{read_fwf}} to read fixed width files.


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

