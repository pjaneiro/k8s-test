.DEFAULT_GOAL := start

setup:
	docker-compose build
	docker-compose run --rm web gem install bundler
	docker-compose run --rm web bundle install

start:
	if [ -f tmp/pids/server.pid ]; then\
		rm tmp/pids/server.pid;\
	fi
	docker-compose up

stop:
	docker-compose stop

console:
	docker-compose run --rm web bundle exec rails c

rubocop:
	docker-compose run --rm web bundle exec rubocop -A
