
#download data from the web to working directory and unzip it
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="w1data.zip")
unzip ("w1data.zip")

#read file into a data.frame and make a subset for data only from the dates 2007-02-01 and 2007-02-02
w1data<-read.csv("household_power_consumption.txt",header=TRUE, na.strings="?",sep=";")
w1datasub<-subset(w1data,w1data$Date=="1/2/2007" | w1data$Date =="2/2/2007")

#Create new column combining date and time and change to Date/Time variables
w1datasub$DateTime <- paste(w1datasub$Date,w1datasub$Time)
w1datasub$DateTime <- strptime(w1datasub$DateTime,"%d/%m/%Y %H:%M:%S")

#make plot type line for Global Active Power column
plot(w1datasub$DateTime,w1datasub$Global_active_power,type="l", ylab="Global Active Power (kilowatts)",xlab="")

#export file to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()