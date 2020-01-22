library(dplyr)

# Reading Data
df_epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)


# Subsetting Data
df_epc$Date <- as.Date(df_epc$Date, format = "%d/%m/%Y")
df_epc <- df_epc %>% filter(Date >= as.Date("2007-02-01"), Date <= as.Date("2007-02-02"))


# Formatting Data
df_epc$Global_active_power <- as.numeric(df_epc$Global_active_power)
str(df_epc)


# Making Plot
png(filename = "plot1.png", width = 480, height = 480)
hist(df_epc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")


# Closing the graphics device
dev.off()
