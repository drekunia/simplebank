postgres:
	docker run --name postgres -p 5435:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -d postgres:alpine

createdb:
	docker exec -it postgres createdb --username=postgres --owner=postgres simplebank

dropdb:
	docker exec -it postgres dropdb --username=postgres simplebank

migrateup:
	migrate -path db/migration -database "postgres://postgres:postgres@localhost:5435/simplebank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgres://postgres:postgres@localhost:5435/simplebank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc

