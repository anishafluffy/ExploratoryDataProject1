## this code creates and exports a line graph of Global Active Power over two days as a png file named plot2.png

## read in the rows for only Feb 1, 2007 and Feb 2, 2007
hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=2880,skip=66636,stringsAsFactors=FALSE)
## read in columns 
hpc_cols<-read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=1)
## add the column names
colnames(hpc)<-colnames(hpc_cols)
## merge Date and Time in a new column
hpc$DateTime<-paste(hpc$Date,hpc$Time,sep=" ")
hpc$DateTime<-strptime(hpc$DateTime,"%d/%m/%Y %H:%M:%S")

# create plot2
plot(hpc$DateTime,hpc$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
# export plot2
dev.copy(png,file="plot2.png")
dev.off()

