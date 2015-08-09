#Read data from the given txt file
data <- read.csv("household_power_consumption.txt",header=TRUE, sep =";")
#Converting Date of data to "Date" format
data$Date <- as.Date(data$Date,"%d/%m/%Y")
#Extracting data corresponding to Feb 1st and 2nd
data_feb <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"),]
GAP <- as.numeric(levels(data_feb$Global_active_power)[data_feb$Global_active_power])
png(file="plot1.png",height=480,width=480)
hist(GAP,main="Global Active Power", col="Red",xlab="Global Active Power (kilowatts)" )
dev.off()