## Coursera Exploratory Data Analysis Class - Project 1

## read file data already downloaded
fulldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ';')

## get subset of just two days worth for plotting
data_subset <- subset(fulldata,fulldata$Date=='1/2/2007' | fulldata$Date=='2/2/2007' )


## set grid
par(mfrow=c(2,2),mar=c(2,2,2,2))

## convert factor to numeric
data_subset$Global_active_power <- as.numeric(levels(data_subset$Global_active_power))[data_subset$Global_active_power]
data_subset$Global_reactive_power <- as.numeric(levels(data_subset$Global_reactive_power))[data_subset$Global_reactive_power]
data_subset$Voltage <- as.numeric(levels(data_subset$Voltage))[data_subset$Voltage]

data_subset$Sub_metering_1 <- as.numeric(levels(data_subset$Sub_metering_1))[data_subset$Sub_metering_1]
data_subset$Sub_metering_2 <- as.numeric(levels(data_subset$Sub_metering_2))[data_subset$Sub_metering_2]
data_subset$Sub_metering_3 <- as.numeric(levels(data_subset$Sub_metering_3))[data_subset$Sub_metering_3]
## Add a new datetime column
data_subset$Datetime <- strptime(paste(data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")


## plot data
plot(data_subset$Datetime,data_subset$Global_active_power,ylab = 'Global Active Power',xlab = ' ',type = 'l')
plot(data_subset$Datetime,data_subset$Voltage,ylab= 'Voltage', xlab = ' ',type = 'l')


plot(data_subset$Datetime,data_subset$Sub_metering_1,ylab = 'Sub Metering Energy',xlab = ' ',type = 'l')
lines(data_subset$Datetime,data_subset$Sub_metering_2,ylab = 'Sub Metering Energy',xlab = ' ',type = 'l',col='red')
lines(data_subset$Datetime,data_subset$Sub_metering_3,ylab = 'Sub Metering Energy',xlab = ' ',type = 'l',col='blue')
legend('topright',lty=1,col=c('black','red','blue'),legend = c('Sub_Metering_1', 'Sub_Metering_2','Sub_Metering_3'))


plot(data_subset$Datetime,data_subset$Global_reactive_power,ylab ='Global_reactive_power', xlab = ' ',type = 'l')

##copy to png file
dev.copy(png,'plot4.png')
dev.off() 
