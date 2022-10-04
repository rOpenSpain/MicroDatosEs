###################################################################
# cjgb
# 20120305
# Reads a generic microdata file
# Changes:
#   20160806: changed workhorse to readr::read_fwf
#   20170427: some microdata files are read outside this function
###################################################################

read.fwf.microdata <- function(
	file,
	file.mdat.1,
	file.mdat.2,
	fileEncoding = "UTF-8"){

	## read metadata
	foo <- function(x)
		read.table(x, header = TRUE, sep = "\t",
					fileEncoding = fileEncoding, stringsAsFactors = FALSE)

	mdat.1 <- foo(file.mdat.1)
	mdat.2 <- foo(file.mdat.2)

	## read fixed file using mdat1 metadata file
	## hides messages by read_fwf
	## 20170427: some microdata files are read outside this function

	if (!is.data.frame(file)){
		suppressMessages(
			dat <- read_fwf(file, fwf_widths(mdat.1$width, col_names = mdat.1$var))
		)
	} else {
		dat <- file
	}

	# Replaces keys in raw data by actual column values
	assign.labels <-  function(v, metadat){

		# happens!
		if (all(is.na(v)))
			return(v)

		tipo <- unique(metadat$tipo)

		if (length(tipo) > 1)
			stop("A column cannot have more than a single type: check metadata file for inconsistencies.")

		if (!tipo %in% c("D", "N", "HHMM"))
			stop("Column types can only be D (key-value), N (numeric) or HHMM (hour-minute).")

		# special cases: numeric, etc.
		if (nrow(metadat) == 1 && tipo != "D"){
			if (!is.na(metadat$nulo) && any(v == metadat$nulo, na.rm = TRUE))
				v[v == metadat$nulo] <- NA

			if (tipo == "N")
				return(as.numeric(v))

			if(tipo == "HHMM"){
				v <- as.numeric(v)
				return(v %/% 100 + ( v %% 100 ) / 60)
			}
			return(v)
		}

		# Check whether keys are numbers (usual case)
		# Mind the double negation!
		# Then, format codes (maybe like "07") into codes such like "7"
		v <- factor(v)
		if (!grepl("[^0-9]", paste(levels(v), collapse = ""))){
			levels(v) <- as.character(as.numeric(levels(v)))
		}

		# replace codes by descriptions (where available)
		# if no match, leave underlying code: it may correspond to municipality, etc.
		# indeed, in some cases (e.g., municipality) codes correspond to municipalities
		# and extra codes mark small size municipalities
		levels(v) <- sapply(levels(v), function(x) {
			if (length(where <- which(metadat$llave == x)) > 0)
				metadat$valor[where]
			else x
		})

		as.character(v)
	}

	for(colname in colnames(dat))
		dat[[colname]] <- assign.labels(dat[[colname]], mdat.2[mdat.2$var == colname,])

	dat
}
