\name{epa2005}
\alias{epa2005}
\title{
Reads microdata for the EPA as provided by the INE
}
\description{
This function reads the microdata file for the "Encuesta de Poblaci\'on Activa", EPA, survey in Spain.
}
\usage{
epa2005(file)
}

\arguments{
  \item{file}{ The name of the microdata file }
}
\details{
This function reads microdadata files for the quarterly Encuesta de Poblaci\'oon Activa survey by 
the Spanish Statistical Office, INE.
The survey data can be downloaded from \url{http://www.ine.es/prodyser/micro_epa.htm}.

It can only read the files for the surveys from 2005 onwards. Previous files have a different,
non compatible, format.
}
\value{
A dataframe.
}
\references{
  \url{http://www.ine.es/prodyser/micro_epa.htm}
}
\author{
Carlos J. Gil Bellosta
}
%\seealso{
%  \code{\link{as.data.frame.px}},
%}
\examples{
# This command reads a few lines sampled from the EPA for the 1Q 2011
sample.epa.data <- epa2005(system.file("extdata", "sampleEPA0111.txt", package = "MicroDatosEs"))
}

\keyword{ manip }
