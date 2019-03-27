#' Download data from the "Frontur"
#' 
#' This function downloads data from the Spanish "frontur" using the information provided by the Spanish Statistical Office (INE).
#' 
#' @param file Character string with the name of the microdata file provided by the INE on the  
#' \href{http://www.ine.es/dyngs/INEbase/es/operacion.htm?c=Estadistica_C&cid=1254736177012&menu=resultados&secc=1254736195462&idp=1254734710990}{Padrón} section. It allows either a path to a file, 
#' or literal data (single string or raw vector). It also allows compressed files in \code{.gz}, \code{.bz2}, \code{.xz}, or \code{.zip} format.
#' 
#' @return \code{\link[tibble]{tibble}} with all avaliable requested data where each row corresponds to an anonymised citizen.
#' @details This function reads microdata from the members approach of the "Padrón" in Spain. It was originally built using the metadata for 2016 file but it may be used for later years. Previous files have a different, non compatible, format.
#' 
#' @author David Carrasco.
#' @note The \code{file} parameter allows any flat file with fixed width.
#' @references http://www.ine.es/prodyser/microdatos.htm
#' @examples 
#' \dontrun{
#' raw <- frontur2016("sample_frontur_2016.txt")
#' summary(raw)
#' }
#' @seealso \code{\link[read_fwf]{readr}} to read fixed width files.


###################################################################
# David-Carrasco
# 20190327
# Reads the "frontur" microdata in its 2016 (and probably others) version
###################################################################

frontur2016 <- function(file){
  
  mdat.1 <- read.table('inst/metadata/frontur_2016_mdat1.txt', 
                       header = T, sep = "\t", 
                       fileEncoding = "UTF-8",
                       stringsAsFactors = FALSE)
  
  suppressMessages(
    dat <- read_csv2(file, col_names = mdat.1$var, skip=1, col_types = "ccccccccccc")
  )

  read.fwf.microdata(dat, 
                     system.file("metadata", "frontur_2016_mdat1.txt", package = "MicroDatosEs"),
                     system.file("metadata", "frontur_2016_mdat2.txt", package = "MicroDatosEs"),
                     fileEncoding = "UTF-8")
}

