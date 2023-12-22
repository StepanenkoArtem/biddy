.PHONY: test

start:
	docker compose up app

build:
	docker compose build --no-cache

watch:
	docker compose run --rm app bin/dev

install:
	docker compose run --rm app bin/bundle install 

lint:
	docker compose run --rm app bin/bundle exec rubocop

rubocop-happy:
	docker compose run --rm app bin/bundle exec rubocop -a

test:
	docker compose run --rm app bin/bundle exec rspec -fd

db-create:
	docker compose run --rm app bin/rails db:create

db-drop:
	docker compose run --rm app bin/rails db:drop

db-seed:
	docker compose run --rm app bin/rails db:seed

migrate:
	docker compose run --rm app bin/rails db:migrate

rollback:
	docker compose run --rm app bin/rails db:rollback
