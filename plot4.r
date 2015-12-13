dataSet <- "household_power_consumption.txt"
power <- read.table(dataSet, header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
Sample <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
GRP <- as.numeric(as.character(Sample$Global_reactive_power))
VTG <- as.numeric(as.character(Sample$Voltage))
Sample<- transform(Sample, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(Sample$Global_active_power)
SM1 <- as.numeric(Sample$Sub_metering_1)
SM2 <- as.numeric(Sample$Sub_metering_2)
SM3 <- as.numeric(Sample$Sub_metering_3)
  
#PLOTS
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

 plot(Sample$timestamp,GAP, type="l", xlab="", ylab="Global Active Power")
  plot(Sample$timestamp,VTG, type="l", xlab="datetime", ylab="Voltage")
  plot(Sample$timestamp,SM1, type="l", xlab="", ylab="Energy sub metering")
  lines(Sample$timestamp,SM2,col="red")
  lines(Sample$timestamp,SM3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)
  plot(Sample$timestamp,GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

  dev.off()
