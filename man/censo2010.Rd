\name{censo2010}
\alias{censo2010}
\title{
Reads microdata for the 2010 decennial census provided by the INE
}
\description{
This function reads the microdata file for the Spanish 2010 Census.
}
\usage{
censo2010(census.file, columns = NULL, summary = TRUE)
}

\arguments{
  \item{census.file}{ The name of the microdata file }
  \item{columns}{Names of the columns that need to be read; \code{NULL} for all}
  \item{summary}{Whether just to print a summary of the contents of the file; defaults to \code{TRUE}}
}
\details{
This function reads microdadata file for the 2010 decennial census in Spain.

Mind that a powerful computer may be needed to read the full census file. For this reason, the \code{summary} parameter is set to \code{TRUE} by default. Users are advised to review the contents of the file first (keeping the \code{summary=TRUE} default) to explore its contents and then call the function again after setting the \code{columns} parameter apropriately to read just the desired subset of columns.

Reading the full set of columns may require a computer with almost 20GB of RAM. 
}
\value{
By default, the function just prints a summary of the contents of the microdata file. 

If the \code{summary} is set to \code{FALSE}, the function returns a \code{data.set}. This class is defined in package \code{memisc}. Most users will want to transform the output to a regular \code{data.frame} using function \code{as.data.frame}.
}
%\references{
%}
\author{
CarlosNeira with minor modifications by Carlos J. Gil Bellosta after data file format changes.
}
%\seealso{
%  \code{\link{as.data.frame.px}},
%}
\examples{
## The first 1000 lines from the census file are provided within the package
c.file <- system.file("extdata", "sampleCenso2010.txt", package = "MicroDatosEs")

# Get a summary of the contents of the census
censo2010(c.file)

# Read a selection of rows
res <- censo2010(c.file, columns = c("cpro", "cmun", "factor"), summary = FALSE)

# Turn them into a regular data.frame
as.data.frame(res)

# Read all rows
res <- censo2010(c.file, summary = FALSE)
summary(res)

summary(as.data.frame(res))
}

\keyword{ manip }
