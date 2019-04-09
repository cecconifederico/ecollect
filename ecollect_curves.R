load("~/GitHub/ecollect/X.rdata")
# X <- M[sample(nrow(M),size=500,replace=FALSE),]

D <- matrix (nrow = 500, ncol = 500)

for (i in c(1:100)){

for (j in c(1:100)){  

  print("----")
  print(i)
  print(j)
  
path1 <- matrix (nrow = 100,ncol = 2)
path2 <- matrix (nrow = 100,ncol = 2)

v1 <- X[i,]
v2 <- X[j,]

v1[is.na(v1)] <- 0
v2[is.na(v2)] <- 0

path1[,1] <- c(0:99)
path1[,2] <- v1

path2[,1] <- c(0:99)
path2[,2] <- v2

D[i,j] <- Frechet(path1,path2)

}
}
