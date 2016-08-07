\name{test.metadata}
\alias{test.metadata}

\title{
Reads microdata using user provided metadata files
}

\description{
This function reads a microdata file based on metadata provided by the user. It is particularly intended for the user to test the metadata before submitting it for inclusion in the package.
}

\usage{
test.metadata(file, md.1, md.2, encoding = "UTF-8" )
}

\arguments{
  \item{file}{ The name of the microdata file }
  \item{md.1}{ First metadata file }
  \item{md.2}{ Second metadata file }
  \item{encoding}{Either 'latin1' or 'UTF-8', the encoding used in the metadata files}
}
\details{
The function reads the microdata file using three standardized metadata files. For some microdata files, the package provides the required metadata files; however, users may be willing to load other microdata files using the package infrastructure or test metadata files before providing them to the maintainer for inclusion in it.
}

\value{
A \code{\link{data.frame}}.
}

\author{
Carlos J. Gil Bellosta
}

\examples{
# This command reads a few lines sampled from 
# the EPA for 2011Q1
x <- test.metadata(system.file("extdata", "sampleEPA0111.txt", package = "MicroDatosEs"),
                   system.file("metadata", "epa_mdat1.txt", package = "MicroDatosEs"),
                   system.file("metadata", "epa_mdat2.txt", package = "MicroDatosEs"))
}

\keyword{ manip }
