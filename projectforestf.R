
import pandas as pd
forest = pd.read_csv('https://github.com/elacanan/forestfires/blob/51acbc14167af41293a97d4005c4292f0054593f/forestfires.csv')

library(ggplot2)
fplot <- ggplot(forestfires, aes(RH, temp)) + geom_point()
fplot + geom_smooth(method = "lm")

ggplot(forestfires, aes(x=RH, y=temp)) + geom_point(aes(color=month))

library(ggplot2)
fplot <- ggplot(forestfires, aes(ISI, FFMC))$out + geom_point()
fplot + geom_smooth(method = "lm")

ggplot(forestfires, aes(x=ISI, y=FFMC)) + geom_point(aes(color=month))









