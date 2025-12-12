# ----------------------------------------------------------
# Aprendizaje No Supervisado
# Ma. Soledad García Ortiz
# ----------------------------------------------------------

library(jpeg)

# ----------------------------------------------------------
# 1) Cargar imagen y visualizar
# ----------------------------------------------------------
imagen <- readJPEG("Imagenes/Iris4.jpg")
plot(as.raster(imagen))
dim(imagen)

# ----------------------------------------------------------
# 2) Conversión a escala de grises
# ----------------------------------------------------------
gris <- (imagen[,,1] + imagen[,,2] + imagen[,,3]) / 3
plot(as.raster(gris))
dim(gris)

# ----------------------------------------------------------
# Función auxiliar: Reconstruir imagen desde k-means
# ----------------------------------------------------------
reconstruir_imagen <- function(imagen, km) {
  rojo  <- as.vector(imagen[,,1])
  verde <- as.vector(imagen[,,2])
  azul  <- as.vector(imagen[,,3])
  
  segmR <- rojo
  segmV <- verde
  segmA <- azul
  
  # reemplazo de colores según cluster
  for (k in 1:nrow(km$centers)) {
    idx <- km$cluster == k
    segmR[idx] <- km$centers[k,1]
    segmV[idx] <- km$centers[k,2]
    segmA[idx] <- km$centers[k,3]
  }
  
  segmentada <- imagen
  segmentada[,,1] <- segmR
  segmentada[,,2] <- segmV
  segmentada[,,3] <- segmA
  return(segmentada)
}

# ----------------------------------------------------------
# 3) K-means con 3 grupos
# ----------------------------------------------------------
rojo  <- as.vector(imagen[,,1])
verde <- as.vector(imagen[,,2])
azul  <- as.vector(imagen[,,3])
base <- data.frame(rojo, verde, azul)

set.seed(30596399)
km3 <- kmeans(base, 3)

km3$centers

#Centroides
plot(10,10,pch=19,cex=10,col=rgb(km$center[1,1],km$center[1,2],km$center[1,3]), main="Centroides", xlim= c(8,14), ylim=c(8,14))
points(11,11,pch=19,cex=10,col=rgb(km$center[2,1],km$center[2,2],km$center[2,3]))
points(12,12,pch=19,cex=10,col=rgb(km$center[3,1],km$center[3,2],km$center[3,3]))


# Imagen segmentada
segmentada3 <- reconstruir_imagen(imagen, km3)
plot(as.raster(segmentada3))

# ----------------------------------------------------------
# 4) K-means con 7 grupos
# ----------------------------------------------------------
set.seed(30596399)
km7 <- kmeans(base, 7)

segmentada7 <- reconstruir_imagen(imagen, km7)
plot(as.raster(segmentada7))

km7$cluster
km7$size
km7

# ----------------------------------------------------------
# 5) K-means con 14 grupos
# ----------------------------------------------------------
set.seed(30596399)
km14 <- kmeans(base, 14)

segmentada14 <- reconstruir_imagen(imagen, km14)
plot(as.raster(segmentada14))

# ----------------------------------------------------------
# Centroides para 14 grupos
# ----------------------------------------------------------
plot(6,6,pch=19,cex=7,col=rgb(km14$center[1,1],km14$center[1,2],km14$center[1,3]), 
     main="Centroides (k=14)", xlim=c(5,14), ylim=c(5,14))
for (i in 2:14) {
  points(6 + i/2, 6 + i/2, pch=19, cex=7, col=rgb(km14$centers[i,1],km14$center[i,2],km14$center[i,3] ))
}

# ----------------------------------------------------------
# 6) Segmentación "sacando fondo gris" (manteniendo tu lógica)
# ----------------------------------------------------------
rojo  <- as.vector(imagen[,,1])
verde <- as.vector(imagen[,,2])
azul  <- as.vector(imagen[,,3])

segmR <- rojo
segmV <- verde
segmA <- azul

# mismo criterio 
grupos_blancos <- c( 1, 5)

for (k in 1:14) {
  idx <- km14$cluster == k
  if (k %in% grupos_blancos) {
    segmR[idx] <- 1
    segmV[idx] <- 1
    segmA[idx] <- 1
  } else {
    segmR[idx] <- km14$centers[k,1]
    segmV[idx] <- km14$centers[k,2]
    segmA[idx] <- km14$centers[k,3]
  }
}

segmentada_sin_fondo <- imagen
segmentada_sin_fondo[,,1] <- segmR
segmentada_sin_fondo[,,2] <- segmV
segmentada_sin_fondo[,,3] <- segmA

plot(as.raster(segmentada_sin_fondo))
