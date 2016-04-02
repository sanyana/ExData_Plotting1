pwr <- read.table("./household_power_consumption.txt", header = T, sep = ";", 
                  colClasses = c("character","character","double","double","double","double","double",
                                 "double","numeric"),na.strings = "?")
pwr$date <- as.Date(pwr$Date, format = "%d/%m/%Y")
pwr$time <- as.POSIXct(paste(pwr$Date,pwr$Time), format = "%d/%m/%Y %H:%M:%S")
pwrsub <- pwr[pwr$date == "2007-02-01"| pwr$date == "2007-02-02", ]
hist(pwrsub$Global_active_power, xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", col = 'red')
png("plots/plot1.png", width = 480, height = 480)
dev.off()