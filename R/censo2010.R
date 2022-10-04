#' Download data from 2010 Spanish Census from INE
#'
#' This function downloads the data from 2010 (or later) Spanish Census using the information provided by the Spanish Statistical Office (INE).
#'
#' @param file Character string with the name of the microdata file provided by the INE on the
#' \href{http://www.ine.es/censos2011_datos/cen11_datos_microdatos.htm}{Census} section. It allows either a path to a file,
#' or literal data (single string or raw vector). It also allows compressed files in \code{.gz}, \code{.bz2}, \code{.xz}, or \code{.zip} format.
#'
#' @return \code{\link[tibble]{tibble}} with all avaliable requested data where each row corresponds to an anonymised citizen.
#' @details This function reads microdata from the 2010 census in Spain. It was originally built using the metadata for 2010 file but it may be used for later years.
#'
#' Note that the loaded object will be of considerable size and may require a computer from 8 GB of RAM. In order to avoid this kind of computational issues, you can also download the splitted version provided by the INE.
#' @author Carlos Neira and Carlos J. Gil Bellosta
#' @note The \code{file} parameter allows any flat file with fixed width.
#' @references http://www.ine.es/prodyser/microdatos.htm
#' @examples
#' # Downloaded \href{ftp://www.ine.es/temas/censopv/cen11/Microdatos_personas_nacional.zip}{data}
#' \dontrun{
#' raw <- censo2010("MicrodatosCP_NV_per_nacional_3VAR.txt")
#' summary(raw)
#' }
#' @seealso \code{\link[readr]{read_fwf}} to read fixed width files.


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

