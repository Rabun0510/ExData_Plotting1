# Exdata-013 project 1 plot 4

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

#Set plot parameter mfrow to 2 by 2 and plot all 4 required plots
par(mfrow = c(2,2))
#Plot 1
plot(plotData$DateTime, plotData$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(plotData$DateTime, plotData$Global_active_power, type = "l", lwd = 1, lty = "solid")

#Plot 2
plot(plotData$DateTime, plotData$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(plotData$DateTime, plotData$Voltage, type = "l", lwd = 1, lty = "solid")

#Plot 3
plot(plotData$DateTime, plotData$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", height = 480, width = 480)
lines(plotData$DateTime, plotData$Sub_metering_1, type = "l", lwd = 1, lty = "solid", col = "black")
lines(plotData$DateTime, plotData$Sub_metering_2, type = "l", lwd = 1, lty = "solid", col = "red")
lines(plotData$DateTime, plotData$Sub_metering_3, type = "l", lwd = 1, lty = "solid", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = c("solid","solid", "solid"),bty = "n")

#Plot 4
plot(plotData$DateTime, plotData$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_Reactive_Power")
lines(plotData$DateTime, plotData$Global_reactive_power, type = "l", lwd = 1, lty = "solid")

#Save the histogram plot as a png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()