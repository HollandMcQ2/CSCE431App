# README

## Introduction ##

TSAT Thespian Tracker is an application designed for TAMU Society of Amateur Thespians. It provides member tracking, event tracking, and dues tracking functionalities.

## Requirements ##

This code has been run and tested on:

* Ruby - 3.0.2p107
* Rails - 6.1.4.1
* Ruby Gems - Listed in `Gemfile`
* PostgreSQL - 13.3 
* Nodejs - v16.9.1
* Yarn - 1.22.11


## External Deps  ##

* Docker - Download latest version at https://www.docker.com/products/docker-desktop
* Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
* Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## Installation ##

Download this code repository by using git:

 `git clone https://github.com/HollandMcQ2/CSCE431App.git`


## Tests ##

An RSpec test suite is available and can be ran using:

  `rspec spec/`

## Execute Code ##

Run the following code in Powershell if using windows or the terminal using Linux/Mac

  `cd CSCE431App`

  `docker run --rm -it --volume "$(pwd):/TSAT_Tracker" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

  `cd TSAT_Tracker`

Install the app

  `bundle install && rails webpacker:install && rails db:create && db:migrate` && rails db:seed

Run the app
  `rails server --binding=0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/

## Environmental Variables/Files ##

** Add instructions/description if your application requires it.

In order for the authentication feature to work, the following environment variables must be set:

In order for the payment feature to work, the following environment variables must be set:

In order for the notification feature to work, the following environement variables must be set:

* **EMAIL_ADDRESS** - Name of the email address to use to send the messages
* **EMAIL_PASSWORD** - The password for the email address, or an alternative authentication key as provided by the email's host.

## Deployment ##

** Add instructions about how to deploy to Heroku


## CI/CD ##

TBD

## Support ##

Admins looking for support should first look at the application help page.
Users looking for help seek out assistance from the customer.