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
hist(as.numeric(hpowernew$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

