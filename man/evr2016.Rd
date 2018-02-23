\name{evr2016}
\alias{evr2016}
\title{
Reads the Encuesta de Variaciones Residenciales survey as provided by the INE
}
\description{
This function reads the microdata file for the "padrón" as provided by the INE.

It has been built for the data coming from the 2016 survey. It may work for other waves (before or after 2016). Please, report problems with data from different years.
}
\usage{
evr2016(file)
}

\arguments{
  \item{file}{ The name of the microdata file }
}
\details{
TBA
}
\value{
A dataframe.
}
\references{
  \url{http://www.ine.es/prodyser/microdatos.htm}
}
\author{
Carlos J. Gil Bellosta; metadata and testing provided by Rocío Roso.
}
%\seealso{
%  \code{\link{as.data.frame.px}},
%}
\examples{
# This command reads a few lines sampled from the 2016 EVR.
# This data is internal to the package. To test your own data
# do something like:
# res <- evr2016("my_data.txt")
sample.epa.data <- evr2016(system.file("extdata", 
   "sample_EVR_2016.txt", package = "MicroDatosEs"))
}

\keyword{ manip }
