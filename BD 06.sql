-- Criação do banco de dados Biblioteca
CREATE DATABASE Biblioteca;

-- Seleciona o banco de dados Biblioteca para uso
USE Biblioteca;

-- Criação da tabela Livros para armazenar informações sobre os livros
CREATE TABLE Livros (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    titulo VARCHAR(255), 
    autor VARCHAR(255), 
    ano_publicacao INT, 
    genero VARCHAR(100) 
);

-- Criação da tabela Usuarios para armazenar informações sobre os usuários da biblioteca
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY, -
    nome VARCHAR(255),
    endereco VARCHAR(255), 
    email VARCHAR(255) 
);

-- Criação da tabela Emprestimos para registrar os empréstimos de livros aos usuários
CREATE TABLE Emprestimos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT, 
    id_livro INT, 
    data_emprestimo DATE, 
    data_devolucao DATE, 
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id), 
    FOREIGN KEY (id_livro) REFERENCES Livros(id) 
);

-- Inserção de dados fictícios na tabela Livros
INSERT INTO Livros (titulo, autor, ano_publicacao, genero) VALUES
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 1997, 'Fantasia'),
('1984', 'George Orwell', 1949, 'Ficção Científica'),
('Dom Quixote', 'Miguel de Cervantes', 1605, 'Clássico');

-- Inserção de dados fictícios na tabela Usuarios
INSERT INTO Usuarios (nome, endereco, email) VALUES
('João Silva', 'Rua das Flores, 123', 'joao@example.com'),
('Maria Santos', 'Avenida Principal, 456', 'maria@example.com');

-- Inserção de dados fictícios na tabela Emprestimos
INSERT INTO Emprestimos (id_usuario, id_livro, data_emprestimo, data_devolucao) VALUES
(1, 1, '2024-04-01', '2024-04-15'),
(2, 2, '2024-03-20', '2024-04-10');

-- Atualização do endereço do usuário João Silva
UPDATE Usuarios SET endereco = 'Rua Nova, 789' WHERE id = 1;

-- Atualização do título do livro '1984'
UPDATE Livros SET titulo = '1984 - Edição Especial' WHERE id = 2;

-- Consulta para listar todos os livros de um determinado autor (J.K. Rowling)
SELECT * FROM Livros WHERE autor = 'J.K. Rowling';

-- Consulta para listar todos os usuários que têm empréstimos vencidos
SELECT Usuarios.nome, Emprestimos.data_devolucao 
FROM Usuarios 
INNER JOIN Emprestimos ON Usuarios.id = Emprestimos.id_usuario 
WHERE Emprestimos.data_devolucao < CURDATE();

-- Remoção do usuário com ID 2
DELETE FROM Usuarios WHERE id = 2;
