#Read in household power consumption data (seperated by ";" and NAs are represented by ?)
householdpowerconsumption <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na="?")
#Filtering on string to save some processing
householdpowerconsumption <- subset(householdpowerconsumption, Date=="1/2/2007" | Date=="2/2/2007")
#Convert time object to date & time
householdpowerconsumption$Time <- with(householdpowerconsumption, strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

#Create a line plot with the first submetering
with(householdpowerconsumption, plot(Time, Sub_metering_1, 
     type="l", ylab="Energy sub metering"))
# add other submeterings
with(householdpowerconsumption, lines(Time, Sub_metering_2, col="red"))
with(householdpowerconsumption, lines(Time, Sub_metering_3, col="blue"))
# add a legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red", "blue"))

#Copy to png
dev.copy(png,'plot3.png',  width = 480, height = 480)
#Close device
dev.off()