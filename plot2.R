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

png("plot2.png", width = 480, height = 480)
plot(dt, as.numeric(data$Global_active_power), 
     type="l", ylab="Global Active Power (kilowatts)", xlab="", )
dev.off()