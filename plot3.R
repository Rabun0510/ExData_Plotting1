# Exdata-013 project 1 plot 3

#Read the original data
originalData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
#Add a column of DateTime that appends the date and time into one POSIXlt object
elecData <- cbind("DateTime" = strptime(paste(originalData$Date, originalData$Time), format = "%d/%m/%Y %H:%M:%S"), originalData)

#Filter the data according to the date
lowerDate <- as.POSIXlt("2007-02-01")
upperDate <- as.POSIXlt("2007-02-03")
dataToSelect <- (elecData$DateTime >= lowerDate)&(elecData$DateTime <= upperDate)
plotData <- elecData[dataToSelect,]
plotData <- plotData[!is.na(plotData$DateTime),]

#Plot 3 superimposed line graphs of sub_metering_1 to sub_metering_3
par(mfrow = c(1,1))
plot(plotData$DateTime, plotData$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", height = 480, width = 480)
lines(plotData$DateTime, plotData$Sub_metering_1, type = "l", lwd = 1, lty = "solid", col = "black")
lines(plotData$DateTime, plotData$Sub_metering_2, type = "l", lwd = 1, lty = "solid", col = "red")
lines(plotData$DateTime, plotData$Sub_metering_3, type = "l", lwd = 1, lty = "solid", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = c("solid","solid", "solid"))

#Save the histogram plot as a png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()