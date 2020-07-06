

CREATE USER myapp with password 'colston';
alter user myapp createdb;

rake db:setup
rake db:migrate

rake db:fixtures:load # to add all the default data so the website doesn't crash instantly
rake db:seed # similar to above but it loads more stuff


# Deployment

heroku run rake db:migrate -a paula-site
heroku run rake db:seed -a paula-site # to load all the data required for the site to function

bundle exec rake assets:precompile # to ensure that all the styling is correct
gpu # to push the compiled assets to github, automatic github deployment should handle the rest
