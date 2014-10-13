
# code for reading the data
hpower <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
hpower01 <- subset(hpower, hpower$Date=="2/1/2007")
hpower02 <- subset(hpower, hpower$Date=="2/2/2007")
hpowernew <- rbind(hpower01, hpower02)
x <- paste(hpowernew$Date, hpowernew$Time)
dtime <- strptime(x, "%m/%d/%Y %H:%M:%S")
hpowernew <- cbind (dtime, hpowernew)

head(hpowernew)

# code for make plot

par(mfrow=c(2,2))

# PLOT 1
plot(hpowernew$dtime, as.numeric(hpowernew$Global_active_power)/1000, type = "n",xlab="", ylab="Global Active Power (kilowatts)")
lines(hpowernew$dtime, as.numeric(hpowernew$Global_active_power)/1000)

# PLOT 2
xrange <- range(hpowernew$dtime) 
yrange <- range(as.numeric(hpowernew$Voltage))

plot(xrange, yrange, type = "n", xlab="", ylab="Voltage")
lines(hpowernew$dtime, as.numeric(hpowernew$Voltage), col = "black")


# PLOT 3
# get the range for the x and y axis 
xrange <- range(hpowernew$dtime) 
yrange <- range(as.numeric(hpowernew$Sub_metering_3)*2) 
plot(xrange, yrange, type = "n", xlab="", ylab="Energy sub metering")
lines(hpowernew$dtime, as.numeric(hpowernew$Sub_metering_1), col = "black")
lines(hpowernew$dtime, as.numeric(hpowernew$Sub_metering_2), col = "red")
lines(hpowernew$dtime, as.numeric(hpowernew$Sub_metering_3), col = "purple")
legend("topright",  lwd=1, col = c("black", "red","purple"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# PLOT 4
# get the range for the x and y axis 
xrange <- range(hpowernew$dtime) 
yrange <- range(as.numeric(hpowernew$Global_reactive_power)/1000)

plot(xrange, yrange, type = "n", xlab="datetime", ylab="Global_reactive_power")
lines(hpowernew$dtime, as.numeric(hpowernew$Global_reactive_power)/1000, col = "black")

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
