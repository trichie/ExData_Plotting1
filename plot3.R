data <- read.csv(file="household_power_consumption.txt",header=TRUE,sep=";")
selected <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
rownames(selected) <- NULL
selected$Date <- as.Date(selected$Date,"%d/%m/%Y")
write.table(selected,file="4_Week1_household.csv",sep=";")
selected <- read.csv(file="4_Week1_household.csv",header=TRUE,sep=";",na.strings="?")

count <- table(selected$Date)

png(filename="plot3.png",width=480,height=480)
plot(selected$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",xaxt="n")
lines(selected$Sub_metering_2,type="l",xlab="",ylab="Energy sub metering",xaxt="n",col="red")
lines(selected$Sub_metering_3,type="l",xlab="",ylab="Energy sub metering",xaxt="n",col="blue")
legend("topright","A",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
axis(side=1,at=seq(0, count[1] + count[2], by = count[1]),labels=c("Thu","Fri","Sat"))
dev.off()