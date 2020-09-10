data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$Time<-paste(data$Date,data$Time)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
data$Time<-as.POSIXct(data$Time, format ="%d/%m/%Y %H:%M:%S")
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)
data$Global_intensity<-as.numeric(data$Global_intensity)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
plotdata<-subset(data, Date=="2007-02-01"|Date=="2007-02-02")
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))

with(plotdata, plot(Global_active_power~Time, type="l", 
                    ylab = "Global Active Power", xlab=""))

with(plotdata, plot(Sub_metering_1~Time, type="l", 
                    ylab = "Energy sub metering", xlab=""))
lines(plotdata$Sub_metering_2~plotdata$Time, col="red")
lines(plotdata$Sub_metering_3~plotdata$Time, col="blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ))
with(plotdata, plot(Voltage~Time, type="l", xlab="datetime"))
with(plotdata, plot(Global_reactive_power~Time, type="l", xlab="datetime"))
dev.off()