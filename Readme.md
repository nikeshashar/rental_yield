## Coding Challenge


## Task

Your task is to build a simple rental yield calculator so that landlords can work out the yearly yield from renting a property.

We want to collect the following details: 

* Email address
* Phone number 
* Postal code
* Current rent
* Initial cost of buying the property

We would like to see:

* Clean and intuitive design
* Yearly yield return
* Intelligent error handling

For bonus points try to include any additional information such as comparison between the landlord's property and similar ones around it, in the results page and potentially a downloadable pdf. This data might be acquired via 3rd party APIs or published government data.

## Delivery

Please post your code to a GitHub repo, also if you wish a demo can be published using a free Heroku account. 

## Solution

### Requirements
+ Ruby 2.1.2
+ Bundler
+ RSpec 3.0 or greater

### How to set it up
```sh
git clone git@github.com:nikeshashar/rental_yield.git
cd rental_yield
bundle
```

### How to run it
```sh
Type "rails s" in your terminal
```
Go to [localhost:3000](https://localhost:3000) in your browser

### How to test it
```sh
cd rental_yield
rspec
```