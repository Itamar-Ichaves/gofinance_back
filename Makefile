create pasta migration:
     migrate create -ext sql -dir db/migration -seq initial_tables

createdb:
	createdb --username=postgres --owner=postgres gestorfinancego

postgres:
	docker run --name postgres -p 5433:5432 -e POSTGRES_PASSWORD=postgres -d postgres:14-alpine

migrateup:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/gestorfinancego?sslmode=disable" -verbose up

migrationdrop:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/gestorfinancego?sslmode=disable" -verbose down

test:
	go test -v -cover ./...

server:
    go run main.go

sqlc-gen:
	docker run --rm -v $$(pwd):/src -w /src kjconroy/sqlc generate

.PHONY: createdb postgres dropdb migrateup migrationdrop test server sqlc-gen