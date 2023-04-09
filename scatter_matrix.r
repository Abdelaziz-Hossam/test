library(tidyverse)

correlation = cor(mtcars)
correlation[upper.tri(correlation)] <- NA
melted = melt(correlation, na.rm = T)

ggplot(melted, aes(x = Var1, y = Var2, label = round(value, 2), fill = value)) +
    geom_tile() +
    geom_text() +
    scale_fill_gradient(low = "grey", high = "red") +
    theme(rect = element_blank(),
        axis.title = element_blank())
