## Installation

Clone repo

Run `$bundle install`

Run `$rake db:create`, `$rake db:migrate`, then `$rake db:seed`

## Running

Start the Rails server 

Run `$rails s`

Hit http://localhost:3000/spots/

Hit http://localhost:3000/spots/1/reviews/

Hit http://localhost:3000/reviews/

### Use POSTMAN for client requests

GET - http://localhost:3000/spots

GET - http://localhost:3000/reviews

GET - http://localhost:3000/spots/1/reviews/

For POST request in POSTMAN, go to the Headers tab and enter key “Content-Type” and value “application/vnd.api+json”—this is the content type JSON:API requires.

Next, switch to the Body tab. Click the “none” dropdown and change it to “raw”. Another “Text” dropdown will appear; change it to “JSON”.

POST - http://localhost:3000/spots

In body add the following:
```
{
  "data": {
    "type": "spots",
    "attributes": {
      "title": "Spaghetti Place",
      "description": "789 Third Street",
      "price": 10
    }
  }
}
```

POST - http://localhost:3000/reviews

In body add the following:
```
{
  "data": {
    "type": "reviews",
    "attributes": {
      "author": "Alexa",
      "body": "Very nice fully fenced yard for my dog to romp and play. Area was clean and hosts were very friendly and welcoming. "
    },
    "relationships": {
      "spot": {
        "data": {
          "type": "spots",
          "id": "3"
        }
      }
    }
  }
}
```

### Run Test

To do health check

Run `$rspec ./spec/requests/health_spec.rb`

To test the POST response of **spot api**

Run `$rspec ./spec/requests/spots/create_spec.rb` 

Note - Make sure test fails. 
