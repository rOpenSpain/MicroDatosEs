\name{censo2010}
\alias{censo2010}
\title{
Reads microdata for the 2010 decennial census provided by the INE
}
\description{
This function reads the microdata file for the Spanish 2010 Census.
}
\usage{
censo2010(file)
}

\arguments{
  \item{file}{ The name of the microdata file }
}
\details{
This function reads microdadata file for the 2010 decennial census in Spain.

Mind that a powerful computer may be needed to read the full census file. Reading the full set of columns may require a computer with almost 20GB of RAM. The INE provides a version of the data splitted into three different files that can be used instead.
}
\value{
A \code{as.data.frame}.
}

\author{
CarlosNeira with minor modifications by Carlos J. Gil Bellosta after data file format changes.
}

\examples{
## The first 1000 lines from the census file are provided within the package
c.file <- system.file("extdata", "sampleCenso2010.txt", 
                      package = "MicroDatosEs")
res <- censo2010(c.file)
summary(res)
}

\keyword{ manip }
