library(rtweet)

my_tweets <- stream_tweets(
  "#giletjaunes", n = 500, include_rts = FALSE
)

rt <- stream_tweets(geocode = "37.78,-122.40,100mi", timeout = 30)


