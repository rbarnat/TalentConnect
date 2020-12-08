# TalentConnect

**TalentConnect** is a **Ruby On Rails** web application. It's a **peer-learning plateform** made by [dediane](https://github.com/dediane), [Mehdi-Lucas](https://github.com/Mehdi-Lucas), [rbarnat](https://github.com/rbarnat), [PatriceH7](https://github.com/PatriceH7) and [YohanFleury](https://github.com/YohanFleury).

It's the final project for The Hacking Project coding bootcamp.

## Where to find our application?

You can find our application on **Heroku**:

**Production version** -> [HERE](https://talent-co.herokuapp.com/)

## How to use the app?

This app is using **Ruby 2.7.1** and **Rails 5.2.3**.

This web app in RoR is using a list of **gems**, don't forget to run `bundle install` to create a `gemfile.lock` to store all dependencies that your app needed.

## Create and initialiaze the Database 

This app is using `PostgreSQL` for the Database.

When you __clone the app__ from this repository, you will have to create a **database**, run:

````ruby
rails db:create
````

Then you will have to upload the migrations by executing:

````ruby
rails db:migrate
````

All the **migrations** are going **up**. You can check it with:

````ruby
rails db:status
`````

Now you have **a functional Database** you can fill it.
If you don't want to fill it yourself, we made you a super Seed. You can fill you Database by running:

```ruby
rails db:seed
````
#### Now your all set and ready to learn!