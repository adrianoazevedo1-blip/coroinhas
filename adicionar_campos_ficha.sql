-- ============================================================
--  Campos da FICHA do coroinha (rode UMA vez, ANTES de publicar).
--  Cole no SQL Editor do Supabase e clique em RUN.
-- ============================================================
alter table coroinhas
  add column if not exists nome_completo text,
  add column if not exists responsaveis text,
  add column if not exists endereco text,
  add column if not exists telefone text,
  add column if not exists nascimento date,
  add column if not exists primeira_eucaristia boolean default false,
  add column if not exists crisma boolean default false,
  add column if not exists cadastro_completo boolean default false;
