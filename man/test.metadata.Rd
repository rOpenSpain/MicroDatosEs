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
The function reads the microdata file using two standardized metadata files.
For some microdata files, the package provides the required metadata files; however, users may be willing to load other
microdata files using the package infrastructure or test metadata files before providing them to the maintainer for
inclusion in it.

The first metadata file deals with columns. It is a tab-separated file with five columns. The first one contains the column name.
Columns 2-4, the position where the column data starts and ends and its length. The last field is the column label.

The second metadata file deals with the column contents. It is also a tab separated file with five columns. The first one
is the column name.

The second one indicates the column type. There are two main types: "D" for dictionary and "N" for numeric.
Dictionary columns require a map from keys to values (columns 4 and 5): values read in the key column will be replaced
by the value column content. These columns can be left empty for numeric columns. The third column deals with options in
case NULL/NA values are found. There are other specialized column types not documented here. Adding new specialized column
types requires changing the inner code of other functions.

The third column indicates which code does the column use for NA values (in case, say, NULL values are marked with ".").
Occurrences of such code will be replaced with NA in the final table.

Note that the metadata files need to be stored in UTF-8 encoding.

The example section of this document shows the contents of a set of metadata files.
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
# Example of first metadata file
mdat1_example <- read.table(system.file("metadata", "epa_mdat1.txt",
 package = "MicroDatosEs"),
 header = TRUE, sep = "\t",
 fileEncoding = "UTF-8",
 stringsAsFactors = FALSE)
head(mdat1_example)

# Example of second metadata file
mdat2_example <- read.table(system.file("metadata", "epa_mdat2.txt",
 package = "MicroDatosEs"),
 header = TRUE, sep = "\t",
 fileEncoding = "UTF-8",
 stringsAsFactors = FALSE)

head(mdat2_example)

}

\keyword{ manip }
