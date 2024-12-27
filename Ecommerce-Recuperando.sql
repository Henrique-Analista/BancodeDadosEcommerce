-- Recuperações de dados
-- Quantos pedidos foram feitos por cada cliente?
SELECT c.Fname, COUNT(o.idOrder) AS TotalOrders
FROM orders o
JOIN clients c ON o.idOrderClient = c.idClient
GROUP BY c.Fname;
-- R: 1 pedido por cliente, totalizando 3 pedidos.

-- Algum vendedor também é fornecedor?
SELECT s.idSeller, f.idSupplier AS VendedoresFornecedores
From Seller s
JOIN Supplier f ON s.idSeller = f.idSupplier;
-- R:Nenhum Vendedor é Fornecedor.

-- Relação de produtos,fornecedores e estoques;
SELECT P.idproduct, S.idSupplier, E.idProdStorage
FROM Product P
JOIN Supplier S, productStorage E;


-- Relação de nomes dos fornecedores e nomes dos produtos;
SELECT P.Nome, S.SocialName
FROM Product P
JOIN Supplier S;

-- Liste os nomes e contatos de todos os vendedores cadastrados na tabela Seller.

SELECT SocialName, contact
FROM Supplier;

-- Exiba todos os produtos com suas respectivas categorias e preços da tabela product
SELECT Nome, Category, Valor
FROM Product;

-- Quais clientes têm CPF iniciado por "123"?
SELECT idClient
FROM Clients
WHERE CPF LIKE '123%';

-- Liste todos os pedidos cujo status seja "Processando"

SELECT *
FROM Orders
WHERE OrderStatus LIKE 'Processando';

-- Quais fornecedores possuem o CNPJ que termina em "00199"?
SELECT idSupplier
FROM Supplier
WHERE CNPJ LIKE '%00199';

-- Calcule o valor total dos pedidos somando o SendValue com 10% de acréscimo.

SELECT idOrder, SendValue * 1.1 AS TotalValue
FROM orders;
-- Crie uma consulta que exiba o nome do produto e o preço com 15% de desconto.
SELECT Nome, Valor - (valor - 0.15) AS PreçoComDesconto
FROM Product;

-- Liste os fornecedores ordenados pelo nome social em ordem alfabética.
SELECT *
FROM Supplier
ORDER BY SocialName ASC;

-- Exiba os pedidos ordenados pelo valor do envio (SendValue) em ordem decrescente.
SELECT *
FROM Orders
ORDER BY SendValue DESC;
-- Liste as categorias de produtos e a quantidade total de produtos por categoria, mas exiba apenas as categorias que têm mais de 5 produtos.
SELECT P.Category, SUM(S.Quantity)
FROM Product P
JOIN ProductStorage S ON P.idProduct = S.idProdStorage
GROUP BY Category
HAVING SUM(S.Quantity) > 5;

-- Quais métodos de pagamento foram usados mais de 3 vezes?
SELECT COUNT(idmétodopagamento)
FROM Orders
GROUP BY idmétodopagamento
HAVING COUNT(idMétodopagamento) > 3;
