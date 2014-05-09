start <- 66638
end <- 69517
nrows <- end - start
output <- "plot2.png"

data <- read.csv('household_power_consumption.txt', skip = 66638, 
              nrows = nrows, na.strings = "?", sep = ";")

colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$DateTime <- strptime(paste(as.Date(data$Date, "%d/%m/%Y"), data$Time), "%Y-%m-%d %H:%M:%S")

png(file = output)
with(data, plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()