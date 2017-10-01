# README

Test Website


* Ruby 2.4.0
* Rails 5.1.4

* Implemented: 
- list of books including: title, author, image, genre, summary
- authentication (devise), forgot password
- show all books by last week
- can added new book only authenticated user
- user can edit self books
- show draft-book only owner
- admin (rails_admin)
- tests (rspec)

* Database creation
```ruby
rails db:create
rails db:migrate
```

* Database initialization
```ruby
rails db:seed
```
user-admin: admin@test.com / asdfasdf

* Run the test suite
```ruby
bundle exec rspec
```
