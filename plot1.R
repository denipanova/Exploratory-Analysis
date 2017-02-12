###################################################################################################
##### Course Project 1  PLOT1
###################################################################################################

### Data
data =read.csv2('household_power_consumption.txt',header = TRUE, stringsAsFactors = FALSE) #not to convert the column to numeric
#convert the date column to date 
data$Date = strptime(data$Date, "%d/%m/%Y")
#subset the data for the particular time period 
data = data[data$Date >='2007-02-01' & data$Date <='2007-02-02',]

### graph
#open connection
png("plot1.png",width=480 ,height=480)
hist(as.numeric(as.character(data$Global_active_power)), # make sure it is numeric not level variable
     col = 'red', # colour
      xlab = 'Global Active Power (kilowatts', #axis name
     main = 'Global Active POwer') # title name
#Save the plot as png

dev.off()
