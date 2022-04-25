
# CSCE431

Steps to start the docker image and the app

1. start the docker image with this command (depends on if you are on windows or if you are julia):
```
windows: docker run --rm -it --volume "$(PWD):/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest
```
2. Create and migrate the database:
```
cd csce431/ && bundle install && rails db:create && rails db:migrate && rails db:seed && rake assets:precompile
```
3. run the app
```
rails server --binding=0.0.0.0
```
4. Check the server at http://127.0.0.1:3000


CI/CD

```
Heroku Pipeline connected to Github repository. Disconnected after maintenance and turnover. heroku Credentials owned by customer.

test branch connected to Review application. Staging and production app in pipeline conntec to master branch. Any pushes to those branches will deploy the apps respectively.
```
