dataSet <- "household_power_consumption.txt"
power <- read.table(dataSet, header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
Sample <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
Sample$Global_active_power <- as.numeric(as.character(df$Global_active_power))
Sample <- transform(Sample, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(Sample$timestamp,Sample$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
