## Coursera Exploratory Data Analysis Class - Project 1

## read file data already downloaded
fulldata <- read.table("household_power_consumption.txt", header = TRUE, sep = ';')

## get subset of just two days worth for plotting
data_subset <- subset(fulldata,fulldata$Date=='1/2/2007' | fulldata$Date=='2/2/2007' )

## convert factor to numeric
power <- as.numeric(levels(data_subset$Global_active_power))[data_subset$Global_active_power]

## plot histogram
hist(power,col='red',xlab = 'Global Active Power(kilowatts)',main = 'Global Active Power')

##copy to png file
dev.copy(png,'plot1.png')
dev.off()
