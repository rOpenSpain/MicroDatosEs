###################################################################
# cjgb
# 20120305
# Function intended for testing metadata files
###################################################################

test.metadata <- function(file, md.1, md.2, encoding = "UTF-8"){
  read.fwf.microdata(file, md.1, md.2, fileEncoding = encoding)
}
