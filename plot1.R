# Read data
data <- read.csv2("household_power_consumption.txt", header=TRUE)

# Change date and time format to posix
data$DateTime <- paste(data$Date, data$Time)
data$DateTimePosix <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
newdata <- data[data$DateTimePosix > "2007-01-31 23:59:00 PST" & data$DateTimePosix < "2007-02-03 00:00:00 PST",]

# Change variable class type from factor to numeric

newdata$Global_active_power <- as.numeric(as.character(newdata$Global_active_power))

# Generate plots

png(file = "plot1.png")
hist(newdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

