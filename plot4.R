
setwd("D:/sergio/Coursera/04_Exploratory Data Analysis/Course Project 1")
# code for reading the data
hpower <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactor=FALSE)
hpower01 <- subset(hpower, hpower$Date=="1/2/2007")
hpower02 <- subset(hpower, hpower$Date=="2/2/2007")
hpowernew <- rbind(hpower01, hpower02)
x <- paste(hpowernew$Date, hpowernew$Time)
dtime <- strptime(x, "%d/%m/%Y %H:%M:%S")
hpowernew <- cbind (dtime, hpowernew)
Sys.setlocale("LC_TIME", "English")



# code for make plot

# par(mfrow=c(2,2), mar=c(4,4,0.5,0.5), oma=c(1,1,1,1))
# par(mfrow=c(2,2), mar=c(4,4,4,1))
par(mfrow=c(2,2))

# PLOT 1
plot(hpowernew$dtime, as.numeric(hpowernew$Global_active_power), type = "n",xlab="", ylab="Global Active Power")
lines(hpowernew$dtime, as.numeric(hpowernew$Global_active_power))

# PLOT 2
plot(hpowernew$dtime, as.numeric(hpowernew$Voltage), type = "n",xlab="datetime", ylab="Voltage")
lines(hpowernew$dtime, as.numeric(hpowernew$Voltage), col = "black")

# PLOT 3
xrange <- range(hpowernew$dtime) 
yrange <- range(as.numeric(hpowernew$Sub_metering_3)*2) 
plot(xrange, yrange, type = "n", xlab="", ylab="Energy sub metering")
lines(hpowernew$dtime, as.numeric(hpowernew$Sub_metering_1), col = "black")
lines(hpowernew$dtime, as.numeric(hpowernew$Sub_metering_2), col = "red")
lines(hpowernew$dtime, as.numeric(hpowernew$Sub_metering_3), col = "purple")

legend("topright",
       lwd=1, 
       bty = "n",    
       # pch=0.8,
       col = c("black", "red","purple"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

# PLOT 4
# get the range for the x and y axis 
xrange <- range(hpowernew$dtime) 
yrange <- range(as.numeric(hpowernew$Global_reactive_power))
plot(xrange, yrange, type = "n", xlab="datetime", ylab="Global_reactive_power")
lines(hpowernew$dtime, as.numeric(hpowernew$Global_reactive_power), col = "black")

dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
