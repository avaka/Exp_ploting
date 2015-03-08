household_power_consumption <- read.csv("C:/CourseraWork/EDA/household_power_consumption.txt", sep=";")


#selecting  dates 2007-02-01 and 2007-02-02


dt <- subset(household_power_consumption, household_power_consumption$Date == "1/2/2007" |
               household_power_consumption$Date == "2/2/2007",)

# converting data
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")
#adding day of the week
dt$day <- weekdays(dt$Date)


#genereting histogram
dt <- transform(dt, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")


par(mar = rep(2, 4))
par(mfrow=c(2,2))

#PLOT 1

plot(dt$timestamp,dt[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot 2

plot(dt$timestamp,dt[,5], type="l",  xlab="datetime", ylab="Voltage")

#plot 3
plot(dt$timestamp,dt$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dt$timestamp,dt$Sub_metering_2,col="red")
lines(dt$timestamp,dt$Sub_metering_3,col="blue")

#plot4
plot(dt$timestamp,dt[,4], type="l", xlab="datetime", ylab="Global_reactive_power")





png("plot4.png")

par(mar = rep(2, 4))
par(mfrow=c(2,2))

#PLOT 1

plot(dt$timestamp,dt[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot 2

plot(dt$timestamp,dt[,5], type="l",  xlab="datetime", ylab="Voltage")

#plot 3
plot(dt$timestamp,dt$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dt$timestamp,dt$Sub_metering_2,col="red")
lines(dt$timestamp,dt$Sub_metering_3,col="blue")

#plot4
plot(dt$timestamp,dt[,4], type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()