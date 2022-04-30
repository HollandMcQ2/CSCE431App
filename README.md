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

  `bundle install && rails webpacker:install && rails db:create && db:migrate`

Run the app
  `rails server --binding=0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/

## Environmental Variables/Files ##

** Add instructions/description if your application requires it.

## Deployment ##


    1. Fork the project repository (https://github.com/HollandMcQ2/CSCE431App) into your own GitHub account.
        - Any changes you have made to the source code when you downloaded the code can now be pushed to your repo.
    2. In Heroku, connect your GitHub Account to the Heroku Account (https://dashboard.heroku.com/account/applications).
    3. From the Heroku Dashboard Click the New button in the top right of your app list and select Create new pipeline.
        - Search for and connect to the Github repository that your forked to your account.
    4. Create a new app under production to deploy from the main branch.
    5. Configure the environment variables listed above.
    6. Once the application is built and released, it can be accessed via the Heroku Link.



## CI/CD ##

CI/CD has been implemented in the GitHub Actions in the repo here -> https://github.com/HollandMcQ2/CSCE431App/actions

## Support ##

Admins looking for support should first look at the application help page.
Users looking for help seek out assistance from the customer.