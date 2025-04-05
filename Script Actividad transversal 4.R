
# Instalar solo si no están instaladas
if (!require(readr)) install.packages("readr", dependencies = TRUE)
if (!require(dplyr)) install.packages("dplyr", dependencies = TRUE)
if (!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)

# 1 CARGAR PAQUETES  ----
library(readr)  # Para leer archivos CSV
library(dplyr)  # Para manipulación de datos
library(ggplot2) # Para visualización de datos

# 2️ CARGAR DATOS DESDE UN ARCHIVO CSV ----
print("2. Cargando el dataset desde un archivo CSV...")

# Seleccionar el archivo
datos_csv <- file.choose()

# Cargar el dataset
salariosm <- read_csv(datos_csv)

# 3 EXPLORACIÓN DEL DATASET  ----
print("3. Explorando el dataset cargado...")

# Ver las primeras filas
print("Primeras 6 filas del dataset:")
head(salariosm)  # Visualizar las primeras filas

# Información general del dataset
print("Información general del dataset:")
str(salariosm)   # Ver estructura de los datos

# Dimensiones del dataset
print("Dimensiones del dataset (filas x columnas):")
dim(salariosm)

# Nombres de las columnas
print("Nombres de las columnas:")
names(salariosm)

# Resumen estadístico del dataset
print("Resumen estadístico de la variable numérica:")
summary(salariosm)  # Obtener resumen estadístico

# 4 LIMPIEZA DE DATOS  ----
print("4. Limpiando los datos...")

# Convertir la columna de salarios a numérico y manejar valores NA
salariosm$Salario <- as.numeric(salariosm$Salario)

# Verificar valores nulos
print("Número de valores NA por columna después de la limpieza:")
total_na <- colSums(is.na(salariosm))  # Suma de valores NA por columna
total_na

# Verificar registros duplicados
duplicados <- sum(duplicated(salariosm))  # Contar registros duplicados
duplicados

# Calculo de Medidas de Tendencia Central
media_salario <- mean(salariosm$Salario, na.rm = TRUE)
print("Promedio de los datos:")
print(media_salario)

mediana_salario <- median(salariosm$Salario, na.rm = TRUE)
print("Mediana de los datos:")
print(mediana_salario)

moda_salario <- as.numeric(names(sort(table(salariosm$Salario), decreasing = TRUE)[1]))
print("Moda de los datos:")
print(moda_salario)

# Reemplazar los valores NA de Salario con el promedio (media)
salariosm$Salario[is.na(salariosm$Salario)] <- mean(salariosm$Salario, na.rm = TRUE)

# Verificar la sustitución de valores NA
print("Número de valores NA de la columna después de la sustitución:")
colSums(is.na(salariosm))

# 5 GENERAR HISTOGRAMA ----
histograma <- ggplot(salariosm, aes(x = Salario)) +
  geom_histogram(binwidth = 2000, fill = "orange", color = "black", alpha = 0.7) +
  labs(title = "Distribución de Salarios", x = "Salario", y = "Frecuencia") +
  theme_minimal()

# Mostrar el histograma
print(histograma)
print("Gráfico generado con éxito.")