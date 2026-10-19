-- Esboço inicial de banco para futura versão compartilhada.
-- Revise e teste em um projeto separado antes de usar com dados reais.
create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null,
  role text not null check (role in ('admin','bibliotecaria','professor','estudante','moderador')),
  classroom text,
  created_at timestamptz not null default now()
);

create table if not exists public.books (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  author text not null,
  category text not null default 'Outro',
  publication_year integer,
  isbn text,
  description text,
  created_at timestamptz not null default now()
);

create table if not exists public.copies (
  id uuid primary key default gen_random_uuid(),
  book_id uuid not null references public.books(id) on delete cascade,
  inventory_code text unique not null,
  status text not null default 'available' check (status in ('available','loaned','repair','lost','withdrawn')),
  created_at timestamptz not null default now()
);

create table if not exists public.loans (
  id uuid primary key default gen_random_uuid(),
  copy_id uuid not null references public.copies(id),
  reader_id uuid not null references public.profiles(id),
  issued_by uuid not null references public.profiles(id),
  issued_at date not null default current_date,
  due_at date not null,
  returned_at date,
  created_at timestamptz not null default now()
);

create table if not exists public.reservations (
  id uuid primary key default gen_random_uuid(),
  book_id uuid not null references public.books(id),
  reader_id uuid not null references public.profiles(id),
  status text not null default 'queued' check (status in ('queued','ready','fulfilled','cancelled')),
  created_at timestamptz not null default now()
);

create table if not exists public.reviews (
  id uuid primary key default gen_random_uuid(),
  book_id uuid not null references public.books(id) on delete cascade,
  author_id uuid not null references public.profiles(id),
  rating integer not null check (rating between 1 and 5),
  body text not null check (char_length(body) between 8 and 2000),
  status text not null default 'pending' check (status in ('pending','published','rejected')),
  created_at timestamptz not null default now()
);

-- Não habilite acesso público antes de definir políticas adequadas.
alter table public.profiles enable row level security;
alter table public.books enable row level security;
alter table public.copies enable row level security;
alter table public.loans enable row level security;
alter table public.reservations enable row level security;
alter table public.reviews enable row level security;

-- Este esquema é uma base de trabalho, NÃO uma configuração de produção completa.
-- Antes de conectar, escreva e teste políticas RLS específicas para cada papel,
-- especialmente operações de bibliotecária/admin, empréstimos e moderação.
