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

par(mfrow=c(1,1))

## Plot 1
png("Plot1.png", width=480, height=480)
par(mfrow=c(1,1))
hist(powerSub$Global_active_power, xlab = " Global Active Power (kilowatts)", col= "red", main = "Global Active Power")
dev.off()