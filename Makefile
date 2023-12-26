.PHONY: test

start:
	docker compose up app

sidekiq:
	docker compose up sidekiq

build:
	docker compose build --no-cache

watch:
	docker compose run --rm app bin/dev

install:
	docker compose run --rm app bin/bundle install

lint:
	docker compose run --rm app bin/bundle exec rubocop

rubocop-happy:
	docker compose run --rm app bin/bundle exec rubocop -A

test:
	docker compose run --rm app bin/bundle exec rspec -fd

db-create:
	docker compose run --rm app bin/rails db:create

db-drop:
	docker compose run --rm app bin/rails db:drop

db-seed:
	docker compose run --rm app bin/rails db:seed

migration:
	docker compose run --rm app bin/rails db:migrate

rollback:
	docker compose run --rm app bin/rails db:rollback

brakeman:
	docker compose run --rm app bin/bundle exec brakeman

doctor:
	docker compose run --rm app bin/bundle exec rake active_record_doctor

clear:
	docker rm $(docker ps -q -a) -f && \
	docker rmi $(docker images -q) -f

