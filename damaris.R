# Instalar los paquetes necesarios (si no están instalados)
if (!require("readxl")) install.packages("readxl")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("dplyr")) install.packages("dplyr")

# Cargar los paquetes
library(readxl)
library(ggplot2)
library(dplyr)
library(agricolae)

# Leer el archivo Excel
Data_de_EFICIENCIA_DE_SUSTRATOS_GERMINACIÓN_DE_LEGUMINOSAS <- read_excel("~/Data de EFICIENCIA DE SUSTRATOS GERMINACIÓN DE LEGUMINOSAS.xlsx")
View(Data_de_EFICIENCIA_DE_SUSTRATOS_GERMINACIÓN_DE_LEGUMINOSAS)
hojas <- excel_sheets("~/Data de EFICIENCIA DE SUSTRATOS GERMINACIÓN DE LEGUMINOSAS.xlsx")
print(hojas)  # Imprime los nombres de las hoja
# Leer ambas hojas
datos_hoja1 <- read_excel("~/Data de EFICIENCIA DE SUSTRATOS GERMINACIÓN DE LEGUMINOSAS.xlsx", sheet = hojas[1])  # Primera hoja
datos_hoja2 <- read_excel("~/Data de EFICIENCIA DE SUSTRATOS GERMINACIÓN DE LEGUMINOSAS.xlsx", sheet = hojas[2])  # Segunda hoja

# Mostrar las primeras filas de cada hoja
print(head(datos_hoja1))
print(head(datos_hoja2))
# Realizar el análisis ANOVA
modelo1 <- aov(Dia_ ~ Tratamiento, data = datos_hoja1)
summary(modelo1)
modelo2 <- aov(`Altura de planta (cm)` ~ variedades + tratamiento * sustratos, data = datos_hoja2)
summary(modelo2)

# Calcular medias y errores estándar
# Verifica los nombres de las columnas
names(datos_hoja2)

library(dplyr)

# Verificar los nombres de las columnas
names(datos_hoja2)

# Convertir 'tratamiento' a factor
datos_hoja2$tratamiento <- as.factor(datos_hoja2$tratamiento)

# Asegurarte de que la variable numérica está correcta
datos_hoja2$`Altura de planta (cm)` <- as.numeric(datos_hoja2$`Altura de planta (cm)`)

# Calcular medias y errores estándar
resumen <- datos_hoja2 %>%
  group_by(tratamiento) %>%  # Agrupar por tratamiento
  summarise(
    media = mean(`Altura de planta (cm)`, na.rm = TRUE),
    sd = sd(`Altura de planta (cm)`, na.rm = TRUE),
    n = n(),
    se = sd / sqrt(n)
  )

# Mostrar el resumen
print(resumen)


# Asegurarte de que los datos están listos
datos_hoja2$tratamiento <- as.factor(datos_hoja2$tratamiento)
datos_hoja2$`Altura de planta (cm)` <- as.numeric(datos_hoja2$`Altura de planta (cm)`)

# Calcular medias y errores estándar
resumen <- datos_hoja2 %>%
  group_by(tratamiento) %>%  # Agrupar por tratamiento
  summarise(
    media = mean(`Altura de planta (cm)`, na.rm = TRUE),
    sd = sd(`Altura de planta (cm)`, na.rm = TRUE),
    n = n(),
    se = sd / sqrt(n)
  )

# Crear el gráfico
ggplot(resumen, aes(x = tratamiento, y = media, fill = tratamiento)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") + # Barras
  geom_errorbar(aes(ymin = media - se, ymax = media + se), width = 0.2, color = "black") + # Errores estándar
  labs(
    title = "Altura de planta por tratamiento con error estándar",
    x = "Tratamiento",
    y = "Altura de planta (cm)"
  ) +
  scale_fill_manual(values = c("lightgreen", "lightblue", "lightcoral")) + # Colores personalizados
  theme_minimal(base_size = 14)

library(dplyr)

resumen <- datos_hoja2 %>%
  group_by(sustratos, variedades) %>%  # Agrupar por sustratos y variedades
  summarise(
    media = mean(`Altura de planta (cm)`, na.rm = TRUE),
    sd = sd(`Altura de planta (cm)`, na.rm = TRUE),
    n = n(),
    se = sd / sqrt(n),
    .groups = 'drop'
  )
library(ggplot2)

ggplot(resumen, aes(x = variedades, y = media, fill = sustratos)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") + # Barras agrupadas
  geom_errorbar(
    aes(ymin = media - se, ymax = media + se), 
    position = position_dodge(0.9), 
    width = 0.2, 
    color = "green"
  ) +
  labs(
    title = "Altura de planta por sustrato y variedad con error estándar",
    x = "Variedades",
    y = "Altura de planta (cm)"
  ) +
  scale_fill_brewer(palette = "Pastel1") + # Escala de colores para los sustratos
  theme_minimal(base_size = 14)




datos_hoja2$`Altura de planta (cm)` <- as.numeric(datos_hoja2$`Altura de planta (cm)`)
# Identificar filas con problemas
datos_problemas <- datos_hoja2[is.na(as.numeric(datos_hoja2$`Altura de planta (cm)`)), ]
print(datos_problemas)

# Agrupar y calcular estadísticas
resumen <- datos_hoja2 %>%
  group_by(sustratos, variedades) %>%
  summarise(
    media = mean(`Altura de planta (cm)`, na.rm = TRUE),
    sd = sd(`Altura de planta (cm)`, na.rm = TRUE),
    n = n(),
    se = sd / sqrt(n),
    .groups = 'drop'
  )

# Crear el gráfico
ggplot(resumen, aes(x = variedades, y = media, fill = sustratos)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  geom_errorbar(
    aes(ymin = media - se, ymax = media + se),
    position = position_dodge(0.9),
    width = 0.2,
    color = "black"
  ) +
  labs(
    title = "Altura de planta por sustrato y variedad con error estándar",
    x = "Variedades",
    y = "Altura de planta (cm)"
  ) +
  scale_fill_brewer(palette = "Pastel1") +
  theme_minimal(base_size = 14)


# Número de hojas  --------------------------------------------------------

# Agrupar y calcular estadísticas
resumen <- datos_hoja2 %>%
  group_by(sustratos, variedades) %>%
  summarise(
    media = mean(`N° de hojas`, na.rm = TRUE),  # Nombre correcto
    sd = sd(`N° de hojas`, na.rm = TRUE),      # Nombre correcto
    n = n(),
    se = sd / sqrt(n),
    .groups = 'drop'
  )
ggplot(resumen, aes(x = variedades, y = media, fill = sustratos)) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  geom_errorbar(
    aes(ymin = media - se, ymax = media + se),
    position = position_dodge(0.9),
    width = 0.2,
    color = "black"
  ) +
  labs(
    title = "Número de hojas por sustrato y variedad con error estándar",
    x = "Variedades",
    y = "Número de hojas"
  ) +
  scale_fill_brewer(palette = "Pastel1") +
  theme_minimal(base_size = 14)


# germinación -------------------------------------------------------------

library(tidyr)
library(dplyr)
library(ggplot2)

> # Transformar datos a formato largo
  > datos_largo <- datos_hoja1 %>%
  +   pivot_longer(
    +     cols = starts_with("Dia_"),
    +     names_to = "Día",
    +     names_prefix = "Dia_",
    +     values_to = "Valor"
    +   ) %>%
  +   mutate(Día = as.numeric(Día))  # Convertir Día a numérico para el eje X
Error en pivot_longer(., cols = starts_with("Dia_"), names_to = "Día", : 
                        no se pudo encontrar la función "pivot_longer"

datos_largo <- datos_hoja1 %>%
  pivot_longer(
    cols = starts_with("Dia_"),
    names_to = "Día",
    names_prefix = "Dia_",
    values_to = "Valor"
  ) %>%
  mutate(Día = as.numeric(Día))  # Convertir Día a numérico para el eje X
head(datos_largo)

