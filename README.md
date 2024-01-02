Ruby 3.2
Rails 7

rails css:install:bootstrap
./bin/importmap pin bootstrap

rails g stimulus user_modal
rails g stimulus bs_modal

rails g rspec:install
RAILS_ENV=test rails db:migrate 
rails g rspec:model User

rails g model user_skill user:references skill:references rating:integer