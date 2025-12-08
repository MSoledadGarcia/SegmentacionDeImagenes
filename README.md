# SegmentacionDeImagenes
Segmentación de imágenes con aprendizaje no supervisado. 

## Segmentación de una imagen 

Se eligió una imagen en formato .jpg de la web.
Imagen obtenida de https://www.elblogdelatabla.com/dykes-genero-iris-ilustraciones-the-iris-genus/  .


<img width="715" height="473" alt="image" src="https://github.com/user-attachments/assets/3164eb8c-c8be-4768-9126-5e6f99656705" />




Se eligió esta imagen de ilustración botánica de Iris, este tipo de flor tan estudiado en ciencia de datos. 

Se trabajó con lenguaje R en RStudio. 
Se utilizó la librería “jpeg” para analizar la estructura de la imagen. 


- Imagen transformada a tono de grises promediando el color de sus pixeles.

<img width="713" height="478" alt="image" src="https://github.com/user-attachments/assets/cd3e284e-9f0d-46a4-8465-ce71c4b2f18f" />



- Se convirtió la matríz de la imagen en un dataframe de tres columnas (RGB) y se realizó un modelo de aprendizaje no supervisado con el algoritmo K-means para separar los colores en 3 grupos.

Cada centroide es el color promedio entre los colores de cada grupo. 

Centroides obtenidos con kmeans:

<img width="560" height="98" alt="image" src="https://github.com/user-attachments/assets/9ce2a1ca-37f6-457e-82ca-c0d3521ecd4d" />



Gráfico con los colores obtenidos con cada centroide:
