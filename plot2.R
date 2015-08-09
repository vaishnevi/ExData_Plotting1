#Read data from the given txt file
data <- read.csv("household_power_consumption.txt",header=TRUE, sep =";")
#Converting Date of data to "Date" format
data$Date <- as.Date(data$Date,"%d/%m/%Y")
#Extracting data corresponding to Feb 1st and 2nd
data_feb <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"),]
GAP <- as.numeric(levels(data_feb$Global_active_power)[data_feb$Global_active_power])
png(file="plot2.png",height=480,width=480)
plot(GAP,type="l",xaxt="n",xlab="",ylab="Global Active Power(kilowatts)")
days <- c("Thu","Fri","Sat")
axis(1, at=c(1,1440,2880),labels=days)
dev.off()