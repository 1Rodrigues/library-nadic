import psycopg2
from db import conectar

def inserir_usuario():
    nome = input("Nome: ").strip()
    email = input("Email: ").strip()
    telefone = input("Telefone: ").strip()

    if not nome or not email:
        print("Nome e email são obrigatórios.")
        return
    telefone = telefone if telefone else None

    try:
        with conectar() as conn:
            with conn.cursor() as cur:
                cur.execute(
                    """
                    INSERT INTO usuario (nome, email, telefone)
                    VALUES (%s, %s, %s)
                    RETURNING id, data_cadastro;
                    """,
                    (nome, email, telefone)
                )

                novo_id, data_cadastro = cur.fetchone()

        print("\nUsuário cadastrado com sucesso!")
        print(f"ID: {novo_id}")
        print(f"Data de cadastro: {data_cadastro}")

    except psycopg2.errors.UniqueViolation:
        print("Já existe um usuário com esse email.")

    except Exception as e:
        print("Erro ao inserir usuário:")
        print(e)

