compose:
	docker compose up --build -d --remove-orphans

build:
	docker compose down
	./mvnw clean package
	docker compose up --build -d --remove-orphans
