## this code creates and exports a histogram of Global Active Power as a png file named plot1.png

## read in the rows for only Feb 1, 2007 and Feb 2, 2007
hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=2880,skip=66636,stringsAsFactors=FALSE)
## read in columns 
hpc_cols<-read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=1)
## add the column names
colnames(hpc)<-colnames(hpc_cols)
## merge Date and Time in a new column
hpc$DateTime<-paste(hpc$Date,hpc$Time,sep=" ")
hpc$DateTime<-strptime(hpc$DateTime,"%d/%m/%Y %H:%M:%S")

# create plot1
hist(hpc$Global_active_power,main="Global Active Power", col="red",xlab="Global Active Power (kilowatts)")
# export plot1
dev.copy(png,file="plot1.png")
dev.off()

