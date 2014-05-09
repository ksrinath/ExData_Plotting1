start <- 66638
end <- 69517
nrows <- end - start
output <- "plot1.png"

data <- read.csv('household_power_consumption.txt', skip = 66638, 
                 nrows = nrows, na.strings = "?", sep = ";")

colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

png(file = output)
hist(data$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()