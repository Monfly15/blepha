library(ape)
library(maps)
library(phytools)
library(mapdata)


data <- read.csv("distribucion_ble.csv")[,1:3]
#row.names(data) <- data$spp
#data$spp  <- NULL
tree <- read.nexus("blepha_final.nex")

## Las especies que no existen en el arbol
tree$tip.label[! tree$tip.label %in% data$spp]

## Las especies que existen en el arbol
tree$tip.label[tree$tip.label %in% data$spp]


tree$tip.label
data$spp
obj<-phylo.to.map(tree,data, plot=FALSE)

