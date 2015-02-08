## Coursera Exploratory Data Analysis Class - Project 1

## read file data already downloaded
fulldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ';')

## get subset of just two days worth for plotting
data_subset <- subset(fulldata,fulldata$Date=='1/2/2007' | fulldata$Date=='2/2/2007' )

## convert factor to numeric
data_subset$Global_active_power <- as.numeric(levels(data_subset$Global_active_power))[data_subset$Global_active_power]
## Add a new datetime column
data_subset$Datetime <- strptime(paste(data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")


## plot data
plot(data_subset$Datetime,data_subset$Global_active_power,ylab = 'Global Active Power(kilowatts)',xlab = ' ',type = 'l')

##copy to png file
dev.copy(png,'plot2.png')
dev.off()

