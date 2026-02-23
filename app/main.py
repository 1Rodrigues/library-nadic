from livro import listar_livros, buscar_livro, apagar_livro, buscar_autor
from usuario import inserir_usuario
from emprestimo import mostrar_atrasados


def menu():
    print('\n=== SISTEMA BIBLIOTECA ===')
    print('1 - Listar livros')
    print('2 - Buscar livro por título')
    print('3 - Buscar autor')
    print('4 - Mostrar empréstimos atrasados')
    print('5 - Inserir novo usuário')
    print('6 - Apagar livro (via id)')
    print('0 - Sair')


def main():
    while True:
        menu()
        opcao = input("Escolha uma opção: ")

        match opcao:
            case "1":
                listar_livros()

            case "2":
                buscar_livro()

            case "3":
                buscar_autor()

            case "4":
                mostrar_atrasados()

            case "5":
                inserir_usuario()

            case "6":
                apagar_livro()

            case "0":
                print("Saindo...")
                break

            case _:
                print("Opção inválida")


if __name__ == "__main__":
    main()

