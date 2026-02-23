from db import conectar

def listar_livros():
    conn = conectar()
    cur = conn.cursor()
    cur.execute("SELECT livro.titulo, autor.nome AS autor FROM livro JOIN livro_autor ON livro.id = livro_autor.livro_id JOIN autor ON autor.id = livro_autor.autor_id ORDER BY livro.titulo;")
    livros = cur.fetchall()
    for titulo,autor in livros:
        print(f'Livro: {titulo} | Autor: {autor}')
    cur.close()
    conn.close()

def buscar_livro():
    livro = input('Digite o titulo do livro para buscar: ')
    try:
        with conectar() as conn:
            with conn.cursor() as cur:
                cur.execute('SELECT livro.titulo, livro.total_exemplares FROM livro WHERE livro.titulo ILIKE %s;', (f'%{livro}%',))
                resultado = cur.fetchall()
        if not resultado:
            print('Nenhum livro encontrado')
        else:
            for titulo, total in resultado:
                print(f'Título: {titulo} | Exemplares: {total}')
    except Exception as e:
        print('\nErro aobuscar livro:')
        print(e)

def buscar_autor():
    autor = input('Digite o nome do autor para buscar: ')
    try:
        with conectar() as conn:
            with conn.cursor() as cur:
                cur.execute('SELECT autor.nome, livro.titulo FROM autor JOIN livro_autor ON livro_autor.autor_id = autor.id JOIN livro ON livro.id = livro_autor.livro_id WHERE autor.nome ILIKE %s;', (f'%{autor}%',))
                autor = cur.fetchall()

        if not autor:
                print('Autor não encontrado!')
        else:
            for nome, livro in autor:
                print(f'Autor: {nome} | livro {livro}')
    except Exception as e:
        print('\nErro ao buscar autor:')
        print(e)
def apagar_livro():
    livro_id = input('Digite o id do livro para apagar: ')
    try:
        with conectar() as conn:
            with conn.cursor() as cur:
                cur.execute('DELETE FROM livro WHERE id = %s', (livro_id,))
                if cur.rowcount == 0:
                    print('Livro nao encontrado')
                else:
                    print('Livro excluido com sucesso')
    except Exception as e:
        print('\nErro ao apagar livro')
        print(e)





