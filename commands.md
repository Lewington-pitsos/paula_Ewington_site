

CREATE USER myapp with password 'colston';
alter user myapp createdb;

rake db:setup
rake db:migrate

rake db:fixtures:load # to add all the default data so the website doesn't crash instantly
rake db:seed # similar to above but it loads more stuff
