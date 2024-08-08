// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.20.0
// source: user.sql

package db

import (
	"context"

	"github.com/google/uuid"
)

const createUser = `-- name: CreateUser :one
INSERT INTO users (
  nome,
  senha,
  email
) VALUES (
  $1, $2, $3
) RETURNING id, tenant_id, nome, email, senha, whatsapp, foto, created_at, updated_at
`

type CreateUserParams struct {
	Nome  string `json:"nome"`
	Senha string `json:"senha"`
	Email string `json:"email"`
}

func (q *Queries) CreateUser(ctx context.Context, arg CreateUserParams) (User, error) {
	row := q.db.QueryRowContext(ctx, createUser, arg.Nome, arg.Senha, arg.Email)
	var i User
	err := row.Scan(
		&i.ID,
		&i.TenantID,
		&i.Nome,
		&i.Email,
		&i.Senha,
		&i.Whatsapp,
		&i.Foto,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getUser = `-- name: GetUser :one
SELECT id, tenant_id, nome, email, senha, whatsapp, foto, created_at, updated_at FROM users
WHERE nome = $1 LIMIT 1
`

func (q *Queries) GetUser(ctx context.Context, nome string) (User, error) {
	row := q.db.QueryRowContext(ctx, getUser, nome)
	var i User
	err := row.Scan(
		&i.ID,
		&i.TenantID,
		&i.Nome,
		&i.Email,
		&i.Senha,
		&i.Whatsapp,
		&i.Foto,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getUserById = `-- name: GetUserById :one
SELECT id, tenant_id, nome, email, senha, whatsapp, foto, created_at, updated_at FROM users
WHERE id = $1 LIMIT 1
`

func (q *Queries) GetUserById(ctx context.Context, id uuid.UUID) (User, error) {
	row := q.db.QueryRowContext(ctx, getUserById, id)
	var i User
	err := row.Scan(
		&i.ID,
		&i.TenantID,
		&i.Nome,
		&i.Email,
		&i.Senha,
		&i.Whatsapp,
		&i.Foto,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}