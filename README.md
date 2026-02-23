# dblibrary
   Library System – ER Modeling and Implementation in PostgreSQL (NADIC Backend Track)
   "Criar um Projeto de Banco de Dados, desde um nível de abstração mais elevado, como Modelo ER (através do diagrama ER), passando para o modelo relacional (tabelas simples, tabelas com relacionamentos, etc.) até o projeto no Banco de Dados (pode usar MySQL e/ou Postgresql e/ou SQLite e/ou outro que você achar válido, o interessante é praticar, inclusive em mais de um).  Nesse projeto, deverá ser possível consultar, inserir, deletar e atualizar informações em um Banco de Dados, respeitando o relacionamento entre os dados e as devidas restrições."
   
como rodar o app:
# Criar o ambiente virtual
python3 -m venv venv

# Ativar o ambiente virtual
source venv/bin/activate

# Instalar as dependências (psycopg2 e python-dotenv)
pip install -r requirements.txt

# Crie o arquivo .env na raiz do projeto
touch .env

DB_PASSWORD=sua_senha

#no postgre
sudo -u postgres psql

CREATE USER app WITH PASSWORD 'sua_senha_aqui';
CREATE DATABASE biblioteca;
GRANT ALL PRIVILEGES ON DATABASE biblioteca TO app;
\q

psql -h localhost -U app -d biblioteca -f 01_schema.sql
psql -h localhost -U app -d biblioteca -f 02_seed.sql

