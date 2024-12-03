DOCKER_COMPOSE := docker-compose

.PHONY: all create-env build up

all: create-env build up

create-env:
ifeq (,$(wildcard ./.env))
	@echo "$(BLUE)Creating .env file$(END-COLOR)"
	@cp .env.example .env
else
	@echo "$(YELLOW).env file already exists, proceding...$(END-COLOR)"
endif

build:
	@echo "==> Construindo o Docker Compose..."
	PATH=$(HOME)/.local/bin:$$PATH $(DOCKER_COMPOSE) build

up:
	@echo "==> Subindo os serviços com Docker Compose..."
	PATH=$(HOME)/.local/bin:$$PATH $(DOCKER_COMPOSE) up -d
