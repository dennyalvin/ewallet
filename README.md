# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version : ruby 3.2.2

* Rails version : Rails 7.0.5.1

* Yarn version : 1.22.4

* System dependencies : mysql2

* Configuration
```bash
Set Database config on config/database/database.yml
```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
```bash
$ rails db:create db:migrate db:seed
$ rails s
```

* EndPoints

```
POST '/api/login' : to sign in
Payload: 
{
	"email" : "dennyalvin23@gmail.com",
	"password" : "123456"
}

POST '/api/deposit', to make a Deposit transaction
Payload: 
{
	"amount" : 200000,
}

POST '/api/withdraw', to make Withdraw
Payload:
{
	"amount" : 25000
}

POST '/api/transfer', to make Withdraw
Payload:
{
	"amount" : 25000,
    "target_user": #{user_id_destinaion}
}

GET '/api/user/balance' : to get logged in user's balance
```