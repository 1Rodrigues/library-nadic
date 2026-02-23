from db import conectar

def mostrar_atrasados():
    try:
        with conectar() as conn:
            with conn.cursor() as cur:
                cur.execute("""
                            SELECT emprestimo.id, usuario.nome, emprestimo.data_prevista, livro.titulo
                            FROM emprestimo JOIN usuario
                            ON usuario.id = emprestimo.usuario_id
                            JOIN emprestimo_item
                            ON emprestimo_item.emprestimo_id = emprestimo.id
                            JOIN livro
                            ON livro.id = emprestimo_item.livro_id
                            WHERE emprestimo.data_prevista <  CURRENT_DATE AND emprestimo.data_devolucao IS NULL;
                            """)
                resultado = cur.fetchall()

                if not resultado:
                    print('Nao existem emprestimos atrasados')
                else:
                    for e_id, u_nome, e_data, l_titulo in resultado:
                        print(f'Emprestimo id: {e_id} livro: {l_titulo}\n Feito pelo usuario: {u_nome} deveria ter sido entregue em {e_data}')
    except Exception as e:
        print('Erro ao consultar emprestimos:')
        print(e)
