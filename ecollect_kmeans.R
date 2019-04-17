load("M.rdata")
load("v.rdata")

M[is.na(M)] <- 0

indici <- sample(nrow(M),size=500,replace=FALSE)

mdata <- M[indici,]
vdata <- v[indici]
rdata <- matrix(nrow=500,ncol=8)

for (i in c(1:500)){
  fit <- lm(mdata[i,] ~ poly(c(1:100),7))
  c <- fit$coefficients
  rdata[i,] <- c
}

k <- kmeans(rdata,3)

