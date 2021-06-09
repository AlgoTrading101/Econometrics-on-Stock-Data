#install.packages("tidyquant")
library(tidyquant)

# Obtaining Stock Data

boxx <- tq_get('BOX',
              from = '2020-01-01',
              to = '2021-06-06',
              get = 'stock.prices')

dropbox <- tq_get('DBX',
                  from = '2020-01-01',
                  to = '2021-06-06',
                  get = 'stock.prices')

head(boxx)
class(boxx)

# Graphing Stock Data

library(ggplot2)

boxx %>%
  ggplot(aes(x = date, y = adjusted)) +
  geom_line() +
  theme_classic() +
  labs(x = 'Date',
       y = "Adjusted Price",
       title = "Box price chart") +
  scale_y_continuous(breaks = seq(0,300,10))

dropbox %>%
  ggplot(aes(x = date, y = adjusted)) +
  geom_line() +
  theme_classic() +
  labs(x = 'Date',
       y = "Adjusted Price",
       title = "Dropbox price chart") +
  scale_y_continuous(breaks = seq(0,300,10))


# Merge data and rename columns

merged <- merge(boxx, dropbox, by=c("date"))
head(merged)

df = subset(merged, select=c("date","adjusted.x","adjusted.y"))

names(df)[names(df) == "adjusted.x"] <- "box"
names(df)[names(df) == "adjusted.y"] <- "dropbox"

head(df)

# Save the data

write.csv(df, "box_dropbox.csv")

# Load the data

df <- read.csv("box_dropbox.csv")
df <- df[,-1]


# Linear regression

attach(df)

reg <- lm(box~dropbox, data=df)
summary(reg)

reg <- lm(dropbox~box, data=df)
summary(reg)

par(mfrow=c(2,2))
plot(reg)

# Granger Test

library(lmtest)

grangertest(box ~ dropbox, order = 3, data=df)
grangertest(dropbox ~ box, order = 3, data=df)

# Serial Correlation Test

dwtest(reg)
residuals = reg$residuals
plot(residuals, type='l')

sub_box <- subset(df, select=c("date","box"))
sub_dropbox <- subset(df, select=c("date","dropbox"))

d_box = diff(as.numeric(unlist(sub_box["box"])))
d_dbox = diff(as.numeric(unlist(sub_dropbox["dropbox"])))

lagged_reg <- lm(d_box~d_dbox)
summary(lagged_reg)

lagged_reg_res = lagged_reg$residuals
plot(lagged_reg_res, type='l')

# Cochrane-Orcutt

#install.packages("orcutt")
library(orcutt)

co <- cochrane.orcutt(reg)
summary(co)
dwtest(co)


# ACF Plots

acf_residual_reg = acf(residuals)
acf_lag_residual_reg = acf(lagged_reg_res)

acf_residual_reg
acf_lag_residual_reg

# Stationarity 

#install.packages("egcm")
#install.packages("tseries")
library(egcm)
library(tseries)

adf.test(as.numeric(unlist(sub_box["box"])))
adf.test(as.numeric(unlist(sub_dropbox["dropbox"])))

adf.test(d_box)
adf.test(d_dbox)

pp.test(as.numeric(unlist(sub_box["box"])))
pp.test(as.numeric(unlist(sub_dropbox["dropbox"])))

pp.test(d_box)
pp.test(d_dbox)

kpss.test(as.numeric(unlist(sub_box["box"])), null="Trend")
kpss.test(as.numeric(unlist(sub_dropbox["dropbox"])), null="Trend")

# Cointegration

egcm(as.numeric(unlist(sub_box["box"])), as.numeric(unlist(sub_dropbox["dropbox"])))
egcm(d_box, d_dbox)

plot(egcm(as.numeric(unlist(sub_box["box"])), as.numeric(unlist(sub_dropbox["dropbox"]))))
plot(egcm(d_box, d_dbox))