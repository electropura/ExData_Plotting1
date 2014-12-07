# Load data

data <- read.csv2("household_power_consumption.txt", header=TRUE)

# Change date and time format to posix

data$DateTime <- paste(data$Date, data$Time)
data$DateTimePosix <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
newdata <- data[data$DateTimePosix > "2007-01-31 23:59:00 PST" & data$DateTimePosix < "2007-02-03 00:00:00 PST",]

# Change variable class type from factor to numeric

newdata$Sub_metering_1 <- as.numeric(as.character(newdata$Sub_metering_1))
newdata$Sub_metering_2 <- as.numeric(as.character(newdata$Sub_metering_2))
newdata$Sub_metering_3 <- as.numeric(as.character(newdata$Sub_metering_3))

# Generate plots

png(file = "plot3.png")
plot(newdata$DateTimePosix, newdata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(newdata$DateTimePosix, newdata$Sub_metering_2, col = "red")
lines(newdata$DateTimePosix, newdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()

