my_data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
hist(my_data$Global_active_power)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
my_data$Date <- as.Date(my_data$Date, format="%d/%m/%Y")
power <- my_data[(my_data$Date=="2007-02-01") | (my_data$Date=="2007-02-02"),]
power <- my_data[(my_data$Date=="2007-02-01") | (my_data$Date=="2007-02-02"),]
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
plot1 <- hist(power$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()