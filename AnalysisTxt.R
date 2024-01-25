# Cargamos las librerías
library("textdata", "tidytext")

# Cargamos la librería AFINN (clasificación graduada de la carga emocional)
afinn <- as.data.frame(tidytext::get_sentiments("afinn"))

# Cargamos el texto a analizar
text <- as.character(read.delim("path_to_file", header = F, sep = ""))

# Dividimos el texto en trozos iguales
chunks <- 40
totalLength <- length(text)
chunkLength <- floor(totalLength / chunks)

# Creamos un dataframe para guardar la puntuación de cada trozo
result <- data.frame(matrix(nrow = chunks, ncol = 2))
colnames(result) <- c("segmento", "puntuacion")
result[, 1] <- c(1:chunks)

# Puntuamos trozo a trozo
for (j in 0:(chunks - 1)) {
    score <- 0
    for (k in 1:chunkLength) {
        index <- j * chunkLength + k
        if (text[index] %in% afinn[, 1]) {
            pos <- which(afinn == text[index])
            score <- score + afinn[pos, 2]
        }
    }
    result[j + 1, 2] <- score
}

# Representamos el resultado
colors <- ifelse(result$puntuacion >= 0, "#bce6cd", "#ffd1e0")
barplot(result$puntuacion, col = colors, main = "Sentiment Analysis using the AFINN list.")
