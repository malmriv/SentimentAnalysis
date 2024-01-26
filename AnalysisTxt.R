# Cargamos las librerías
library("textdata", "tidytext")

# Cargamos la librería AFINN (clasificación graduada de la carga emocional)
afinn <- as.data.frame(tidytext::get_sentiments("afinn"))

# Cargamos el texto a analizar y eliminamos puntos y comas ("palabra," no se reconoce como "palabra"
text <- as.character(read.delim("Desktop/Sentiment Analysis/texts/Dracula - Bram Stoker.txt", header = F, sep = ""))
text <- sub(",", "", text)

# Dividimos el texto en trozos iguales
chunks <- 25
totalLength <- length(text)
chunkLength <- floor(totalLength / chunks)

# Creamos un dataframe para guardar la puntuación de cada trozo
result <- data.frame(matrix(nrow = chunks, ncol = 3))
colnames(result) <- c("segment", "score", "rollingAvg")
result[, 1] <- c(1:chunks)

# Puntuamos trozo a trozo
for (j in 0:(chunks - 1)) {
    score <- 0
    for (k in 1:chunkLength) {
        index <- j * chunkLength + k
        if (text[index] %in% afinn[, 1]) {
            pos <- which(afinn == text[index])
            score <- score + afinn[pos, 2]
            #           if(afinn[pos, 2]>0) print(text[index])
        }
    }
    result[j + 1, 2] <- score
}

# Representamos el resultado
colors <- ifelse(result$score >= 0, "#bce6cd", "#ffd1e0")
barplot(result$score, col = colors, main = "Sentiment Analysis using the AFINN list.")
mtext("Title and author of the text", line = 0.5)
