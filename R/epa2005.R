#' Download data from the Encuesta de Población Activa (EPA)
#'
#' This function downloads the data from the Spanish Active Population Survey using the information provided by the Spanish Statistical Office (INE).
#'
#' @param file Character string with the name of the microdata file provided by the INE on the
#' \href{http://www.ine.es/dyngs/INEbase/es/operacion.htm?c=Estadistica_C&cid=1254736176918&menu=resultados&secc=1254736030639&idp=1254735976595}{EPA} section. It allows either a path to a file,
#' or literal data (single string or raw vector). It also allows compressed files in \code{.gz}, \code{.bz2}, \code{.xz}, or \code{.zip} format.
#'
#' @return \code{\link[tibble]{tibble}} with all avaliable requested data where each row corresponds to an anonymised citizen.
#' @details This function reads microdata from the quarterly Active Population Survey in Spain. It was originally built using the metadata for 2005 file but it may be used for later years. Previous files have a different, non compatible, format.
#'
#' @author Carlos J. Gil Bellosta
#' @note The \code{file} parameter allows any flat file with fixed width.
#' @references http://www.ine.es/prodyser/microdatos.htm
#' @examples
#' \dontrun{
#' raw <- epa2005("EPA4T017")
#' summary(raw)
#' }
#' @seealso \code{\link[readr]{read_fwf}} to read fixed width files.


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

