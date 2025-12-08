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


<img width="398" height="370" alt="image" src="https://github.com/user-attachments/assets/b3efa1aa-b48e-4cc1-b1f7-688ba356d930" />


Imagen segmentada coloreada con los 3 centroides. 

<img width="715" height="476" alt="image" src="https://github.com/user-attachments/assets/bb0d82bf-2cdb-402f-a151-ca33fa825ecd" />

Imagen segmentada con kmeans  en 7 grupos coloreada por los siete centroides obtenidos. 

<img width="723" height="480" alt="image" src="https://github.com/user-attachments/assets/58f63494-81a1-472e-8cab-0bcdbf93dfb5" />



-Imagen original y las 2 segmentadas en 3 y 7 grupos


<img width="458" height="904" alt="image" src="https://github.com/user-attachments/assets/84f0a932-d10c-4fe5-ac81-b8ba90b2cf25" />



Podemos ver que las imágenes que se obtuvieron con la segmentación son similares a la original pero al tener menor cantidad de colores también tienen menor definición y se pierden detalles como por ejemplo las letras. 

Segmentación con 14 grupos, se puede observar mejor detalle que las anteriores. 

<img width="680" height="458" alt="image" src="https://github.com/user-attachments/assets/afdf1649-9921-48c3-a050-224e02d082e7" />

<img width="548" height="513" alt="image" src="https://github.com/user-attachments/assets/0f41d8f3-7547-4549-8102-9f609bd6f93b" />

Convierto 2 grupos pertenecientes al fondo en color blanco:

<img width="675" height="453" alt="image" src="https://github.com/user-attachments/assets/e153da62-eb14-4cb1-a5ee-37d7aab7d12f" />


1)	¿Para qué podría servir segmentar imágenes? 
“La segmentación de imágenes sirve para separar una imagen en regiones u objetos relevantes. Permite identificar qué parte corresponde a cada elemento y así facilitar tareas como medición, detección o reconocimiento. Es fundamental en áreas como medicina, robótica, seguridad y edición de imágenes.”  (ChatGPT)

Kmeans podría servir en la segmentación de imágenes para detectar objetos o intensidades y así poder cambiar colores, modificar fondos, resaltar objetos de interés lo cuál tiene infinitas aplicaciones en diferentes campos de estudio. 



