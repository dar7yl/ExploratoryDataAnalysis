png(filename = file.path("figure", "plot1.png"),
	 width = 480, height = 480, units = "px", pointsize = 12,
	 bg = "white", res = NA, family = "", restoreConsole = TRUE,
	 type = c("windows", "cairo", "cairo-png"), antialias="none")

hist( hpc$Global_active_power,
		main="Global Active Power",
		xlab="Global Active Power (kilowatts)", ylab="Frequency", 
		col="red")

dev.off()
