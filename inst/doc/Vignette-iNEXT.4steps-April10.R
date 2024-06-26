## ---- include = FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "", 
                      fig.retina = 2,
                      fig.align = 'center',
                      fig.width = 12, fig.height = 10.5,
                      warning = FALSE, message = FALSE)
old <- options("width" = 200, digits = 3)

library(iNEXT.4steps)
library(ggplot2)
data("Data_spider")
data("Data_woody_plant")

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  ## install iNEXT.4steps package from CRAN
#  install.packages("iNEXT.4steps")
#  
#  ## install the latest version from github
#  install.packages('devtools')
#  library(devtools)
#  install_github('AnneChao/iNEXT.4steps')
#  
#  ## import packages
#  library(iNEXT.4steps)

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  data("Data_spider")
#  Data_spider

## ----echo=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
data("Data_spider")
Data_spider[1:15,]

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  data("Data_woody_plant")
#  Data_woody_plant

## ----echo=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
data("Data_woody_plant")
rownames(Data_woody_plant$Upper_cloud)[1] = "Abelia_chinensis_R._Br._var._ionandra"
lapply(Data_woody_plant, function(x) x[1:6, 1:3])

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  iNEXT4steps(data, q = seq(0, 2, 0.2), datatype = "abundance",
#              nboot = 30, conf = 0.95, nT = NULL, details = FALSE)

## ----align="center",out.width="100%"------------------------------------------------------------------------------------------------------------------------------------------------------------------
data(Data_spider)
Four_Steps_out1 <- iNEXT4steps(data = Data_spider, datatype = "abundance")
Four_Steps_out1$summary
Four_Steps_out1$figure[[6]]

## ----align="center", out.width="100%"-----------------------------------------------------------------------------------------------------------------------------------------------------------------
data(Data_woody_plant)
Four_Steps_out2 <- iNEXT4steps(data = Data_woody_plant, datatype = "incidence_raw")
Four_Steps_out2$summary
Four_Steps_out2$figure[[6]]

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  Completeness(data, q = seq(0, 2, 0.2), datatype = "abundance", nboot = 30,
#               conf = 0.95, nT = NULL)

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  ggCompleteness(output)

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
data(Data_spider)
SC_out1 <- Completeness(data = Data_spider, datatype = "abundance")
SC_out1

## ----out.width="70%",fig.height=8---------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggCompleteness(SC_out1)

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
data(Data_woody_plant)
SC_out2 <- Completeness(data = Data_woody_plant, datatype = "incidence_raw")
SC_out2

## ----out.width="70%",fig.height=8---------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggCompleteness(SC_out2)

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  Evenness(data, q = seq(0, 2, 0.2), datatype = "abundance", method = "Estimated",
#           nboot = 30, conf = 0.95, nT = NULL, E.class = 1:5, SC = NULL)

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  ggEvenness(output)

## ---- eval=FALSE--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  data(Data_spider)
#  Even_out1_est <- Evenness(data = Data_spider, datatype = "abundance",
#                            method = "Estimated", SC = NULL, E.class = 1:5)
#  Even_out1_est

## ---- echo=FALSE--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
data(Data_spider)
Even_out1_est <- Evenness(data = Data_spider, datatype = "abundance", 
                          method = "Estimated", SC = NULL, E.class = 1:5)
Even_out1_est[1]

## ----out.width="100%",fig.height=8--------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggEvenness(Even_out1_est)

## ---- eval=FALSE--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  data(Data_woody_plant)
#  Even_out2_est <- Evenness(data = Data_woody_plant, datatype = "incidence_raw",
#                            method = "Estimated", SC = 0.98, E.class = 1:5)
#  Even_out2_est

## ---- echo=FALSE--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
data(Data_spider)
Even_out2_est <- Evenness(data = Data_woody_plant, datatype = "incidence_raw", 
                          method = "Estimated", SC = 0.98, E.class = 1:5)
Even_out2_est[1]

## ----out.width="100%",fig.height=8--------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggEvenness(Even_out2_est)

## ---- include = FALSE---------------------------------------------------------
options(old)

