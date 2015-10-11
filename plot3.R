## Exploratory Data Analysis 

powerData <- read.table("household_power_consumption.txt", na.strings=c("?",""), header=TRUE, sep=";")

str(powerData)

## make the first column class Date
powerData[,Date:= as.Date(Date,format="%d/%m/%Y")]
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")

str(powerData)

powerData$timetemp <- paste(powerData$Date, powerData$Time)
str(powerData)

powerData$Time <- strptime(powerData$timetemp, format = "%Y-%m-%d %H:%M:%S")

## subset 
powerSub <- subset(powerData,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Plot 3
png("Plot3.png", width=480, height=480)
plot(powerSub$Time,powerSub$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(powerSub$Time, powerSub$Sub_metering_2, col="red")
lines(powerSub$Time, powerSub$Sub_metering_3, col="blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lwd=c(2.5,2.5))

dev.off()