// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.20.0

package db

import (
	"context"

	"github.com/google/uuid"
)

type Querier interface {
	CreateAccount(ctx context.Context, arg CreateAccountParams) (Account, error)
	CreateCategory(ctx context.Context, arg CreateCategoryParams) (Category, error)
	CreateTenant(ctx context.Context, nome string) (Tenant, error)
	CreateUser(ctx context.Context, arg CreateUserParams) (User, error)
	DeleteAccount(ctx context.Context, arg DeleteAccountParams) error
	DeleteCategories(ctx context.Context, arg DeleteCategoriesParams) error
	DeleteTenant(ctx context.Context, id uuid.UUID) error
	GetAccount(ctx context.Context, arg GetAccountParams) (Account, error)
	GetAccounts(ctx context.Context, arg GetAccountsParams) ([]GetAccountsRow, error)
	GetAccountsGraph(ctx context.Context, arg GetAccountsGraphParams) (int64, error)
	GetAccountsReports(ctx context.Context, arg GetAccountsReportsParams) (int64, error)
	GetCategories(ctx context.Context, arg GetCategoriesParams) ([]Category, error)
	GetCategory(ctx context.Context, arg GetCategoryParams) (Category, error)
	GetTenant(ctx context.Context, id uuid.UUID) (Tenant, error)
	GetUser(ctx context.Context, nome string) (User, error)
	GetUserById(ctx context.Context, id uuid.UUID) (User, error)
	ListTenants(ctx context.Context) ([]Tenant, error)
	UpdateAccount(ctx context.Context, arg UpdateAccountParams) (Account, error)
	UpdateCategories(ctx context.Context, arg UpdateCategoriesParams) (Category, error)
	UpdateTenant(ctx context.Context, arg UpdateTenantParams) error
}

var _ Querier = (*Queries)(nil)
