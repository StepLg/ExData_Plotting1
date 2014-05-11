d = read.table("household_power_consumption.txt", header=T, sep=';', na.strings='?',
               colClasses=c(rep("character", 2), rep("numeric", 7)),
               stringsAsFactors=F, comment.char="")

d = d[d$Date == "1/2/2007" | d$Date == "2/2/2007", ]
d$DateTime = strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")

png(filename="plot4.png")

par(mfrow=c(2, 2))

plot(d$DateTime, d$Global_active_power, type='l',
     xlab="", ylab="Global Active Power (kilowatts)")

plot(d$DateTime, d$Voltage, type='l',
     xlab="datetime", ylab="Voltage")

plot(d$DateTime, d$Sub_metering_1,
     type='l',
     xlab="", ylab="Energy sub metering")

lines(d$DateTime, d$Sub_metering_2, col="red")
lines(d$DateTime, d$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1, 1), bty='n',
       col=c("black", "red", "blue"))

plot(d$DateTime, d$Global_reactive_power, type='l',
     xlab="datetime", ylab="Global_reactive_power")

dev.off()
