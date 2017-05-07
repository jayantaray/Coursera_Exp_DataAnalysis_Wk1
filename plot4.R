my_data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
hist(my_data$Global_active_power)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
my_data$Date <- as.Date(my_data$Date, format="%d/%m/%Y")
power <- my_data[(my_data$Date=="2007-02-01") | (my_data$Date=="2007-02-02"),]
power <- my_data[(my_data$Date=="2007-02-01") | (my_data$Date=="2007-02-02"),]
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
power_days <- transform(power, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
plot4 <- par(mfrow=c(2,2))
##PLOT 1
plot(power_days$timestamp, power_days$Global_active_power, type="l", xlab="", ylab="Global Active Power")
##PLOT 2
plot(power_days$timestamp,power_days$Voltage, type="l", xlab="datetime", ylab="Voltage")
##PLOT 3
plot(power_days$timestamp, power_days$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power_days$timestamp,power_days$Sub_metering_2,col="red")
lines(power_days$timestamp,power_days$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
#PLOT 4
plot(power_days$timestamp,power_days$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
#OUTPUT
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()