################################# 
# File: plot2.R 
# Description: Course Project 1 Plot 2
# Date: 4/9/2015
# Author: SD
# Notes: Creates plot2.png
# To do: 
################################# 

##Load and Filter Data
dat <- read.csv(".\\household_power_consumption.txt",header=T,sep=";",stringsAsFactors=F,na.strings="?")
dat$datetime <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
power <- subset(dat,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Plot Time Series
with(power,plot(datetime, Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

##Create .png
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off