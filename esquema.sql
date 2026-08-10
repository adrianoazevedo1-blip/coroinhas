-- ==========================================================
--  Escala dos Coroinhas — criação do banco (rode uma vez)
--  Cole tudo isto no SQL Editor do Supabase e clique em RUN.
-- ==========================================================

create table if not exists coroinhas (
  id uuid primary key default gen_random_uuid(),
  nome text not null,
  responsavel text,
  created_at timestamptz default now()
);

create table if not exists missas_fixas (
  id uuid primary key default gen_random_uuid(),
  label text not null,
  weekday int not null,          -- 0=Domingo ... 6=Sábado
  time text not null
);

create table if not exists missas_festivas (
  id uuid primary key default gen_random_uuid(),
  data date not null,
  label text not null,
  time text
);

create table if not exists marcacoes (
  id uuid primary key default gen_random_uuid(),
  instancia_id text not null,
  coroinha_id uuid not null references coroinhas(id) on delete cascade,
  created_at timestamptz default now(),
  unique (instancia_id, coroinha_id)
);

-- 3 missas fixas iniciais (você ajusta depois na tela de Administração)
insert into missas_fixas (label, weekday, time) values
  ('Missa de Sábado', 6, '19:00'),
  ('Missa de Domingo (manhã)', 0, '08:00'),
  ('Missa de Domingo (noite)', 0, '19:00');

-- Acesso público (ferramenta interna, sem login).
alter table coroinhas enable row level security;
alter table missas_fixas enable row level security;
alter table missas_festivas enable row level security;
alter table marcacoes enable row level security;

create policy "publico_coroinhas" on coroinhas for all using (true) with check (true);
create policy "publico_fixas" on missas_fixas for all using (true) with check (true);
create policy "publico_festivas" on missas_festivas for all using (true) with check (true);
create policy "publico_marcacoes" on marcacoes for all using (true) with check (true);
