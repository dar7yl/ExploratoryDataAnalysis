png(filename = file.path("figure", "plot3.png"),
	 width = 480, height = 480, units = "px", pointsize = 12,
	 bg = "white", res = NA, family = "", restoreConsole = TRUE,
	 type = c("windows", "cairo", "cairo-png"), antialias="none")

with( hpc, {plot(DateTime,Sub_metering_1, col="black", 
					  type="l", xlab=NA, ylab="Energy sub metering"); 
				lines(DateTime,Sub_metering_2, col="red"); 
				lines(DateTime,Sub_metering_3, col="blue");
})

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		 col=c("black", "red", "blue"), lty=c(1,1,1) )

dev.off()
