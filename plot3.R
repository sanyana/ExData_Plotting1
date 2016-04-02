pwr <- read.table("./household_power_consumption.txt", header = T, sep = ";", 
                  colClasses = c("character","character","double","double","double","double","double",
                                 "double","numeric"),na.strings = "?")
pwr$date <- as.Date(pwr$Date, format = "%d/%m/%Y")
pwr$time <- as.POSIXct(paste(pwr$Date,pwr$Time), format = "%d/%m/%Y %H:%M:%S")
pwrsub <- pwr[pwr$date == "2007-02-01"| pwr$date == "2007-02-02", ]
png("plot3.png", width = 480, height = 480, type = "quartz")
plot(pwrsub$time, pwrsub$Sub_metering_1, main = " ", type= 'l', ylab = "Energy sub metering", 
     xlab = NA, col = "black", cex = 0.8)
lines(pwrsub$time, pwrsub$Sub_metering_2, col = "red", cex = 0.8)
lines(pwrsub$time, pwrsub$Sub_metering_3, col = "blue", cex = 0.8)
legend("topright", lty = 1, cex = 0.6, col = c("black","red", 'blue'),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()
