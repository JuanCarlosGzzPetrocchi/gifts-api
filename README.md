# gifts_api_test

# Getting Started

After cloning the repo:
### Install the gems

```
bundle install
```
### Setup the database

Run docker-compose

```
docker compose -f docker-compose.dev.yml up -d
```

Create test database

```
psql -h 127.0.0.1 -U apptegy gifts_api_development -p 31027
* The database password is: apptegy

CREATE DATABASE gifts_api_test;
```
### Migrate the database

```
bundle exec rake db:migrate
```

### Start the server

You need to start docker-compose first

```
bundle exec rails s -p 3027
```
### API Documentation
The API documentation can be read at:
https://documenter.getpostman.com/view/8181241/Uyxeonsk

The Postman collection of API requests can be downloaded as a json file here:
https://drive.google.com/file/d/149RZpPnaE5jf8NRGx6lgNXWei6Rohe0m/view?usp=sharing
To import the requests into Postman simply click on Import and select the json file.

### Authorization/Authentication implementation
The project does not take into consideration authorization when handling requests. However if I were to implement it I would require an authorization key as part of the header during requests. To implement this I would add environment variable called api_key. All controllers would inherit from a new AuthorizationsController which would have a before_action that validates the Authorization header key is the same as the api_key environment varibale.

To implement authorization I would create a User model with email and password attributes (using Bcrypt gem for security) which would be required as part of the header when sending requests to the API. The AuthorizationsController would have a before_action that validate's the user's information. If login and logouts are required I would create an ApiKey model with a token attribute which belongs to a User and is created when logging in. That ApiKey is then used instead of the user's information to validate and authorize requests. When logging out (or after a certain amount of time has expired) the ApiKey will expire and a new one would have to be created.

