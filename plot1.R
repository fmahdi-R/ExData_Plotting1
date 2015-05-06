library(data.table)
plot1 <- function () {
    # Unzip, read Data Table initialize vars , etc ... 
    outpng <- "plot1.png"
    zipfile <- "./exdata_data_household_power_consumption.zip"
    unzippedf <- unzip(zipfile,list = )
    DT <- fread(unzippedf, na.strings = c("?"))
    
    # Add another column
    DT[,mDate:=as.Date(Date,"%d/%m/%Y")]
    # Subset Feb 01 2007 and Feb 02 2007
    MOD_DT <- DT[DT$mDate >= "2007-02-01" & DT$mDate < "2007-02-03",]

    #Set x as numeric and hist
    x<- as.numeric(MOD_DT[,Global_active_power])
    png(outpng,width = 480, height = 480, units = "px")
    hist(x,xlab = "Global Active Power (kilowatts)",col = "red",main = "Global Active Power")
    dev.off()
    
}