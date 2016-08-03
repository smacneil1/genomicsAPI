list.files()
install.packages('rsconnect')

rsconnect::setAccountInfo(name='smacneil', token='C573641F539A1F47859AE9CCB643DDFF', secret='QzSp23bxL90r1rij0WUsGn1XaY0c35pHrNo9PRpB')
library(rsconnect)
rsconnect::deployApp('Testing')


install.packages('ggplot2')
library("gglot2")