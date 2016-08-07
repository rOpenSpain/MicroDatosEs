\name{defun2011}
\alias{defun2011}
\title{
Reads microdata for deaths as provided by the INE
}
\description{
This function reads the microdata file for deaths statistics, as collected by the INE in Spain. 
It was originally built using the metadata for the 2011 file and may work with microdata files for other yearly submissions. 
}
\usage{
defun2011(file)
}

\arguments{
  \item{file}{ The name of the microdata file }
}
\details{
This function reads microdadata files for the deaths statistics collected by the the Spanish Statistical Office, INE.
The survey data can be downloaded from \url{http://www.ine.es/en/prodyser/micro_mnp_defun_en.htm}.

It has been built and tested on the 2011 files and may be able to read files conforming to previous (or later) formats.
}
\value{
A \code{\link{data.frame}}.
}
\references{
  \url{http://www.ine.es/en/prodyser/micro_mnp_defun_en.htm}
}
\author{
Carlos J. Gil Bellosta
}
%\seealso{
%  \code{\link{as.data.frame.px}},
%}
\examples{
# This command reads a few lines sampled from the 2010 deaths microdata file
x <- defun2011(system.file("extdata", 
               "sampleDEFUN2010.txt", 
               package = "MicroDatosEs"))
summary(x)
}

\keyword{ manip }
