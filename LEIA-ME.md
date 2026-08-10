# Escala dos Coroinhas

Aplicativo simples para os pais marcarem em quais missas seus filhos
(coroinhas) vão servir, com relatórios por fim de semana e por mês.

Feito para rodar **sem build**: é um único arquivo `index.html`.

## Arquivos
- `index.html` — o aplicativo inteiro.
- `esquema.sql` — cria as tabelas no Supabase (rodar uma vez).
- `.gitignore`

## Passo a passo (resumo)
1. Crie um projeto no Supabase.
2. No SQL Editor, cole o conteúdo de `esquema.sql` e clique em RUN.
3. Em "Configurações > API", copie a **Project URL** e a **chave anon public**.
4. Abra `index.html` e cole as duas nas linhas do topo (onde diz COLE_AQUI).
5. Suba para o GitHub e publique na Vercel.

A chave "anon" pode ficar visível no código — ela é feita para isso e o
acesso é controlado pelas regras do banco (RLS).
