
# reding data
household_power_consumption <- read.csv("C:/CourseraWork/EDA/household_power_consumption.txt", sep=";")


#selecting  dates 2007-02-01 and 2007-02-02
 

dt <- subset(household_power_consumption, household_power_consumption$Date == "1/2/2007" |
             household_power_consumption$Date == "2/2/2007",)

#genereting histogram

hist(as.numeric(dt$Global_active_power),main="Global Active Power",xlab="Global Active Power(kilowatts)", col = "red")


#seving as png
png("plot1.png")
hist(as.numeric(dt$Global_active_power),main="Global Active Power",xlab="Global Active Power(kilowatts)", col = "red")
dev.off()