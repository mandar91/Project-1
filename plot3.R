
##################---------------------#######################
#Store the input from text file to a table format
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Filtering the data necessary for the Graph
sub_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Converting Date and Time

dat_tm <- strptime(paste(sub_Data$Date, sub_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Converting the Data into a numeric form for histogram plotting

sub_1 <- as.numeric(subSetData$Sub_metering_1)
sub_2 <- as.numeric(subSetData$Sub_metering_2)
sub_3 <- as.numeric(subSetData$Sub_metering_3)

#Saving the plot in .png format of required dimension
png("plot3.png", width=480, height=480)

plot(dat_tm, sub_1, type="l", ylab="Energy Submetering", xlab="")
lines(dat_tm, sub_2, type="l", col="red")
lines(dat_tm, sub_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

