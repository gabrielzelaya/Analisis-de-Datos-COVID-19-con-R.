# Carga de librerías
install.packages("ggplot2")
library(ggplot2)

# Lee los datos desde un archivo CSV
data <- read.csv("C:/Users/gabri/Downloads/programa en r/covid-r-example-master/covid-r-example-master/COVID19_line_list_data.csv")

# Limpia la columna de muertes
data$death_dummy <- as.integer(data$death != 0)

# EDAD
# Afirmación: las personas que fallecen son mayores
fallecidos = subset(data, death_dummy == 1)
vivos = subset(data, death_dummy == 0)

# Gráfico de Edad de Fallecidos y Vivos
ggplot(data, aes(x = age, fill = factor(death_dummy))) +
  geom_histogram(binwidth = 10, alpha = 0.5) +
  labs(x = "Edad", y = "Cantidad", fill = "Muerte") +
  theme_minimal()

# GÉNERO
# Afirmación: el género no tiene efecto
hombres = subset(data, gender == "male")
mujeres = subset(data, gender == "female")

# Gráfico de Tasa de Mortalidad por Género
ggplot(data, aes(x = gender, fill = factor(death_dummy))) +
  geom_bar() +
  labs(x = "Género", y = "Cantidad", fill = "Muerte") +
  theme_minimal()

# Gráfico de Edad por Género
ggplot(data, aes(x = gender, y = age, fill = factor(death_dummy))) +
  geom_boxplot() +
  labs(x = "Género", y = "Edad", fill = "Muerte") +
  theme_minimal()

# Gráfico de Barras de Tasa de Mortalidad por Género
ggplot(data, aes(x = gender, fill = factor(death_dummy))) +
  geom_bar(position = "stack") +
  labs(x = "Género", y = "Cantidad", fill = "Muerte") +
  theme_minimal()

# Gráfico de Pastel de Género
ggplot(data, aes(x = "", fill = gender)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y") +
  labs(x = NULL, y = NULL, fill = "Género") +
  theme_minimal() +
  theme(legend.position = "right")

