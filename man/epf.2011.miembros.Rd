\name{epf.2011.miembros}
\alias{epf.2011.miembros}
\title{
Function that reads the microdata file of household members belonging to the household budget survey provided by the INE.

}
\description{
This function reads the microdata file for household members statistics, as collected by the INE in Spain. It was
originally built using the metadata for the 2011 file and may work with microdata files for other
yearly submissions.
}
\usage{
epf.2011.miembros(file)
}

\arguments{
  \item{file}{ The name of the file of household members microdata file. }

}
\details{
This function reads microdadata files for households members statistics collected by the Spanish Statistical Office, INE. The survey data can be downloaded from http://www.ine.es/dyngs/INEbase/es/operacion.htm?c=Estadistica_C&cid=1254736176806&menu=resultados&secc=1254736195147&idp=1254735976608 

It has been built and tested on the 2011 files and may be able to read files conforming to later formats.
}
\value{
A data.set, a data structure defined in the memisc package.

}

\references{
http://www.ine.es/metodologia/t25/t2530p458.pdf
}
\author{
Diego Paniagua Sánchez
}
%\seealso{
%  \code{\link{as.data.frame.px}},
%}
\examples{
# This command reads a few lines sampled from the members household EPF file for 2011
sample.Epfmiembros2011 <- epf.2011.miembros(system.file( "extdata",
                                                      "sample_miembros_a2011.txt",
                                                      package = "MicroDatosEs") )
summary(as.data.frame(sample.Epfmiembros2011))
}

\keyword{ manip }
