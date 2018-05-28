# CAPTUR3D Coding Challenge

A simple VR cardboard ordering system built with Ruby on Rails and ReactJS.

### Core modules

* Cardboard browsing
* Shopping cart
* Promotion
* User account

### Assumptions

* Payment is not needed
* Billing and shipping addresses are not needed
* Shipping fee is fixed at 30 AUD except when promotion is applied
* Campaign has no end date
* Promotions are automatically applied

### User Stories

* User should be able to browse cardboard on sell and unit price
* User should be able to add cardboard to cart
* User should be able to choose quantity of cardboard
* User should be able to see the updated total price when changing the quantity of the cardboards
* User should be able to remove item from shopping cart
* User should be able to view their shopping cart
* User should be able to login to view their placed orders

## Screenshots

### Home page / Browsing page
![Browsing Page](/app/assets/images/BrowsingPage.png)

### Shopping Cart
![Shopping Cart](/app/assets/images/ShoppingCart.png)

### Empty Cart
![Empty Cart](/app/assets/images/EmptyCart.png)

### Placed Orders
![Placed Orders](/app/assets/images/AllPlacedOrders.png)

### Completed Order Info Retrieval
![Completed Order](/app/assets/images/CompletedOrder.png)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Ruby, Rails and Gem version

```
ruby 2.5.0
yarn 1.7.0
Rails 5.0.3
```

### Installing

Clone this repository into your local machine.

#### Installing Gem

```
$ bundle install
```

#### Initializing Database

Creating database

```
$ rails db:create
```

Migrating database

```
$ rails db:migrate
```

Seeding to get sample data of user, promotions and cardboards

```
$ rails db:seed
```

Sample User:
email: customer@example.com,
password: password

Admin:
email: admin@example.com,
password: password

#### Running the server

```
$ rails server
```

#### Visit the website at

http://localhost:3000

#### Visit the admin panel at

http://localhost:3000/admin

## Running the tests

RSpec, in conjunction with Capybara and FactoryBot, are used in this project as the testing framework.

Running the whole test

```
$ bundle exec rspec
```

Running the controller test

```
$ rspec ./spec/controllers
```

Running the model test

```
$ rspec ./spec/models
```

## Built With

* Ruby on Rails - The web framework
* ReactJS - Javascript library for user interface
* Bootstrap - Front-end library

## Author

* [Jie Mee Chong](https://jiemeechong.me)
