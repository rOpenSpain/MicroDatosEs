#' Download data from the "Padrón"
#'
#' This function downloads data from the Spanish "padrón" using the information provided by the Spanish Statistical Office (INE).
#'
#' @param file Character string with the name of the microdata file provided by the INE on the
#' \href{http://www.ine.es/dyngs/INEbase/es/operacion.htm?c=Estadistica_C&cid=1254736177012&menu=resultados&secc=1254736195462&idp=1254734710990}{Padrón} section. It allows either a path to a file,
#' or literal data (single string or raw vector). It also allows compressed files in \code{.gz}, \code{.bz2}, \code{.xz}, or \code{.zip} format.
#'
#' @return \code{\link[tibble]{tibble}} with all avaliable requested data where each row corresponds to an anonymised citizen.
#' @details This function reads microdata from the members approach of the "Padrón" in Spain. It was originally built using the metadata for 2016 file but it may be used for later years. Previous files have a different, non compatible, format.
#'
#' @author Carlos J. Gil Bellosta; metadata provided by Fiorella Mori.
#' @note The \code{file} parameter allows any flat file with fixed width.
#' @references http://www.ine.es/prodyser/microdatos.htm
#' @examples
#' \dontrun{
#' raw <- epf.2011.gastos("sample_padron_2016.txt")
#' summary(raw)
#' }
#' @seealso \code{\link[readr]{read_fwf}} to read fixed width files.


###################################################################
# cjgb
# 20170427
# Reads the "padron" microdata in its 2016 (and probably others) version
###################################################################

padron2016 <- function(file){

  mdat.1 <- read.table(system.file("metadata", "padron_2016_mdat1.txt", package = "MicroDatosEs"),
                       header = TRUE, sep = "\t",
                       fileEncoding = "UTF-8",
                       stringsAsFactors = FALSE)

  suppressMessages(
    dat <- read_fwf(file, fwf_widths(mdat.1$width, col_names = mdat.1$var))
  )

  foo <- function(prov, mun){
    mascara <- is.na(mun)
    res <- paste0(prov, mun)
    res[mascara] <- NA
    res
  }

  dat$CMUN  <- foo(dat$CPRO, dat$CMUN)
  dat$CMUNN <- foo(dat$CPRON, dat$CMUNN)

  read.fwf.microdata(dat,
                     system.file("metadata", "padron_2016_mdat1.txt", package = "MicroDatosEs"),
                     system.file("metadata", "padron_2016_mdat2.txt", package = "MicroDatosEs"),
                     fileEncoding = "UTF-8")
}

