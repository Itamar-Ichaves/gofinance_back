-- name: CreateAccount :one
INSERT INTO accounts (
  id,
  tenant_id,
  users_id,
  category_id,
  nome,
  fornecedor,
  type,
  value,
  codigo_barras,
  comprovante_pdf,
  pix_conta_bancaria,
  description,
  period,
  status,
  created_at,
  updated_at
) VALUES (
  uuid_generate_v4(),
  $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
) RETURNING *;

-- name: GetAccount :one
SELECT * FROM accounts
WHERE id = $1 AND tenant_id = $2 LIMIT 1;

-- name: GetAccounts :many
SELECT
  a.id,
  a.tenant_id,
  a.users_id,
  a.category_id,
  a.nome,
  a.fornecedor,
  a.type,
  a.value,
  a.codigo_barras,
  a.comprovante_pdf,
  a.pix_conta_bancaria,
  a.description,
  a.period,
  a.status,
  a.created_at,
  a.updated_at,
  c.nome as category_nome
FROM
  accounts a
LEFT JOIN
  categories c ON c.id = a.category_id
WHERE
  a.tenant_id = $1
AND
  a.users_id = $2
AND
  a.type = $3
AND
  LOWER(a.nome) LIKE CONCAT('%', LOWER($4::text), '%')
AND
  LOWER(a.description) LIKE CONCAT('%', LOWER($5::text), '%')
AND
  a.category_id = COALESCE($6, a.category_id)
AND
  a.period = COALESCE($7, a.period);

-- name: GetAccountsReports :one
SELECT SUM(value) AS sum_value FROM accounts
WHERE tenant_id = $1 AND users_id = $2 AND type = $3;

-- name: GetAccountsGraph :one
SELECT COUNT(*) FROM accounts
WHERE tenant_id = $1 AND users_id = $2 AND type = $3;

-- name: UpdateAccount :one
UPDATE accounts
SET 
  nome = $2, 
  fornecedor = $3,
  type = $4,
  value = $5,
  codigo_barras = $6,
  comprovante_pdf = $7,
  pix_conta_bancaria = $8,
  description = $9,
  period = $10,
  status = $11,
  updated_at = CURRENT_TIMESTAMP
WHERE 
  id = $1 AND tenant_id = $12
RETURNING *;

-- name: DeleteAccount :exec
DELETE FROM accounts
WHERE id = $1 AND tenant_id = $2;
