load("v.rdata")
load("M.data")

D <- matrix(nrow = 8257,ncol = 8257)

for (i in c(1:8257)){
  for(j in c(1:8257)){
    v1 <- M[i,]
    v2 <- M[j,]
    D[i,j] <- % chiamata a distanza di frechet
  }
}

save("D.rdata",D)
