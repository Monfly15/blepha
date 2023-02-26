library(ape)
library(maps)
library(phytools)
library(mapdata)
library(viridis)
library(geiger)

data <- read.csv("distribucion_ble2.csv")[,1:3]
data$spp[which(data$spp == "COL20_spn_ranulfoi" )] <- "COL020_spn_ranulfoi"

tree <- read.nexus("blepha_final2.nex")
tree <- drop.tip(tree, "OUTGROUP")
tree <- drop.tip(tree, "COL020_spn_ranulfoi")

##Revisar que los datos del arbol y el set de datos coincidan
#Debe decir Ok
name.check(tree, data.names = data$spp)



##Necesitas una matriz
data2 <- cbind(data$Lat, data$Long )
row.names(data2) <- data[,1]

obj<-phylo.to.map(tree,data,database="worldHires",
                  regions="Mexico",plot=FALSE,rotate=FALSE)
cols<-setNames(sample(viridis(n=Ntip(tree))),
               tree$tip.label)

plot(obj,direction="rightwards",colors=cols,ftype="off",cex.points=c(0,1.5),
     pts=FALSE)



