
# importar datos con CSV --------------------------------------------------

# Asegúrate de cambiar 'ruta/del/archivo.csv' por la ruta real de tu archivo
chucho <- read.csv(file = "LA MOLINA 2014 POTATO WUE (FB) - fb.csv", 
                  header = TRUE,      
                  sep = ",", )          
chucho

chucho <- read.table(file = "LA MOLINA 2014 POTATO WUE (FB) - fb.tsv", 
                   header = TRUE,      
                   sep = "\t" )          
chucho

install.packages("readxl")
# Cargar el paquete
library(readxl)

# Leer un archivo de Excel
# Cambia 'archivo.xlsx' por la ruta de tu archivo
chucho<- read_excel("LA MOLINA 2014 POTATO WUE (FB) (1).xlsx", 
                   sheet = 2)  # Puedes cambiar el número o el nombre para leer una hoja específica

# Mostrar las primeras filas del archivo leído
head(chucho)
chucho
package
library(openxlsx)

# forma facil de importar -------------------------------------------------

library(readxl)
Datos<- read_excel("LA MOLINA 2014 POTATO WUE (FB) (1).xlsx", 
                                              sheet = "fb")
View(Datos)

# ultima forma de importación google sheets -------------------------------
library()