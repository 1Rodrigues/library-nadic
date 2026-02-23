INSERT INTO usuario (nome, email, telefone)
VALUES
('Ana Silva', 'ana@email.com', '11999990001'),
('Carlos Souza', 'carlos@email.com', '11999990002'),
('Mariana Lima', 'mariana@email.com', '11999990003');

INSERT INTO autor (nome)
VALUES
('George Orwell'),
('Machado de Assis'),
('J.K. Rowling');

INSERT INTO livro (titulo, isbn)
VALUES
('1984', '9780451524935'),
('Dom Casmurro', '9788572326972'),
('Harry Potter e a Pedra Filosofal', '9788532511010');

INSERT INTO livro_autor (livro_id, autor_id)
VALUES
(1,1),
(2,2),
(3,3);

INSERT INTO emprestimo (usuario_id, data_emprestimo, data_prevista)
VALUES
(1, CURRENT_DATE, CURRENT_DATE + INTERVAL '7 days'),
(2, CURRENT_DATE, CURRENT_DATE + INTERVAL '10 days');

INSERT INTO emprestimo_item (emprestimo_id, livro_id, quantidade)
VALUES
(1,1,1),
(1,2,1),
(2,3,1);
