setwd("C:/Users/Carlito/Documents/Work/Coursera/4 Exploratory Data Analysis/Week1/Github")

household_power_consumption <- read.csv("C:/Users/Carlito/Documents/Work/Coursera/4 Exploratory Data Analysis/Week1/Github/household_power_consumption.txt", sep=";", na.strings="?")

#convert fields
str(household_power_consumption)
household_power_consumption <- subset(household_power_consumption,household_power_consumption$Date %in% c("1/2/2007","2/2/2007"))
##REMOVE
data<-household_power_consumption

household_power_consumption$DateTime <-paste(household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$DateTime2 <- as.Date(household_power_consumption$DateTime,"%d/%m/%y %H:%M:%S")

str(household_power_consumption)

#Plots
hist(household_power_consumption$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

with(household_power_consumption,hist(household_power_consumption$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off




household_power_consumption$Date <- as.Date(strptime(household_power_consumption$DateTime,"%d/%m/%y"))
household_power_consumption$Time <- as.Date(strptime(household_power_consumption$DateTime,"%H:%M:%S"))
str(household_power_consumption)
data <- subset(household_power_consumption,household_power_consumption$Date>="2007-02-01")## && household_power_consumption$Date<="2007-02-02")
data1 <- subset(household_power_consumption,household_power_consumption$Date<="2007-02-02")

hist(household_power_consumption$Global_active_power)

# household_power_consumption$Date <- as.Date(household_power_consumption$Date)
# household_power_consumption$Time <- as.Date(strptime(household_power_consumption$Time))
# str(household_power_consumption)
# head(household_power_consumption)