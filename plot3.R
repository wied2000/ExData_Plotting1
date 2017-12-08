#download data from the web to working directory and unzip it
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="w1data.zip")
unzip ("w1data.zip")

#read file into a data.frame and make a subset for data only from the dates 2007-02-01 and 2007-02-02
w1data<-read.csv("household_power_consumption.txt",header=TRUE, na.strings="?",sep=";")
w1datasub<-subset(w1data,w1data$Date=="1/2/2007" | w1data$Date =="2/2/2007")


#Create new column combining date and time and change to Date/Time variables
w1datasub$DateTime <- paste(w1datasub$Date,w1datasub$Time)
w1datasub$DateTime <- strptime(w1datasub$DateTime,"%d/%m/%Y %H:%M:%S")

#make type line plot for Energy Sub Metering
plot(w1datasub$DateTime,w1datasub$Sub_metering_1,type="l", ylab="Energy Sub metering",xlab="")
lines(w1datasub$DateTime,w1datasub$Sub_metering_2, col="red")
lines(w1datasub$DateTime,w1datasub$Sub_metering_3, col="blue")

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.9)

#export file to png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()