-- INSERINDO DADOS NAS TABELAS

INSERT INTO clients (Fname, Minit, Lname, CPF, Address)
VALUES 
('João', 'A', 'Silva', '12345678901', 'Rua A, 123'),
('Maria', 'B', 'Oliveira', '23456789012', 'Rua B, 456'),
('Pedro', 'C', 'Santos', '34567890123', 'Rua C, 789');

INSERT INTO product (Nome, Category, Classification_kids, Valor, Avaliação, Size)
VALUES 
('Camiseta', 'Roupas', TRUE, '49.99', 4.5, 'M'),
('Tênis', 'Calçados', FALSE, '199.99', 4.8, '42'),
('Smartphone', 'Eletrônicos', FALSE, '1500.00', 4.2, '6.5'),
('Notebook', 'Eletrônicos', FALSE, '3500.00', 4.6, '15.6');

INSERT INTO orders (idOrderclient, idOrderproduct, orderStatus, orderDesription, SendValue,idMétodoPagamento)
VALUES 
(1, 1, 'Confirmado', 'Pedido de camiseta', 15.00,1),
(2, 3, 'Processando', 'Pedido de smartphone', 25.00,2),
(3, 2, 'Cancelado', 'Pedido de tênis', 10.00,3);

INSERT INTO productStorage (StorageLocation, Quantity)
VALUES 
('Armazém A', 100),
('Armazém B', 50),
('Loja Física', 30);

INSERT INTO Supplier (SocialName, CNPJ, Contact)
VALUES 
('Fornecedor A', '12345678000195', '1122334455'),
('Fornecedor B', '98765432000176', '9988776655');

INSERT INTO Seller (SocialName, AbstName, CNPJ, CPF, Address, Contact)
VALUES 
('Vendedor A', 'João da Silva', '12345678000199', '12345678900', 'Rua do Vendedor, 123', '9988776655'),
('Vendedor B', 'Maria Souza', '98765432000111', '23456789011', 'Avenida Vendedores, 456', '1122334455');

INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
VALUES 
(1, 1, 2, 'Disponível'),
(2, 2, 1, 'Disponível'),
(3, 3, 1, 'Sem estoque');

INSERT INTO productSeller (idPOProduct, idPOorder, poQuantity, poStatus)
VALUES 
(1, 1, 2, 'Disponível'),
(2, 2, 1, 'Disponível'),
(3, 3, 1, 'Sem estoque');

INSERT INTO storageLocation (idLProduct, idLStorage, location)
VALUES 
(1, 1, 'Armazém A - Prateleira 1'),
(2, 2, 'Armazém B - Prateleira 2'),
(3, 3, 'Loja Física - Exposição');

INSERT INTO productSupplier (idPsSupplier, idPsProduct, quantity)
VALUES 
(1, 1, 200),
(2, 2, 100),
(1, 3, 50);

INSERT INTO MétodoPagamento (TipoPagamento, Descrição)
VALUES 
('Cartão de Crédito', 'Pagamento via cartão de crédito.'),
('Boleto', 'Pagamento via boleto bancário.'),
('Transferência', 'Pagamento via transferência bancária.');

INSERT INTO DetalhesPagamento (idOrderdetalhes, idMétododetalhes, DadosPagamento, StatusPagamento)
VALUES 
(1, 1, 'Número do Cartão: 1234-5678-9876-5432, Data de validade: 12/24, CVV: 123', 'Confirmado'),
(2, 2, 'Código de barras: 123456789012, Data de vencimento: 2024-12-31', 'Processando'),
(3, 3, 'Conta: 123456789, Banco: Banco A', 'Recusado');










