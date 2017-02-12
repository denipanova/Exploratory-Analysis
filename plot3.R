###################################################################################################
##### Course Project 1  PLOT3
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
png("plot3.png",width=480 ,height=480)
#add the main plot 
plot(strptime(data$timestamp, "%d/%m/%Y %H:%M:%S"), #represent the rows as time series   
     data$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub mattering")
#add setting the scond line
lines(strptime(data$timestamp, "%d/%m/%Y %H:%M:%S"),
      data$Sub_metering_2,
      type ='l',
      col = 'red')
#add the third one 
lines(strptime(data$timestamp, "%d/%m/%Y %H:%M:%S"),
      data$Sub_metering_3,
      type ='l',
      col = 'blue')
#add the legend
legend('topright', #position
      lty = 1,
       col = c('Black',"Red",'Blue'),
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

#Save the plot as png

dev.off()
