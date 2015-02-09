png(filename = file.path("figure", "plot2.png"),
	 width = 480, height = 480, units = "px", pointsize = 12,
	 bg = "white", res = NA, family = "", restoreConsole = TRUE,
	 type = c("windows", "cairo", "cairo-png"), antialias="none")

with (hpc, plot(DateTime, Global_active_power, type="l",
		xlab="Date", ylab="Global Active Power (kilowatts)", 
		col="black") )

dev.off()
