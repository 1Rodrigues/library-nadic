-- mostrar usuarios e emails
SELECT nome, email FROM usuario
ORDER BY nome;

--Mostrar livros e seus autores;
SELECT livro.titulo, autor.nome AS autor
FROM livro JOIN livro_autor
ON livro.id = livro_autor.livro_id
JOIN autor
ON autor.id = livro_autor.autor_id
ORDER BY livro.titulo;

--mostrar emprestimos atrasados
SELECT emprestimo.id, usuario.nome, emprestimo.data_prevista, livro.titulo
FROM emprestimo JOIN usuario
ON usuario.id = emprestimo.usuario_id
JOIN emprestimo_item
ON emprestimo_item.emprestimo_id = emprestimo.id
JOIN livro
ON livro.id = emprestimo_item.livro_id
WHERE emprestimo.data_prevista <  CURRENT_DATE AND emprestimo.data_devolucao IS NULL;


