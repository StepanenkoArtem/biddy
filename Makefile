.PHONY: test

build:
	docker compose build

update:
	docker compose build --no-cache

lint:
	docker compose run --rm app bin/bundle exec rubocop

test:
	docker compose run --rm app bin/bundle exec rspec

db-create:
	docker compose run --rm app bin/rails db:create

db-drop:
	docker compose run --rm app bin/rails db:drop

db-seed:
