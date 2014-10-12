# setwd("C:/Users/Carlito/Documents/Work/Coursera/4 Exploratory Data Analysis/Week1/Github")

#import, subset and convert dates
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data,(data$Date>="2007-02-01"& data$Date<="2007-02-02"))
data$FullDateTime <- paste(as.Date(data$Date), data$Time)
data$FullDateTime <- as.POSIXct(data$FullDateTime)

#plot and save file
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~FullDateTime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~FullDateTime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~FullDateTime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~FullDateTime,col='Red')
  lines(Sub_metering_3~FullDateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~FullDateTime, type="l", 
       ylab="Global_reactive_powe",xlab="datetime")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()