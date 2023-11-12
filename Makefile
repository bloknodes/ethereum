.DEFAULT_GOAL := help

jwt.hex:
    @if [ ! -f jwt.hex ]; then \
        openssl rand -hex 32 | tr -d '\n' > jwt.hex; \
        echo "Created jwt.hex"; \
    fi

check_docker:
    @docker --version > /dev/null 2>&1 || (echo "docker is not installed"; exit 1)

check_docker_compose:
    @(docker-compose --version > /dev/null 2>&1 || docker compose --version > /dev/null 2>&1) || (echo "docker-compose is not installed"; exit 1)

build:
    @docker compose build

up: check_docker_compose
    @docker compose up -d --build

down:
    @docker compose down

help:
	@echo "Available targets:"
	@echo "  jwt.hex        - Create jwt.hex if it does not exist"
	@echo "  check_docker   - Check if Docker is installed"
	@echo "  check_docker_compose - Check if Docker Compose is installed"
	@echo "  build          - Run 'docker build'"
	@echo "  up             - Run 'docker compose up --build -d'"
	@echo "  help           - Display this help message"
