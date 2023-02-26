library(ape)
library(maps)
library(phytools)
library(mapdata)
library(viridis)
library(geiger)
library(ggplot2)

data <- read.csv("distribucion_ble2.csv")[,1:3]
data$spp[which(data$spp == "COL20_spn_ranulfoi" )] <- "COL020_spn_ranulfoi"
data <- data[!data$spp == "COL020_spn_ranulfoi" ,]

##Los puntos

world_map <- map_data("world")

ggplot() + 
  geom_polygon(data=world_map, aes(x=long, y=lat, group=group), 
               colour="light green", fill="light green") +
  geom_point(data=data, 
             aes(x=Lon, y=Lat), colour="Deep Pink", 
             fill="Pink",pch=21, size=5, alpha=I(0.7))

tree <- read.nexus("blepha_final2.nex")
tree <- drop.tip(tree, "OUTGROUP")
tree <- drop.tip(tree, "COL020_spn_ranulfoi")

##Revisar que los datos del arbol y el set de datos coincidan
#Debe decir Ok
name.check(tree, data.names = data$spp)

##Necesitas una matriz
data2 <- cbind(data$Lat, data$Lon)
row.names(data2) <- data[,1]

obj<-phylo.to.map(tree,data,database="worldHires",
                  regions="Mexico",plot=FALSE,rotate=FALSE)
cols<-setNames(sample(viridis(n=Ntip(tree))),
               tree$tip.label)

plot(obj,direction="rightwards",colors=cols,ftype="off",cex.points=c(0,1.5),
     pts=FALSE)



