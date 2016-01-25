
##################---------------------#######################
#Store the input from text file to a table format
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Filtering the data necessary for the Graph
sub_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Converting Date and Time

dat_tm <- strptime(paste(sub_Data$Date, sub_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Converting the Data into a numeric form for histogram plotting
globalActPw <- as.numeric(sub_Data$Global_active_power)

#Saving the plot in .png format of required dimension
png("plot2.png", width=480, height=480)

plot(dat_tm, globalActPw, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

