#' Download data from the Encuesta de Presupuestos Familiares (EPF)
#'
#' This function downloads data from the Spanish Survey of Family Budgets \strong{(Members approach)} using the information provided by the Spanish Statistical Office (INE).
#'
#' @param file Character string with the name of the microdata file provided by the INE on the
#' \href{http://www.ine.es/dyngs/INEbase/es/operacion.htm?c=Estadistica_C&cid=1254736176806&menu=resultados&secc=1254736195147&idp=1254735976608}{EPF} section. It allows either a path to a file,
#' or literal data (single string or raw vector). It also allows compressed files in \code{.gz}, \code{.bz2}, \code{.xz}, or \code{.zip} format.
#'
#' @return \code{\link[tibble]{tibble}} with all avaliable requested data where each row corresponds to an anonymised citizen.
#' @details This function reads microdata from the members approach of the Survey of Family Budgets in Spain. It was originally built using the metadata for 2011 file but it may be used for later years. Previous files have a different, non compatible, format.
#'
#' @author Diego Paniagua Sánchez and Carlos J. Gil Bellosta
#' @note The \code{file} parameter allows any flat file with fixed width.
#' @references http://www.ine.es/prodyser/microdatos.htm
#' @examples
#' \dontrun{
#' raw <- epf.2011.gastos("sample_miembros_a2011.txt")
#' summary(raw)
#' }
#' @seealso \code{\link[readr]{read_fwf}} to read fixed width files.



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

