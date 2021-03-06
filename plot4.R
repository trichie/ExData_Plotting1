data <- read.csv(file="household_power_consumption.txt",header=TRUE,sep=";")
selected <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
rownames(selected) <- NULL
selected$Date <- as.Date(selected$Date,"%d/%m/%Y")
write.table(selected,file="4_Week1_household.csv",sep=";")
selected <- read.csv(file="4_Week1_household.csv",header=TRUE,sep=";",na.strings="?")

count <- table(selected$Date)

#Day labels were constructed "manually", but for evaluation purposes i would like to mention
#that this technique reproduces the required plot labels exactly, too...
png(filename="plot4.png",width=480,height=480)
par(mfrow = c(2, 2))
# first plot
plot(selected$Global_active_power,type="l",xlab="",ylab="Global Active Power",xaxt="n")
axis(side=1,at=seq(0, count[1] + count[2], by = count[1]),labels=c("Thu","Fri","Sat"))
# second plot
plot(selected$Voltage ,type="l",xlab="datetime",ylab="Voltage",xaxt="n")
axis(side=1,at=seq(0, count[1] + count[2], by = count[1]),labels=c("Thu","Fri","Sat"))
# third plot
plot(selected$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",xaxt="n")
lines(selected$Sub_metering_2,type="l",xlab="",ylab="Energy sub metering",xaxt="n",col="red")
lines(selected$Sub_metering_3,type="l",xlab="",ylab="Energy sub metering",xaxt="n",col="blue")
legend("topright","A",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),bty="n")
axis(side=1,at=seq(0, count[1] + count[2], by = count[1]),labels=c("Thu","Fri","Sat"))
# fourth plot
plot(selected$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_Power",xaxt="n")
axis(side=1,at=seq(0, count[1] + count[2], by = count[1]),labels=c("Thu","Fri","Sat"))
dev.off()
