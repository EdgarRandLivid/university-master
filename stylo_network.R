library(stylo)
#stylo(network=TRUE, network.type="undirected", corpus.dir="english-12",
      #network.tables="both")

n <-read.csv (file="Documents_CA_100_MFWs_Culled_0__Classic Delta_NODES.csv", sep=";")
e <-read.csv (file="Documents_CA_100_MFWs_Culled_0__Classic Delta_EDGES.csv", sep=";")
n      
e
library(igraph)
net <-graph_from_data_frame(d=e, vertices=n, directed=F)
net
plot(net, edge.arrow.size=4, vertex.label=NA)
V(net)$Label

net <-simplify(net, edge.attr.comb = list(weight="sum", "ignore"))

plot(net, edge.arrow.size=4,
     vertex.label=V(net)$Classes, vertex.label.dist=1)

colors <- c("red", "blue", "green", "orange")

 coll <- colors[V(net)$Group]
 coll


plot(net, edge.arrow.size=4,
     vertex.label=V(net)$Label, vertex.label.dist=1.3,
     vertex.color=coll, edge.width = (E(net)$weight/5),
     edge.color="black", vertex.label.cex=0.6,
     vertex.label.degree=0, vertex.size=17
     
     )


