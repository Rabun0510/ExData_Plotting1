# Exdata-013 project 1 plot 2

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

#Plot a line graph of Global_active_power
par(mfrow = c(1,1))
plot(plotData$DateTime, plotData$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(plotData$DateTime, plotData$Global_active_power, type = "l", lwd = 1, lty = "solid")

#Save the histogram plot as a png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()