\name{epf.2011.hogares}
\alias{epf.2011.hogares}
\alias{epf.2011.gastos}
\alias{epf.2011.miembros}

\title{
Functions to read the Spanish survey of family budgets (EPF) microdata provided by the INE.
}

\description{
These functions read the Spanish survey of family budgets (EPF) microdata files, as collected by the INE. It was originally built using the metadata for the 2011 file and may work with microdata files for later yearly submissions. Microdata comes in three different files, corresponding to the three functions described here.
}

\usage{
epf.2011.hogares(file)
epf.2011.gastos(file)
epf.2011.miembros(file)
}

\arguments{
  \item{file}{The name of the microdata file}
}

\details{
These functions read the three microdadata files for the EPF survey in Spain. These can be downloaded from \url{http://www.ine.es/dyngs/INEbase/es/operacion.htm?c=Estadistica_C&cid=1254736176806&menu=resultados&secc=1254736195147&idp=1254735976608}. It has been built and tested on the 2011 files and may be able to read files conforming to later formats.
}
\value{
A \code{data.frame}.
}

\references{
\url{http://www.ine.es/metodologia/t25/t2530p458.pdf}
}
\author{
Diego Paniagua Sánchez and Carlos J. Gil Bellosta
}
%\seealso{
%  \code{\link{as.data.frame.px}},
%}
\examples{
# This command reads a few lines sampled from 
# the households EPF file for 2011
x<- epf.2011.hogares(system.file("extdata",
                                 "sample_hogares_a2011.txt",
                                 package = "MicroDatosEs") )
summary(x)
}
\keyword{ manip }
