-- name: CreateUser :one
INSERT INTO users (
  nome,
  senha,
  email
) VALUES (
  $1, $2, $3
) RETURNING *;

-- name: GetUser :one
SELECT * FROM users
WHERE nome = $1 LIMIT 1;

-- name: GetUserById :one
SELECT * FROM users
WHERE id = $1 LIMIT 1;
