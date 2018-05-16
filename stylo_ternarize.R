library(stylo)
## Skript verarbeitet z-scores aus stylo und ternarized die Werte
## zu -1, 0 oder 1. Es wird eine Tabelle der 50 haeufigsten Woerter
## erstellt, die fuer einen erneuten stylo()-Aufruf als frequencies dient.

path = ""   #Pfad
setwd(path)
mycorpus = "corpus"
example = stylo(corpus.dir = mycorpus)


###eigenes ternarize:
our_zscores = example$table.with.all.zscores
gt_0.43 = which(our_zscores>0.43)
lt_0.43 = which(our_zscores<(-0.43))
our_zscores[gt_0.43]=1
our_zscores[lt_0.43]=-1
tozero = which(our_zscores!=1&our_zscores!=(-1))
our_zscores[tozero]=0
our_zscores
ternarizes_zscores = t(our_zscores) #Transponieren der Tabelle
ternarizes_zscores

df = as.data.frame(ternarizes_zscores)

top50 = df[c(1:50),] #hier flexible Wahl der top Woerter
top50 # Ergebnis
write.table(top50, file = "ternarized_zscores_50.txt",row.names=TRUE,col.names=TRUE, sep="\t", dec=".")

stylo(corpus.dir=mycorpus, frequencies = "ternarized_zscores_50.txt")
#erstellte Textdatei kann nun als frequencies- Tabelle benutzt werden
