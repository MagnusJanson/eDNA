install.packages("vegan")
library(vegan)
library(readxl)
sedi <- read_excel("C:/Users/magnu/Downloads/eDNA_results_sediment_for_analysis.xlsx")
as.data.frame(sedi)
sedi_no_site <- sedi[, -1] #Take away the site column


#Perform the rarefaction curve
data(sedi_no_site) #
S <- specnumber(sedi_no_site) # observed number of species
(raremax <- min(rowSums(sedi_no_site)))
Srare <- rarefy(sedi_no_site, 1000)
plot(S, Srare, xlab = "Observed No. of Species", ylab = "Rarefied No. of Species")
abline(0, 1)
a<-rarecurve(sedi_no_site, step = 20, sample = raremax, col = "blue", cex = 0.6)

