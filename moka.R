library(ape)
library(maps)
library(phytools)
library(mapdata)

data <- read.csv("distribucion_ble.csv")[,1:3]
data$spp[which(data$spp == "COL20_spn_ranulfoi" )] <- "COL020_spn_ranulfoi"

tree <- read.nexus("blepha_final.nex")
tree <- drop.tip(tree, "OUTGROUP")

##Necesitas una matriz
data2 <- cbind(data$lat, data$long )
row.names(data2) <- data[,1]

##Ahora usas la funcion
##Sospecho que tienes que ajustar la region.
##Revisa este link 
##http://blog.phytools.org/2019/03/a-follow-up-comment-on-phylotomap-for.html
obj <- phylo.to.map(tree, data2,plot=FALSE, rotate=FALSE,
                    database="worldHires")
plot(obj)




