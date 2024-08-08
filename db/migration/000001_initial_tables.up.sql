
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Tabela Tenant
CREATE TABLE "tenant" (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Usuarios
CREATE TABLE "users" (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    tenant_id UUID NOT NULL,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(50) NOT NULL,
    whatsapp VARCHAR(50) NOT NULL,
    foto BYTEA NOT NULL, 
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tenant_id) REFERENCES "tenant"(id) ON DELETE CASCADE
);

-- Tabela Categoria
CREATE TABLE "categories" (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    tenant_id UUID NOT NULL,
    users_id UUID NOT NULL,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tenant_id) REFERENCES "tenant"(id) ON DELETE CASCADE,
    FOREIGN KEY (users_id) REFERENCES "users"(id) ON DELETE CASCADE
);

-- Tabela Contas
CREATE TABLE "accounts" (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    tenant_id UUID NOT NULL,
    users_id UUID NOT NULL,
    category_id UUID NOT NULL,
    nome VARCHAR(50) NOT NULL,
    fornecedor VARCHAR(50) NOT NULL,
    type VARCHAR(50) NOT NULL,
    value NUMERIC(10, 2) NOT NULL,
    codigo_barras VARCHAR(50) NOT NULL,
    comprovante_pdf BYTEA NOT NULL,
    pix_conta_bancaria VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    period VARCHAR(10) NOT NULL DEFAULT 'month',
    status VARCHAR(10) NOT NULL DEFAULT 'unpaid',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tenant_id) REFERENCES "tenant"(id) ON DELETE CASCADE,
    FOREIGN KEY (users_id) REFERENCES "users"(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES "categories"(id) ON DELETE CASCADE
);   
