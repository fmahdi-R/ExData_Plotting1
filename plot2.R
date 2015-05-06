plot2 <- function () {
    outpng <- "plot2.png"
    #     MODT <- DT[,mDateTime:=paste(Date,Time)]
    #     MODT <- DT[,mTime:=strptime(Time,"%H:%M:%S")]
    DT[,mDate:=as.Date(Date,"%d/%m/%Y")]
    MOD_DT <- DT[DT$mDate >= "2007-02-01" & DT$mDate < "2007-02-03",]
    MOD_DT[,Day:=as.Date(Date,"%a")]
    MOD_DT[,mDtTmChr:=paste(Date,Time)]
    #MOD_DT
    x<- as.numeric(MOD_DT[,Global_active_power])
    d <- as.POSIXlt(MOD_DT[,mDtTmChr], format ="%d/%m/%Y %H:%M:%S")
    #MOD_DT
    
    png(outpng,width = 480, height = 480, units = "px")
    plot(d,x,xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
    dev.off()
    
}