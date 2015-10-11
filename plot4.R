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

## Plot 4

png("Plot4.png", width=480, height=480)
par(mfrow = c(2,2))
hist(powerSub$Global_active_power, xlab = " Global Active Power (kilowatts)", col= "red", main = "Global Active Power")

plot(powerSub$Time,powerSub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

plot(powerSub$Time,powerSub$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(powerSub$Time, powerSub$Sub_metering_2, col="red")
lines(powerSub$Time, powerSub$Sub_metering_3, col="blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lwd=c(2.5,2.5))

plot(powerSub$Time, powerSub$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")

dev.off()