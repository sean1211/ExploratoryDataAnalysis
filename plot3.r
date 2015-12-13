dataSet <- "household_power_consumption.txt"
data <- read.table(dataSet, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Sample<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(Sample$Date, Sample$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

GAP <- as.numeric(Sample$Global_active_power)
SM1 <- as.numeric(Sample$Sub_metering_1)
SM2 <- as.numeric(Sample$Sub_metering_2)
SM3 <- as.numeric(Sample$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(datetime, SM1, type="l", ylab="Energy Sub Metering", xlab="")
lines(datetime, SM2, type="l", col="red")
lines(datetime, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()