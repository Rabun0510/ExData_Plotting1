# Exdata-013 project 1 plot 1

#Read the original data
originalData <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
#Add a column of DateTime that appends the date and time into one POSIXlt object
elecData <- cbind("DateTime" = strptime(paste(originalData$Date, originalData$Time), format = "%d/%m/%Y %H:%M:%S"), originalData)

#Filter the data according to the date
lowerDate <- as.POSIXlt("2007-02-01")
upperDate <- as.POSIXlt("2007-02-02")
dataToSelect <- (elecData$DateTime >= lowerDate)&(elecData$DateTime <= upperDate)
plotData <- elecData[dataToSelect,]

#Create a histogram on the windows graphic device
par(mfrow = c(1,1))
hist(plotData$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")

#Save the histogram plot as a png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()