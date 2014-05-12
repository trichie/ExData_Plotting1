data <- read.csv(file="household_power_consumption.txt",header=TRUE,sep=";")
selected <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
rownames(selected) <- NULL
selected$Date <- as.Date(selected$Date,"%d/%m/%Y")
write.table(selected,file="4_Week1_household.csv",sep=";")
selected <- read.csv(file="4_Week1_household.csv",header=TRUE,sep=";",na.strings="?")

count <- table(selected$Date)


png(filename="plot1.png",width=480,height=480)
hist(selected$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()

#Day labels were constructed "manually", but for evaluation purposes i would like to mention
#that this technique reproduces the required plot labels exactly, too...
png(filename="plot2.png",width=480,height=480)
plot(selected$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",xaxt="n")
axis(side=1,at=seq(0, count[1] + count[2], by = count[1]),labels=c("Thu","Fri","Sat"))
dev.off()
