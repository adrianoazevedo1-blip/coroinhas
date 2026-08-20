-- ============================================================
--  Tabela de SOLENIDADES (rode UMA vez, antes de publicar o app novo).
--  Cole no SQL Editor do Supabase e clique em RUN.
-- ============================================================
create table if not exists solenidades (
  id uuid primary key default gen_random_uuid(),
  data date not null,
  titulo text not null,
  descricao text,
  created_at timestamptz default now()
);

alter table solenidades enable row level security;
create policy "publico_solenidades" on solenidades for all using (true) with check (true);
