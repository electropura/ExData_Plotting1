# Load data

data <- read.csv2("household_power_consumption.txt", header=TRUE)

# Change date and time format to posix and select dates of interest

data$DateTime <- paste(data$Date, data$Time)
data$DateTimePosix <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
newdata <- data[data$DateTimePosix > "2007-01-31 23:59:00 PST" & data$DateTimePosix < "2007-02-03 00:00:00 PST",]

# Change variable class type from factor to numeric

newdata$Global_active_power <- as.numeric(as.character(newdata$Global_active_power))
newdata$Global_reactive_power <- as.numeric(as.character(newdata$Global_reactive_power))
newdata$Global_intensity <- as.numeric(as.character(newdata$Global_intensity))
newdata$Voltage <- as.numeric(as.character(newdata$Voltage))
newdata$Sub_metering_1 <- as.numeric(as.character(newdata$Sub_metering_1))
newdata$Sub_metering_2 <- as.numeric(as.character(newdata$Sub_metering_2))
newdata$Sub_metering_3 <- as.numeric(as.character(newdata$Sub_metering_3))

# Generate plots

png(file = "plot4.png")

par(mfrow=c(2,2))

plot(newdata$DateTimePosix, newdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(newdata$DateTimePosix, newdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(newdata$DateTimePosix, newdata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(newdata$DateTimePosix, newdata$Sub_metering_2, col = "red")
lines(newdata$DateTimePosix, newdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

plot(newdata$DateTimePosix, newdata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

