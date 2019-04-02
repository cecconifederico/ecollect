v <- names(hash_results)
# v è il vettore degli hashtag

l <- length(v)
# l è quanti sono gli hashtag

M <- matrix(nrow = l, ncol = 100)

for (i in c(1:l)) {
  x <- hash_results[[ v[i] ]]
  lx <- length(x[,1])
  # x [2 1, 5 4, 2 22, 1 41]
  #dove 2,5,2,1 sono le occorrenze
  # e 1 4 22 41 sono i tempi
  
  for (j in c(1:lx)){
    M[i,x[j,2]] <- x[j,1]
  }
  
}

save(file = "v.rdata",v)
save(file = "M.rdata",M)

