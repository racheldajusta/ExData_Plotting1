#Read in household power consumption data (seperated by ";" and NAs are represented by ?)
householdpowerconsumption <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na="?")
#Filtering on string to save some processing
householdpowerconsumption <- subset(householdpowerconsumption, Date=="1/2/2007" | Date=="2/2/2007")
#Not converting to date because not required for this plot

#Create a histogram plot with this data 
with(householdpowerconsumption, hist(Global_active_power, col="red", 
                         xlab="Global Active Power (kilowatts)",
                         main="Global Active Power",
                         ylim=c(0,1200)))

#Copy to png
dev.copy(png,'plot1.png',  width = 480, height = 480)
#Close device
dev.off() 
