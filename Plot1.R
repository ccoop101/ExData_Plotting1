# setwd("C:/Users/Carlito/Documents/Work/Coursera/4 Exploratory Data Analysis/Week1/Github")

#import, subset and convert dates
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data,(data$Date>="2007-02-01"& data$Date<="2007-02-02"))
data$FullDateTime <- paste(as.Date(data$Date), data$Time)
data$FullDateTime <- as.POSIXct(data$FullDateTime)

#plot and save file
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()