
#download data from the web to working directory and unzip it
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="w1data.zip")
unzip ("w1data.zip")

#read file into a data.frame and make a subset for data only from the dates 2007-02-01 and 2007-02-02
w1data<-read.csv("household_power_consumption.txt",header=TRUE, na.strings="?",sep=";")
w1datasub<-subset(w1data,w1data$Date=="1/2/2007" | w1data$Date =="2/2/2007")

#Create new column combining date and time and change to Date/Time variables
w1datasub$DateTime <- paste(w1datasub$Date,w1datasub$Time)
w1datasub$DateTime <- strptime(w1datasub$DateTime,"%d/%m/%Y %H:%M:%S")

#allocate 2x2 
par(mfrow=c(2,2))

#(1) plot left-top: type line for Global Active Power column
plot(w1datasub$DateTime,w1datasub$Global_active_power,type="l", ylab="Global Active Power",xlab="")

#(2) plot right-top: type line for Voltage column
plot(w1datasub$DateTime,w1datasub$Voltage,type="l", ylab="Voltage",xlab="datetime")

#(3) plot left-bottom: type line plot for Energy Sub Metering
plot(w1datasub$DateTime,w1datasub$Sub_metering_1,type="l", ylab="Energy Sub metering",xlab="")
lines(w1datasub$DateTime,w1datasub$Sub_metering_2, col="red")
lines(w1datasub$DateTime,w1datasub$Sub_metering_3, col="blue")

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7, y.intersp = 0.5)

#(4) plot right-bottom: type line for Global_reactive_power column
plot(w1datasub$DateTime,w1datasub$Global_reactive_power,type="l", ylab="Global reactive power",xlab="datetime")

#export file to png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
