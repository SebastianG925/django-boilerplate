.PHONY: build up down migrations migrate shell logs clean

build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down

migrations:
	docker-compose run --rm web python manage.py makemigrations

migrate:
	docker-compose run --rm web python manage.py migrate

shell:
	docker-compose run --rm web python manage.py shell

logs:
	docker-compose logs -f

clean:
	docker-compose down -v
	docker volume prune -f  # -f flag skips confirmation prompt

# For a more aggressive clean that removes images too
clean-all:
	docker-compose down -v --rmi all
	docker volume prune -f

# Optional: Combined command for both migrations and migrate
setup-db: migrations migrate