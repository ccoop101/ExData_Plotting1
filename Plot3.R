# setwd("C:/Users/Carlito/Documents/Work/Coursera/4 Exploratory Data Analysis/Week1/Github")

#import, subset and convert dates
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data,(data$Date>="2007-02-01"& data$Date<="2007-02-02"))
data$FullDateTime <- paste(as.Date(data$Date), data$Time)
data$FullDateTime <- as.POSIXct(data$FullDateTime)

#plot and save file
with(data, {
  plot(Sub_metering_1~FullDateTime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~FullDateTime,col='Red')
  lines(Sub_metering_3~FullDateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()