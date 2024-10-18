
# DBCA --------------------------------------------------------------------

# Instalación (si no está instalado aún)
install.packages("agricolae")

# Cargar el paquete
library(agricolae)
# Definir los niveles de los factores
dosis_fertilizante <- c(50, 100, 150)  # Dosis de fertilizante en kg/ha
variedades_papa <- c("Canchán", "Peruanita")  # Variedades de papa

# Generar todas las combinaciones posibles de los factores
factores <- expand.grid(dosis=dosis_fertilizante, variedad=variedades_papa)

# Definir el número de bloques (parcelas)
bloques <- 3  # Número de bloques

# Generar el diseño en bloques completos al azar (DBCA)
dbca_experimento <- design.ab(trt=factores, r=bloques, seed=123)

# Mostrar el diseño experimental
print(dbca_experimento$book)

# factorial en dbcr -------------------------------------------------------
# Cargar el paquete
library(agricolae)
# Definir los niveles de los factores
dosis_fertilizante <- c(50, 100, 150)  # Dosis de fertilizante en kg/ha
variedades_papa <- c("Canchán", "Peruanita")  # Variedades de papa
agricolae::design.ab(trt, r, serie = 2, design=c("rcbd","crd","lsd")
 trt<-c(3,2) # factorial 3x2
outdesign <-design.ab(trt, r=5, serie=2)
book<-outdesign$book
head(book,10) # print of the field book
 # factorial 2 x 2 x 2 with 5 replications in completely randomized design.
trt<-c(2,2,2)
 outdesign<-design.ab(trt, r=5, serie=2,design="crd")
 book<-outdesign$book
print(book)
# factorial 3 x 3 in latin square design.
trt <-c(3,3)
 outdesign<-design.ab(trt, serie=2, design="lsd")
book<-outdesign$book
print(book)
library(tidyverse)
