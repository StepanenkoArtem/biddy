.PHONY: test

build:
	docker compose build

install:
	docker compose run --rm app bin/bundle install 

lint:
	docker compose run --rm app bin/bundle exec rubocop

test:
	docker compose run --rm app bin/bundle exec rspec -fd

db-create:
	docker compose run --rm app bin/rails db:create

db-drop:
	docker compose run --rm app bin/rails db:drop

db-seed:
	docker compose run --rm app bundle rails db:seed
