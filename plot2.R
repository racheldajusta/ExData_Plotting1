#Read in household power consumption data (seperated by ";" and NAs are represented by ?)
householdpowerconsumption <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na="?")
#Filtering on string to save some processing
householdpowerconsumption <- subset(householdpowerconsumption, Date=="1/2/2007" | Date=="2/2/2007")
#Convert time object to date & time
householdpowerconsumption$Time <- with(householdpowerconsumption, strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

#Create a line plot
with(householdpowerconsumption, plot(Time, Global_active_power, 
                         type="l",
                         xlab="",
                         ylab="Global Active Power (in kilowatts)")) 
#Copy to png
dev.copy(png,'plot2.png',  width = 480, height = 480)
#Close device
dev.off()