start <- 66638
end <- 69517
nrows <- end - start
output <- "plot4.png"

data <- read.csv('household_power_consumption.txt', skip = 66638, 
                 nrows = nrows, na.strings = "?", sep = ";")

colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$DateTime <- strptime(paste(as.Date(data$Date, "%d/%m/%Y"), data$Time), "%Y-%m-%d %H:%M:%S")

png(file = output)
par(mfrow = c(2,2))

# graph (1,1) - Global Active Power
with(data, plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power"))

# graph (1,2) - Voltage
with(data, plot(DateTime, Voltage, type="l", xlab = "datetime", ylab = "Voltage"))

# graph (2,1) - Energy Sub Metering  
with(data, plot(DateTime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", col="black"))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, bty = "n")

# graph(2,2) - Global_reactive_power
with(data, plot(DateTime, Global_reactive_power, type="l", xlab = "datetime"))
dev.off()