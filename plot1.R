#download data from the web to working directory and unzip it
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="w1data.zip")
unzip ("w1data.zip")

#read file into a data.frame and make a subset for data only from the dates 2007-02-01 and 2007-02-02
w1data<-read.csv("household_power_consumption.txt",header=TRUE, na.strings="?",sep=";")
w1datasub<-subset(w1data,w1data$Date=="1/2/2007" | w1data$Date =="2/2/2007")

#make histogram plot Global Active Power column
hist(as.numeric(w1datasub$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")

## export file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
