## Installation

Clone repo

Run `$bundle install`

Run `$rake db:create`, `$rake db:migrate`, then `$rake db:seed`

## Running

Start the Rails server 

Run `$rails s`

- Hit http://localhost:3000/spots/1

Browser displays JSON data
```
{
  "data": {
    "id": "1",
    "type": "spots",
    "links": {
      "self": "http://localhost:3000/spots/1"
    },
    "attributes": {
      "title": "Charming Place",
      "description": "Come enjoy our .2 acre fenced-in back yard with your pup! We have a very friendly husky that likes to play with other dogs. Or, if your pup prefers to play solo, we can keep her inside for the duration of your visit.",
      "price": "7.0",
      "list-of-images": null
    },
    "relationships": {
      "reviews": {
        "links": {
          "self": "http://localhost:3000/spots/1/relationships/reviews",
          "related": "http://localhost:3000/spots/1/reviews"
        }
      }
    }
  }
}
```

- Hit http://localhost:3000/spots/1/reviews/

Browser displays JSON data
```
{
  "data": [
    {
      "id": "1",
      "type": "reviews",
      "links": {
        "self": "http://localhost:3000/reviews/1"
      },
      "attributes": {
        "author": "Kate",
        "body": "Great yard with all the toys and even towels to clean your dog!"
      },
      "relationships": {
        "spot": {
          "links": {
            "self": "http://localhost:3000/reviews/1/relationships/spot",
            "related": "http://localhost:3000/reviews/1/spot"
          }
        }
      }
    },
    {
      "id": "2",
      "type": "reviews",
      "links": {
        "self": "http://localhost:3000/reviews/2"
      },
      "attributes": {
        "author": "Olivia J.",
        "body": "Great spot! This is the second time we’ve visited and appreciate that it’s clean and has ample space for the dog to run or explore. Backyard is fully fenced and behind house, which is great for our dog that can be reactive."
      },
      "relationships": {
        "spot": {
          "links": {
            "self": "http://localhost:3000/reviews/2/relationships/spot",
            "related": "http://localhost:3000/reviews/2/spot"
          }
        }
      }
    }
  ]
}
```

- Hit http://localhost:3000/reviews/

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
