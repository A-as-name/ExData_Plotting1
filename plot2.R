library(dplyr)

# Reading Data
df_epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
df_epc <- df_epc %>% filter(Date %in% c("1/2/2007", "2/2/2007"))


# Subsetting Data
df_epc$Datetime <- strptime(paste(df_epc$Date, df_epc$Time), "%d/%m/%Y %H:%M:%S")


# Formatting Data
df_epc$Global_active_power <- as.numeric(df_epc$Global_active_power)
str(df_epc)


# Making Plot
png(filename = "plot2.png", width = 480, height = 480)

plot(df_epc$Datetime, df_epc$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")


# Closing the graphics device
dev.off()
