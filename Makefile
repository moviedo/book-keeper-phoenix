##
##  DEPENDENCIES
## ================
## * UNIX operating system
## * GNU Make >= 4.3
## * GNU Bash >= 3.2.57

## -- Phoenix Targets --

install_deps: 
	@docker run \
	-v "/$$(pwd)":/app \
	-w /app \
	elixir:1.12-alpine \
	sh -c "mix local.hex --force && mix deps.get"

# start docker-compose containers
start_docker:
	@docker-compose down && \
	docker-compose run web mix ecto.setup && \
	docker-compose -f docker-compose.yml up -d --remove-orphans 

start: 
	@make install_deps || make start_docker

# stop development environment with docker-compose
stop: 
	@docker-compose down

# create new phoenix project with given name
new_project: 
	@docker run \
	-v "/$$(pwd)":/app \
	-w /app \
	elixir:1.12-alpine \
	sh -c "mix local.hex --force && mix archive.install hex phx_new --force && mix phx.new ${1} --install --no-html --no-assets"

# Credit: https://gist.github.com/prwhite/8168133#gistcomment-2749866
help:
	@printf "Usage\n";

	@awk '{ \
			if ($$0 ~ /^.PHONY: [a-zA-Z\-\_0-9]+$$/) { \
				helpCommand = substr($$0, index($$0, ":") + 2); \
				if (helpMessage) { \
					printf "\033[36m%-20s\033[0m %s\n", \
						helpCommand, helpMessage; \
					helpMessage = ""; \
				} \
			} else if ($$0 ~ /^[a-zA-Z\-\_0-9.]+:/) { \
				helpCommand = substr($$0, 0, index($$0, ":")); \
				if (helpMessage) { \
					printf "\033[36m%-20s\033[0m %s\n", \
						helpCommand, helpMessage; \
					helpMessage = ""; \
				} \
			} else if ($$0 ~ /^##/) { \
				if (helpMessage) { \
					helpMessage = helpMessage"\n                     "substr($$0, 3); \
				} else { \
					helpMessage = substr($$0, 3); \
				} \
			} else { \
				if (helpMessage) { \
					print "\n                     "helpMessage"\n" \
				} \
				helpMessage = ""; \
			} \
		}' \
		$(MAKEFILE_LIST)