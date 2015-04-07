library(data.table)

dat <- fread("household_power_consumption.txt")
d1 <- which(dat$Date == "1/2/2007")
d2 <- which(dat$Date == "2/2/2007")
#select rows for the dates we are interested in
data <- dat[c(d1,d2),]
data
#create a new column for date and time
data$DateTime <- paste(data$Date, data$Time, sep=" ")
#create variable dt, which is the date and time
dt <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S")
str(data)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#position 1
plot(dt, as.numeric(data$Global_active_power), 
     type="l", ylab="Global Active Power", xlab="" )

#position 2
plot(dt, as.numeric(data$Voltage), 
     type="l", ylab="Voltage", xlab="dateTime" )

#position 3
plot(dt, as.numeric(data$Sub_metering_1), type="n", xlab="", ylab="Energy sub metering")
lines(dt, as.numeric(data$Sub_metering_1))
lines(dt, as.numeric(data$Sub_metering_2), col="red")
lines(dt, as.numeric(data$Sub_metering_3),col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ),
       col=c("black", "red","blue"), lty=1, bty="n")

#position 4
plot(dt, as.numeric(data$Global_reactive_power), 
     type="l", ylab="Global_reactive_power", xlab="dateTime" )

#close the connection
dev.off()
