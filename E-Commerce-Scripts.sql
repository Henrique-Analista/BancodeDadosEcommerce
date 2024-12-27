-- Criando Banco de Dados do E-commerce
CREATE DATABASE ecommerce;
USE ecommerce;

-- Criar tabela cliente

create table clients(
		idClient INT Auto_Increment primary key,
		Fname VARCHAR(10),
        Minit char(3),
        Lname VARCHAR(20),
        CPF CHAR(11) NOT NULL,
        Address VARCHAR(30),
        constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;
-- Criar tabela produto
create table product(
		idproduct INT Auto_Increment primary key NOT NULL,
        Nome VARCHAR(15) NOT NULL,
		Category VARCHAR(20) NOT NULL,
        Classification_kids bool,
        Valor VARCHAR(10) NOT NULL,
		Avaliação FLOAT DEFAULT 0,
        Size VARCHAR(10)
);

-- Criar tabela pedido
create table orders(
		idOrder INT Auto_Increment primary key NOT NULL,
        idOrderclient INT,
        idOrderproduct INT,
        orderStatus ENUM('Processando', 'Confirmado', 'Cancelado') DEFAULT 'Processando',
        orderDesription varchar(255),
        SendValue FLOAT DEFAULT 10,
        CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
);
DESC orders;
-- Criar Tabela estoque

create table productStorage(
		idProdStorage INT Auto_Increment primary key NOT NULL,
        StorageLocation VARCHAR(255),
        Quantity INT default 0
);

-- Criar Tabela fornecedor
create table Supplier(
		idSupplier INT Auto_Increment primary key NOT NULL,
        SocialName VARCHAR(255),
        CNPJ CHAR(15) NOT NULL UNIQUE,
        Contact VARCHAR(11) NOT NULL
);
desc supplier;
-- Criar tabela vendedor
create table Seller(
		idSeller INT Auto_Increment primary key NOT NULL,
        SocialName VARCHAR(255),
        AbstName VARCHAR(255),
		CNPJ CHAR(15) NOT NULL UNIQUE,
        CPF CHAR(15) NOT NULL UNIQUE,
        Address CHAR(255) NOT NULL,
        Contact VARCHAR(255) NOT NULL
);
desc seller;
CREATE TABLE productOrder(
	idPOproduct INT,
    idPOorder INT,
    poQuantity INT DEFAULT 1,
    poStatus enum('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_Orderproduct_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_Orderproduct_product foreign key (idPOorder) references orders(idOrder)
);
desc productOrder;   

CREATE TABLE productSeller(
 		idPOProduct INT,
        idPOorder INT,
        poQuantity INT DEFAULT 1,
        poStatus enum('Disponível', 'Sem estoque') DEFAULT 'Disponível',
        primary key (idPOProduct, idPOorder),
        constraint fk_product_seller foreign key (idPOProduct) references product(idProduct),
        constraint fk_product_product foreign key (idPOorder) references orders(idOrder)
);
CREATE TABLE storageLocation(
	idLProduct int,
    idLStorage INT,
    location varchar(255) NOT NULL,
    primary	key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idproduct),
	constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
    );
    create table productSupplier(
		idPsSupplier INT,
        idPsProduct INT,
        quantity INT NOT NULL,
        primary key	(idPsSupplier, idPsProduct),
        constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
        constraint fk_product_supplier_product foreign key(idPsProduct) references product(idProduct)
    );

