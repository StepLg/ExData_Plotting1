d = read.table("household_power_consumption.txt", header=T, sep=';', na.strings='?',
               colClasses=c(rep("character", 2), rep("numeric", 7)),
               stringsAsFactors=F, comment.char="")

d = d[d$Date == "1/2/2007" | d$Date == "2/2/2007", ]
d$DateTime = strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")

png(filename="plot1.png")

hist(d$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

dev.off()
