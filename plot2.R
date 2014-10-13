
# code for reading the data
hpower <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
hpower01 <- subset(hpower, hpower$Date=="2/1/2007")
hpower02 <- subset(hpower, hpower$Date=="2/2/2007")
hpowernew <- rbind(hpower01, hpower02)
x <- paste(hpowernew$Date, hpowernew$Time)
dtime <- strptime(x, "%m/%d/%Y %H:%M:%S")
hpowernew <- cbind (dtime, hpowernew)

# code for make plot
plot(hpowernew$dtime, as.numeric(hpowernew$Global_active_power)/1000, type = "n",xlab="", ylab="Global Active Power (kilowatts)")
lines(hpowernew$dtime, as.numeric(hpowernew$Global_active_power)/1000)
dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!