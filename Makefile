.PHONY: build up down migrations migrate shell logs clean docker-lint lint test test-verbose test-cov test-file test-k

#######################
# Docker Commands
#######################

# Build all services
build:
	docker-compose build

# Start all services
up:
	docker-compose up

# Stop all services
down:
	docker-compose down

# View service logs
logs:
	docker-compose logs -f

#######################
# Database Commands
#######################

# Create new database migrations
migrations:
	docker-compose run --rm api python manage.py makemigrations

# Apply database migrations
migrate:
	docker-compose run --rm api python manage.py migrate

# Combined command for both migrations and migrate
setup-db: migrations migrate

#######################
# Development Tools
#######################

# Start Django shell
shell:
	docker-compose run --rm api python manage.py shell

# Run code linting in docker
docker-lint:
	docker-compose exec api flake8 .

lint:
	flake8 .

#######################
# Testing Commands
#######################

# Run all tests
test:
	pytest

# Run tests with verbose output
test-verbose:
	pytest -v

# Run tests with coverage report
test-cov:
	pytest --cov=app --cov-report=term-missing

# Run specific test file or directory
# Usage: make test-file file=tests/test_api.py
test-file:
	pytest $(file) -v

# Run tests matching a keyword
# Usage: make test-k k="health"
test-k:
	pytest -v -k "$(k)"

#######################
# Cleanup Commands
#######################

# Remove containers and volumes
clean:
	docker-compose down -v
	docker volume prune -f  # -f flag skips confirmation prompt

# Remove containers, volumes, and images
clean-all:
	docker-compose down -v --rmi all
	docker volume prune -f