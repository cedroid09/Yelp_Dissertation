###

library(jsonlite)
library(httr)

url <- "https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment"
key <- "5863e810535e44b691c8e105e3b448bf"
# url <- "d21e5cfe59a646079793f840814dd0e2"


request_body <- data.frame(
  # language = c("en","en"),
  id = c("1","2"),
  text = c("This is wasted! I'm angry","This is awesome! Good Job Team! appreciated")
)

# Converting the Request body(Dataframe) to Request body(JSON)

request_body_json <- toJSON(list(documents = request_body), auto_unbox = TRUE)

# Below we are calling API (Adding Request headers using add_headers)

result <- POST(url,
               body = request_body_json,
               add_headers(.headers = c("Content-Type"="application/json","Ocp-Apim-Subscription-Key"=key)))
Output <- content(result)

# Show Output
Output



cls <- function() {
  cat("\014")
}

x <- readline("Enter Value: ")