# Project Pricing

This application is used to calculate project price based on policy.

## Getting Started

In this app we are calculating total price of projects with different policies  like 'Fixed', 'Flexible', 'Prestige' and we need calculate margin according to the policy. 

```
policy = PricingPolicy.find_by_name(pricing_policy)
self.total_price = base_price.to_i + (policy ? policy.margin : 0)
```
Look at the lib folder, Create PricingPolicy Library that is used to calculate margin according to the policy we set in the project. 
* FindByName method is used create the policy and find the policy by name.  
* Margin Method used to measure the margin according the policy and filter.
 
## Requirements
* ruby 2.5.3
* bundler 2.0.2
* postgres 9.5 (or greater)

### Installing

A step by step series of examples that tell you how to get a development env running and run commands on console

```
git clone https://github.com/ketanb56up/project-pricing.git
cd project-pricing
rvm use 2.5.3
bundle install
```
### Database Setup
Add user and password of postgressql in database.yml file and run commands
```
rails db:create
rails db:migrate
```
## Running the tests

Add rspec gem to test the total_price of project

Write spec of model to set the total price with params pricing_policy and base_price.
* Right now suppose, if user provide Invalid Policy it create project with base_price.
* Change 'Flexible' policy url in pricing_policy.rb according to url subdomain. 

Run command to check the spec
```
rspec ./spec/models/project_spec.rb
```

