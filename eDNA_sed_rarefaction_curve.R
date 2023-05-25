install.packages("vegan")
library(vegan)
library(readxl)
sedi <- read_excel("C:/Users/magnu/Downloads/eDNA_results_sediment_for_analysis.xlsx")
as.data.frame(sedi)
sedi_no_site <- sedi[, -1]
Cliona <- sedi_no_site[, "Cliona", drop = FALSE]
as.data.frame(Cliona)
Enhydrosoma_propinquum <- sedi_no_site[, "Enhydrosoma propinquum", drop = FALSE]
Edwardsia_longicornis <- sedi_no_site[, "Edwardsia longicornis", drop = FALSE]
Bougainvillia <- sedi_no_site[, "Bougainvillia", drop = FALSE]
major_species <- cbind(Cliona,Enhydrosoma_propinquum,Edwardsia_longicornis,Bougainvillia)
rarefaction_curve <- specaccum(Cliona, method = "rarefaction")
plot(rarefaction_curve, ci.type = "polygon", ci.col = "gray", lwd = 2,
     xlab = "Sequences per Sample", ylab = "Operational Taxonomic Units (OTUs)",
     main = "Rarefaction Curve")
?specaccum
