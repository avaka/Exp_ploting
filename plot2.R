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
plot(dt$timestamp,dt[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")



#seving as png
png("plot2.png")
plot(dt$timestamp,dt[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()