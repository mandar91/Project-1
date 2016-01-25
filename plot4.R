##################---------------------#######################
#Store the input from text file to a table format
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Filtering the data necessary for the Graph
sub_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Converting Date and Time

dat_tm <- strptime(paste(sub_Data$Date, sub_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Converting the Data into a numeric form for histogram plotting
globalActPw <- as.numeric(subSetData$Global_active_power)
globalReactPw <- as.numeric(subSetData$Global_reactive_power)
volt <- as.numeric(subSetData$Voltage)
sub_1 <- as.numeric(subSetData$Sub_metering_1)
sub_2 <- as.numeric(subSetData$Sub_metering_2)
sub_3 <- as.numeric(subSetData$Sub_metering_3)

#Saving the plot in .png format of required dimension
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(dat_tm, globalActPw, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dat_tm, volt, type="l", xlab="datetime", ylab="Voltage")

plot(dat_tm, sub_1, type="l", ylab="Energy Submetering", xlab="")
lines(dat_tm, sub_2, type="l", col="red")
lines(dat_tm, sub_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dat_tm, globalReactPw, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
