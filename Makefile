# install phoenix package dependencies
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

# start development environment with docker-compose
start: install_deps start_docker

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