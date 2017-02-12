###################################################################################################
##### Course Project 1  PLOT2
###################################################################################################

### Data
data =read.csv2('household_power_consumption.txt',header = TRUE, stringsAsFactors = FALSE) #not to convert the column to numeric
#add additinal column to repesent the timestamp
data$timestamp <-paste(data$Date, data$Time)
#convert the date column to date 
data$Date = strptime(data$Date, "%d/%m/%Y")
#subset the data for the particular time period 
data = data[data$Date >='2007-02-01' & data$Date <='2007-02-02',]
### graph
#open connection
png("plot2.png",width=480 ,height=480)
plot(strptime(data$timestamp, "%d/%m/%Y %H:%M:%S"), #represent the rows as time series   
     data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

#Save the plot as png 
dev.off()
#Note my Language is set to cyrilic therefore the Week Days are abbreviated in different alphabet

