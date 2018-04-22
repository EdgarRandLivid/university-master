
library (stylo)
library (dendextend)
example = stylo(corpus.dir="english-12")

# Skript fuehrt stylo auf dem "english-12"-Testkorpus aus, erzeugt 
# jedoch eine separate Visualisierung (svg-Datei): 
# Vertikal ausgerichtetes Dendrogramm mit buendig bis zur
# 0-Skalierung abschliessenden Aesten. Paket dendextend benoetigt.
#
#Funktioniert zunaechst nur fuer classic-Delta


###
# distance.table  		final distances between each pair of samples
#                 features  	features (e.g. words, n-grams, ...) applied to data
#   features.actually.used  	features (e.g. frequent words) actually analyzed
#    frequencies.0.culling  	frequencies of words/features accross the corpus
#            list.of.edges  	edges of a network of stylometric similarities
#     table.with.all.freqs  	frequencies of words/features accross the corpus
#   table.with.all.zscores  	z-scored frequencies accross the corpus
###

example$distance.table

text = example$distance.table
texts <- dist(text)
hc <- hclust(texts , method = "ward.D2")
svg("english-12.svg", height=7, width=5)
dend_hc <-as.dendrogram(hc)
dend_hc <- set(dend_hc,"labels_col", value = c("red","black","green", "blue"), k=4)
dend_hc <- set(dend_hc, "labels_cex", 0.8)
plot(dend_hc)
dev.off()

##Alternative Visualisierung ohne Paket dendextend:
#Nachteil: keine farbigen Cluster

#	text = example$distance.table
#	texts <- dist(text)
#	hc <- hclust(texts , method = "ward.D2")
#	svg("english-12.svg")
#	plot(hc, labels = NULL, hang = -1, 
#		main = "Cluster dendrogram",  xlab = NULL, ylab = "Distance",
#		sub="")
#	dev.off()

###




