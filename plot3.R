## this code creates and exports a line graph of Sub Metering 1, 2 and 3 over two days as a png file named plot3.png 

## read in the rows for only Feb 1, 2007 and Feb 2, 2007
hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=2880,skip=66636,stringsAsFactors=FALSE)
## read in columns 
hpc_cols<-read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=1)
## add the column names
colnames(hpc)<-colnames(hpc_cols)
## merge Date and Time in a new column
hpc$DateTime<-paste(hpc$Date,hpc$Time,sep=" ")
hpc$DateTime<-strptime(hpc$DateTime,"%d/%m/%Y %H:%M:%S")

# create plot3
plot(hpc$DateTime, hpc$Sub_metering_1, col = "black", type = "l",xlab = "", ylab = "Energy sub metering")
lines(hpc$DateTime, hpc$Sub_metering_2, col = "red")
lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1), col=c("black","blue","red"))
# export plot3
dev.copy(png,file="plot3.png")
dev.off()

