
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
ggp <- ggplot(data = DF,
                mapping = aes(x = Area,
                              y = Number))

ggp2 <- ggp + geom_line(aes(group=1),
                colour = "#FFCC00",
                size = 2) +
  geom_text(mapping = aes(label = Number),
            hjust = 1.3,
            vjust = -0.4,
            size = 4,
            fontface = 'bold') +
  scale_x_discrete(limits = c("Southeast Asia", "Chinese",
                              "Japan", "United States of America", "CIS/Central Asia", "Other")) +
  scale_y_continuous(breaks=c(0, 2, 4, 6, 8, 10, 12, 14, 15))

  #두 축의 최대값의 비율계산
max_ratio <- max(DF$Number)/max(DF$Exports); max_ratio

ggp3 <- ggp2 +  
  geom_col(mapping = aes(fill = Area, alpha = 5)) + 
  theme(legend.position = "none")

ggp4 <- ggp3 + scale_y_continuous(sec.axis = sec_axis(~.*max_ratio, name="Exports"))
######################
