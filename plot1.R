################################# 
# File: plot1.R 
# Description: Course Project 1 Plot 1
# Date: 4/9/2015
# Author: SD
# Notes: Creates plot1.png
# To do: 
################################# 

##Load and Filter Data
dat <- read.csv(".\\household_power_consumption.txt",header=T,sep=";",stringsAsFactors=F,na.strings="?")
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
power <- subset(dat,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Plot Histogram
with(power,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))

##Create .png
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off