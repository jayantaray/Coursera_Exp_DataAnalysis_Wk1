my_data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
my_data$Date <- as.Date(my_data$Date, format="%d/%m/%Y")
power <- my_data[(my_data$Date=="2007-02-01") | (my_data$Date=="2007-02-02"),]
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
power_days <- transform(power, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
plot2 <- plot(power_days$timestamp, power_days$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()