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


plot(dt$timestamp,dt$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dt$timestamp,dt$Sub_metering_2,col="red")
lines(dt$timestamp,dt$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) 


png("plot3.png")
plot(dt$timestamp,dt$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dt$timestamp,dt$Sub_metering_2,col="red")
lines(dt$timestamp,dt$Sub_metering_3,col="blue")

dev.off()