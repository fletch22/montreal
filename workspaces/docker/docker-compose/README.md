README.md

## How to run just one item in Docker Compose

Step : Where 'web' is a container name, execute:

	docker-compose run --no-deps web

### How to do an absolute clean docker-compose rebuilt.

Step: Execute:

	docker-compose rm --all &&
 	docker-compose pull &&
 	docker-compose build --no-cache &&
 	docker-compose up -d --force-recreate &&