hash_results <- list()

# hash_results (#a:[1,1],#b:[1,1],#a:[3,2])
# [1,4] significa 1 occorrenza al tempo 4


for (tempo in c(1:1)){
  
  print("inizia streaming")
  rt <- stream_tweets(geocode = "41.89,12.51,10km", timeout = 30)
  # rt <- stream_tweets(geocode = c(41.89,12.51,42.00,13.00), timeout = 15)
  i <- 1
  for (j in rt$geo_coords){
    if (!is.na(j[1])){
      print(i)
    }
    i <- i + 1
  }
  
  
  h <- rt$hashtags
  
  for (j in c(1:length(h))){
    
    k <- h[[j]]
    
    if (is.na(k) == FALSE){
      for (z in k){
        hasht <- iconv(z, "latin1", "ASCII", sub="")
        hasht <- str_replace_all(hasht, "[[:punct:]]", "")
        if (hasht != ""){
          if (is.null(hash_results[[hasht]])){
            newvalue <- matrix(nrow = 1,ncol=2)
            newvalue[1,1] <- 1
            newvalue[1,2] <- tempo
            hash_results[[hasht]] <- newvalue
            
          }
          else
          {
            matrix_values <- hash_results[[hasht]] # lista coppie vettori [1,1] [1,4]
            # se siamo nel tempo 4 vogliamo modificare la lista così [1,1] [2,4]
            trovato_flag <- 0
            L <- length(matrix_values[,1])
            
            for (indice_coppia in c(1:L)){
              
              if (matrix_values[indice_coppia,2] == tempo){
                matrix_values[indice_coppia,1] <- matrix_values[indice_coppia,1] + 1
                trovato_flag <- 1
              }
              
            }
            if (trovato_flag == 0){
              newvalue <- matrix(nrow = 1,ncol=2)
              newvalue[1,1] <- 1
              newvalue[1,2] <- tempo
              new_matrix_values <- rbind(matrix_values,newvalue)
              matrix_values <- new_matrix_values
            }
            
            hash_results[[hasht]] <- matrix_values
          }
        }
      }
    }
  }
  
  print("Inizia attesa")
  Sys.sleep(time=10) 
}