#limpio la memoria
rm( list=ls() )  #remove all objects
gc()             #garbage collection

require("data.table")
require("rpart")
require("rpart.plot")

setwd("C:/Users/manue/OneDrive/Documentos/Manuel/Maestria/3-DataMining/datasets" )  #establezco la carpeta donde voy a trabajar

#cargo el dataset
dataset  <- fread( "dataset_pequeno.csv")

dir.create( "./exp/", showWarnings = FALSE  )
dir.create( "./exp/EA4810/", showWarnings = FALSE )
setwd( "./exp/EA4810" )

#uso esta semilla para los canaritos
set.seed(151153)

#agrego 30 variables canarito, random distribucion uniforme en el intervalo [0,1]
for( i in  1:30 ) dataset[ , paste0("canarito", i ) :=  runif( nrow(dataset)) ]


#Primero  veo como quedan mis arboles
modelo  <- rpart(formula= "clase_ternaria ~ .",
                 data= dataset[ foto_mes==202107 ,],
                 model= TRUE,
                 xval= 0,
                 cp=        -0.597,
                 minsplit= 577,
                 minbucket=  289,
                 maxdepth=   6 )


#Grabo el arbol de canaritos
pdf(file = "./arbol_canaritos.pdf", width=28, height=4)
prp(modelo, extra=101, digits=-5, branch=1, type=4, varlen=0, faclen=0)
dev.off()
