################################# 
# File: plot4.R 
# Description: Course Project 1 Plot 4
# Date: 4/9/2015
# Author: SD
# Notes: Creates plot4.png
# To do: 
################################# 

##Load and Filter Data
dat <- read.csv(".\\household_power_consumption.txt",header=T,sep=";",stringsAsFactors=F,na.strings="?")
dat$datetime <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
power <- subset(dat,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Plot 4x4
par(mfrow=c(2,2))
##Plot 1
with(power,plot(datetime, Global_active_power,type="l",xlab="",ylab="Global Active Power"))
##Plot2
with(power,plot(datetime, Voltage,type="l"))
##Plot 3
with(power,plot(datetime, Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(power,lines(datetime, Sub_metering_2,type="l",col="red"))
with(power,lines(datetime, Sub_metering_3,type="l",col="blue"))
legend("topright",col=c("black","blue","red"),lty=1,lwd=2,bty="n",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##Plot 4
with(power,plot(datetime, Global_reactive_power,type="l"))

##Create .png
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off