\name{padron2016}
\alias{padron2016}
\title{
Reads microdata for the "padrón" as provided by the INE
}
\description{
This function reads the microdata file for the "padrón" as provided by the INE.
}
\usage{
padron2016(file)
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
Carlos J. Gil Bellosta; metadata provided by Fiorella Mori.
}
%\seealso{
%  \code{\link{as.data.frame.px}},
%}
\examples{
# This command reads a few lines sampled from the "padrón" of 2016.
sample.epa.data <- padron2016(system.file("extdata", 
   "sample_padron_2016.txt", package = "MicroDatosEs"))
}

\keyword{ manip }
