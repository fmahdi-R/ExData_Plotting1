library(data.table)
plot2 <- function () {
    # Unzip, read Data Table initialize vars , etc ... 
    outpng <- "plot2.png"
    zipfile <- "./exdata_data_household_power_consumption.zip"
    unzippedf <- unzip(zipfile,list = )
    DT <- fread(unzippedf, na.strings = c("?"))
        
    # Add mDate column to hold the date we need to subset
    DT[,mDate:=as.Date(Date,"%d/%m/%Y")]
    
    # Subset and assign to MOD_DT
    MOD_DT <- DT[DT$mDate >= "2007-02-01" & DT$mDate < "2007-02-03",]
    
    # Add new column of Date Time - concatenate 
    MOD_DT[,mDtTmChr:=paste(Date,Time)]
    
    # Set vars to plot
    x<- as.numeric(MOD_DT[,Global_active_power])
    d <- as.POSIXlt(MOD_DT[,mDtTmChr], format ="%d/%m/%Y %H:%M:%S")

    # Now Plot
    png(outpng,width = 480, height = 480, units = "px")
    plot(d,x,xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
    dev.off()
    
}


