hash_results <- list()

# hash_results (#a:[1,1],#b:[1,1],#a:[3,2])
# [1,4] significa 1 occorrenza al tempo 4


for (tempo in c(1:1)){
  print("inizia streaming")
  rt <- stream_tweets(geocode = "37.78,-122.40,10mi", timeout = 5)
  h <- rt$hashtags
  for (j in c(1:length(h))){
    k <- h[[j]]
    if (is.na(k) == FALSE){
      
    }
  }
  print("Inizia attesa")
  Sys.sleep(time=1) 
}