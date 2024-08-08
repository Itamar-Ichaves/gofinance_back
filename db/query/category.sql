-- name: CreateCategory :one
INSERT INTO categories (
  tenant_id,
  nome,
  descricao
) VALUES (
  $1, $2, $3
) RETURNING *;

-- name: GetCategory :one
SELECT * FROM categories
WHERE id = $1 AND tenant_id = $2 LIMIT 1;

-- name: GetCategories :many
SELECT * FROM categories
WHERE
  tenant_id = $1
AND
  users_id = $2
AND
  LOWER(nome) LIKE CONCAT('%', LOWER($3::text), '%')
AND
  LOWER(description) LIKE CONCAT('%', LOWER($4::text), '%');

-- name: UpdateCategories :one
UPDATE categories
SET nome = $2, descricao = $3
WHERE id = $1 AND tenant_id = $4
RETURNING *;

-- name: DeleteCategories :exec
DELETE FROM categories
WHERE id = $1 AND tenant_id = $2;
