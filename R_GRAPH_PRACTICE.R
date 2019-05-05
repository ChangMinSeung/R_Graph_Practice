
#####library#####
library(ggplot2)
#################


#####Create_DataFrame#####
X1 <- c(863880, 260633, 171000, 157200, 142700, 634260)
X2 <- c(14, 8, 4, 6, 15, 8)
X3 <- c("Southeast Asia", "Chinese", "Japan", "United States of America", 
        "CIS/Central Asia", "Other")

DF <- as.data.frame(cbind(X1, X2, X3)) 

colnames(DF) <- c("Exports", "Number", "Area")

DF$Exports <- as.character(DF$Exports)
DF$Number <- as.character(DF$Number)

DF$Exports <- as.numeric(DF$Exports)
DF$Number <- as.numeric(DF$Number)
##########################


######Create_Plot#####
ggbar <- ggplot(data = DF,
       mapping = aes(x = Area,
                     y = Exports))

  #두 축의 최대값의 비율계산
max_ratio <- max(DF$Exports)/max(DF$Number); max_ratio

ggbar2 <- ggbar + 
  scale_x_discrete(limits = c("Southeast Asia", "Chinese",
                              "Japan", "United States of America", "CIS/Central Asia", "Other")) +
  geom_col(mapping = aes(fill = Area)) + 
  theme(legend.position = "none") +
  scale_y_continuous(breaks=c(0, 100000, 200000, 300000, 400000, 500000,
                              600000, 700000, 800000, 900000, 1000000))

ggbar3 <- ggbar2 + geom_line(aes(y = Number*max_ratio, group=1),
            colour = "#FFCC00",
            size = 2)

ggbar4 <- ggbar3 + scale_y_continuous(sec.axis = sec_axis(~.*max_ratio, name="Number"))
######################
