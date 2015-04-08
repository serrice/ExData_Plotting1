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
# get the range for the x and y axis 
par(mar=c(4,4,4,1))
xrange <- range(hpowernew$dtime) 
yrange <- range(as.numeric(hpowernew$Sub_metering_3)*2) 
plot(xrange, yrange, type = "n", xlab="", ylab="Energy sub metering")
lines(hpowernew$dtime, as.numeric(hpowernew$Sub_metering_1), col = "black")
lines(hpowernew$dtime, as.numeric(hpowernew$Sub_metering_2), col = "red")
lines(hpowernew$dtime, as.numeric(hpowernew$Sub_metering_3), col = "purple")
legend("topright",  lwd=1, col = c("black", "red","purple"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
