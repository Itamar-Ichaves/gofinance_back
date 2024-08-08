-- name: CreateTenant :one
INSERT INTO "tenant" (nome) 
VALUES ($1) 
RETURNING id, nome, created_at, updated_at;

-- name: GetTenant :one
SELECT id, nome, created_at, updated_at 
FROM "tenant" 
WHERE id = $1;

-- name: ListTenants :many
SELECT id, nome, created_at, updated_at 
FROM "tenant";

-- name: UpdateTenant :exec
UPDATE "tenant" 
SET nome = $2, updated_at = CURRENT_TIMESTAMP 
WHERE id = $1;

-- name: DeleteTenant :exec
DELETE FROM "tenant" 
WHERE id = $1;
