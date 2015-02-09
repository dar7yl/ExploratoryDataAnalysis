## This will load the data 
load_data <- function ()
{
	zip_fi <-file.info(file.path("data", "exdata_data_household_power_consumption.zip"))$ctime
	# first check to see if we have cached the file
	 
	hpc_cached <- file.access(file.path("data", "hpc.RData"))
	if (hpc_cached < 0) # it's not there
	{
		print("Reading, Subsetting and Cacheing hpc")
		setClass('mericanDate')
		setAs("character","mericanDate", function(from) as.POSIXct(from, format="%d/%m/%Y") )
		
		hpc_Classes <- c( "mericanDate", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
		
		# I could have read only a subset of the csv but I decided to brute force it in,
		# and then select the dates I'm interested in.
		
		household_power_consumption <- read.csv( file.path("data", "household_power_consumption.txt"), 
		 			 header=TRUE, sep=";", quote="\"", na.strings="?", colClasses= hpc_Classes,
		 			 nrows=70000, stringsAsFactors=FALSE);
		
		summary(household_power_consumption)
		
		dt <- which(household_power_consumption$Date>="2007-02-01" 
		 			& household_power_consumption$Date <="2007-02-02")
		hpc <- household_power_consumption[dt,]
		
		# convert date+time to datetime column - convolution because POSIXct doesn't support adding.
		hpc$DateTime=as.POSIXct(paste(format(hpc$Date),hpc$Time,sep=" "))
		
		save("hpc", file=file.path("data", "hpc.RData"))
		file.info(file=file.path("data", "hpc.RData"))
		hpc;	#return the table
	} 
	else 
	{
		print("Loading cached data");
		load( file = file.path("Data", "hpc.RData") )
		print("Loaded cached hpc")
		hpc; #return the table
	}
}