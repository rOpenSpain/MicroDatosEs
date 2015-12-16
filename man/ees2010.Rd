\name{ees2010}
\alias{ees2010}
\title{
Reads microdata for the EES as provided by the INE
}
\description{
This function reads the microdata file for the "Encuesta de Estructura Salarial", ESS, survey in Spain.
}
\usage{
ees2010(ees.file)
}

\arguments{
  \item{ees.file}{ The name of the microdata file }
}
\details{
This function reads microdadata files for the "Encuesta de Estructura Salarial" survey by 
the Spanish Statistical Office, INE.
The survey data can be downloaded from \url{http://www.ine.es/prodyser/micro_epa.htm}.

It can read the files for the 2010 survey. It might work for microdata from previous surveys (1995, 2002, 2006). 
}
\value{
A \code{data.set}. This class is defined in package \code{memisc}. Most users will want to transform the output to a regular \code{data.frame} using function \code{as.data.frame}.
}
\references{
  The INE page describing these microdata, \url{http://goo.gl/5DK2O3}.
}
\author{
Carlos J. Gil Bellosta, with major contributions from Jos\'e Luis Ca\~nadas Reche.
}
%\seealso{
%  \code{\link{as.data.frame.px}},
%}
\examples{
# This command reads a few lines sampled from an EES file
x <- ees2010(system.file("extdata", "sampleEES2010.txt", package = "MicroDatosEs"))
summary(as.data.frame(x))
}

\keyword{ manip }
