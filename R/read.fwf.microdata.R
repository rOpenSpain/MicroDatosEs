###################################################################
# cjgb
# 20120305
# Reads a generic microdata file
# Changes:
#   20160806: changed workhorse to readr::read_fwf
###################################################################

read.fwf.microdata <- function(file, file.mdat.1, file.mdat.2, fileEncoding = "UTF-8"){
  
  ## read metadata
  foo <- function(x) read.table(x, header = T, sep = "\t", 
                                fileEncoding = fileEncoding,
                                stringsAsFactors = FALSE)
  mdat.1 <- foo(file.mdat.1)
  mdat.2 <- foo(file.mdat.2)

	## read fixed file using mdat1 metadata file
	dat <- read_fwf(file, fwf_widths(mdat.1$width, col_names = mdat.1$var))

	# Replaces keys in raw data by actual column values
	assign.labels <-  function(v, var.name, mdat){
	  
	  print(var.name)
	  
		tmp <- mdat[mdat$var == var.name,]

		# special cases: numeric, etc.
		if (nrow(tmp) == 1){
			if (!is.na(tmp$nulo) && any(v == tmp$nulo, na.rm = T))
				v[v == tmp$nulo] <- NA
			
			if (tmp$tipo == "N")
			  return(as.numeric(v))
			
			if(tmp$tipo == "HHMM"){
			  v <- as.numeric(v)
				return(v %/% 100 + ( v %% 100 ) / 60)
			}
			return(v)
		}
		
		v <- factor(v)
		
		# Check whether keys are numbers (usual case)
		# Then, format codes (maybe like "07") into codes such like "7"
		if (!any(is.na(as.numeric(levels(v))))){
		  levels(v) <- as.character(as.numeric(levels(v)))
		}
		
		# replace codes by descriptions
		levels(v) <- tmp$valor[match(levels(v), tmp$llave)]
		as.character(v)
	}

	as.data.frame(sapply(names(dat), function(x) assign.labels(dat[[x]], x, mdat.2), simplify = F))
}

