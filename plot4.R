## this code creates and exports four graphs of 
	## Global Active Power, Voltage, Sub Metering, and Global Reactive Power over two days 
	## as a png file named plot4.png

## read in the rows for only Feb 1, 2007 and Feb 2, 2007
hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=2880,skip=66636,stringsAsFactors=FALSE)
## read in columns 
hpc_cols<-read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=1)
## add the column names
colnames(hpc)<-colnames(hpc_cols)
## merge Date and Time in a new column
hpc$DateTime<-paste(hpc$Date,hpc$Time,sep=" ")
hpc$DateTime<-strptime(hpc$DateTime,"%d/%m/%Y %H:%M:%S")

# create plot4
par(mfrow=c(2,2))
with(hpc, {
	# create top left
  plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
	# create top right
  plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")  
	# create bottom left
  plot(DateTime, Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
		 fill = NULL, border = NULL, lty=c(1,1,1), lwd=c(1,1,1), col=c("black","blue","red"))
	# create bottom right
  plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")  
})
# export plot4
dev.copy(png,file="plot4.png")
dev.off()

