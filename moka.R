blepha_final2 <- read.table("~/MEGA/Doctorado/Semetre 7/Seminario VII/blepha_final2.nex", sep=";", quote="\"")
distribucion_ble2 <- read.csv("~/MEGA/Doctorado/Semetre 7/Seminario VII/distribucion_ble2.csv")


library(ape)
library(maps)
library(phytools)
library(mapdata)

data <- read.csv("distribucion_ble2.csv")[,1:3]
data$spp[which(data$spp == "COL20_spn_ranulfoi" )] <- "COL020_spn_ranulfoi"

tree <- read.nexus("blepha_final2.nex")
tree <- drop.tip(tree, "OUTGROUP")
tree <- drop.tip(tree, "COL020_spn_ranulfoi")

##Necesitas una matriz
data2 <- cbind(data$Lat, data$Long )
row.names(data2) <- data[,1]

obj<-phylo.to.map(tree,data,database="worldHires",
                  regions="Mexico",plot=FALSE,rotate=FALSE)
cols<-setNames(sample(viridis(n=Ntip(tree))),
               tree$tip.label)

plot(obj,direction="rightwards",colors=cols,ftype="off",cex.points=c(0,1.5),
     pts=FALSE)



