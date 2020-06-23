# MySeries

Каталог сериалов с возможностью отслеживания выхода новых серий

### Setup

* git@github.com:moffire/my_series.git
* bundle install
* rails db:setup
* rails db:migrate
* rails s

## Built With

* Rails 5.2.4
* PostgreSQL
* Redis
* Sidekiq
* RSpec
* Factory Bot
* Rabl

## API
* api :GET, localhost:3000/api/v1/movie/:id
* api :GET, localhost:3000/api/v1/episodes/:id
* api :GET, localhost:3000/api/v1/top_imdb
* etc.
