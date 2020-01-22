library(dplyr)

# Reading Data
df_epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
df_epc <- df_epc %>% filter(Date %in% c("1/2/2007", "2/2/2007"))


# Subsetting Data
df_epc$Datetime <- strptime(paste(df_epc$Date, df_epc$Time), "%d/%m/%Y %H:%M:%S")


# Formatting Data
df_epc$Global_active_power <- as.numeric(df_epc$Global_active_power)
df_epc$Global_reactive_power <- as.numeric(df_epc$Global_reactive_power)
df_epc$Voltage <- as.numeric(df_epc$Voltage)
df_epc$Sub_metering_1 <- as.numeric(df_epc$Sub_metering_1)
df_epc$Sub_metering_2 <- as.numeric(df_epc$Sub_metering_2)
str(df_epc)


# Making Plot
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2), cex.lab = 0.8, cex.axis = 0.8)

## Graphic 1
plot(df_epc$Datetime, df_epc$Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power")

## Graphic 2
plot(df_epc$Datetime, df_epc$Voltage, type = "l", main = "", xlab = "datetime", ylab = "Voltage")

## Graphic 3
plot(df_epc$Datetime, df_epc$Sub_metering_1, type = "l", col = "black", main = "", xlab = "", ylab = "Energy sub metering")
lines(df_epc$Datetime, df_epc$Sub_metering_2, type = "l", col = "red")
lines(df_epc$Datetime, df_epc$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1), cex=0.7,bty = "n")

## Graphic 4
plot(df_epc$Datetime, df_epc$Global_reactive_power, type = "l", main = "", xlab = "datetime", ylab = "Global_reactive_power")


# Closing the graphics device
dev.off()
