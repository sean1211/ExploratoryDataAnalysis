dataSet <- "household_power_consumption.txt"
data <- read.table(dataSet, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Sample<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(Sample$Date, Sample$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

GAP <- as.numeric(as.character(Sample$Global_active_power))


hist(GAP, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

