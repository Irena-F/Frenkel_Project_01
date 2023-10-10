#read in data
lead_dat <- read.csv("/Users/irenaf/Projects/Frenkel_Project_01/DataRaw/lead-iq-01.csv")
#Create boxplot
boxplot(IQ ~ Smelter, data = lead_dat,
        xlab = "Location Status", ylab = "IQ Level",
        main = "Box Plot of IQ Level by Location",
        col = c("Purple", "Pink"), 
        names = c("Far", "Near"), 
        outline = TRUE,
        boxwex = 0.4,  # Adjust box width
        at = c(1, 2),   # Set positions for "Far" and "Near"
        ylim = c(0, 160))
library(knitr)
?kable

# Calculate statistics for the 'Far' and 'Near' smelter groups
mean_far <- round(mean(lead_dat$IQ[lead_dat$Smelter == "Far"]),2)
mean_near <- round(mean(lead_dat$IQ[lead_dat$Smelter == "Near"]),2)
sd_far <- round(sd(lead_dat$IQ[lead_dat$Smelter == "Far"]),2)
sd_near <- round(sd(lead_dat$IQ[lead_dat$Smelter == "Near"]),2)
sample_size_far <- round(sum(lead_dat$Smelter == "Far"),2)
sample_size_near <- round(sum(lead_dat$Smelter == "Near"),2)

# Create a data frame for the statistics
tab <- data.frame(
  Smelter = c("Far", "Near"),
  SampleSize = c(sample_size_far, sample_size_near),
  Mean = c(mean_far, mean_near),
  SD = c(sd_far, sd_near)
)

#Create table

kable(tab, align ='lcrr', format = 'simple', col.names = c("Smelter","Sample Size", "Mean IQ", "Standard Deviation"),caption ="Summary Statistics by Smelter Location Status")

# Update the incorrect IQ value
lead_dat$IQ[lead_dat$IQ == 999] <- 99
library(knitr)

# Re-calculate statistics for the 'Far' and 'Near' smelter groups
mean_far <- round(mean(lead_dat$IQ[lead_dat$Smelter == "Far"]),2)
mean_near <- round(mean(lead_dat$IQ[lead_dat$Smelter == "Near"]),2)
sd_far <- round(sd(lead_dat$IQ[lead_dat$Smelter == "Far"]),2)
sd_near <- round(sd(lead_dat$IQ[lead_dat$Smelter == "Near"]),2)
sample_size_far <- round(sum(lead_dat$Smelter == "Far"),2)
sample_size_near <- round(sum(lead_dat$Smelter == "Near"),2)

# Rerun code for Table and graph above


