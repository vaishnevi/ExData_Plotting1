#Read data from the given txt file
data <- read.csv("household_power_consumption.txt",header=TRUE, sep =";")
#Converting Date of data to "Date" format
data$Date <- as.Date(data$Date,"%d/%m/%Y")
#Extracting data corresponding to Feb 1st and 2nd
data_feb <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"),]

SUB1 <- as.numeric(as.character(data_feb$Sub_metering_1))
SUB2 <- as.numeric(as.character(data_feb$Sub_metering_2))
SUB3 <- as.numeric(as.character(data_feb$Sub_metering_3))
png(file="plot3.png",height=480,width=480)
plot(SUB1,type="l",xaxt="n",xlab="",ylab="Energy Sub Metering",col="Black")
points(SUB2,type="l",xaxt="n",xlab="",col="Red")
points(SUB3,type="l",xaxt="n",xlab="",col="Blue")
legend('topright',lty=1, col=c('Black', 'Red', 'Blue'),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
days <- c("Thu","Fri","Sat")
axis(1, at=c(1,1440,2880),labels=days)
dev.off()