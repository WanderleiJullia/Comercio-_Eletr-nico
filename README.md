# Comercio_Eletr-nico

## A Atividade a seguir possui o objetivo de especificar cada detalhe que aprendemos durante a aula. Fomos designados a criar um sistema de comercio eletronico, que possui os seguintes detalhes adicionais, Tabelas, relacionamentos, Stored procedures, Views; 
![image](https://github.com/WanderleiJullia/Comercio-_Eletr-nico/assets/144744092/8c462374-ffba-4193-9c2e-bb8abeda6a61)

## 1º Modelo Logico de Comercio_Eletronico; 
## 2º Criação de tabelas; 
```SQL
create table Produtos(
id_Produto int not null auto_increment,
Nome varchar(200) not null,
Descricao text, 
preco decimal(10,09) not null,
Quantidade_estoque int not null,
primary key (id_Produto)
);


create table Pedidos(
Id_Pedidos int not null auto_increment,
Data_Pedido date not null,
Cliente_id int not null,
Status varchar(200) not null, 
primary key (id_Pedidos)
); 

create table Clientes(
Cliente_id int not null auto_increment,
Nome varchar(200) not null,
Endereco_entrega varchar(255),
Telefone varchar(200) not null, 
Email varchar(200) not null,
primary key (Cliente_id)
);

create table Itens_Pedido(
id_Item int not null auto_increment,
Id_Pedidos int not null, 
id_Produtos int not null, 
Quantidade int not null, 
primary key (id_Item),
foreign key (Id_Pedidos) references Pedidos(Id_Pedidos),
foreign key (id_Produtos) references Produtos(id_Produtos)
);
```

## 3º Criação de relacionamento; 
```SQL
alter table Pedidos add constraint fk_Pedidos_Clientes foreign key (Cliente_id) references Clientes(Cliente_id);
alter table Itens_Pedido add constraint fk_Itens_Pedidos_Produto foreign key (id_Produto) references Produto(id_Produto);
```

## 4º Inserir dados do comercio; 
![image](https://github.com/WanderleiJullia/Comercio-_Eletr-nico/assets/144744092/a7dbbfc1-4905-4408-91ba-f3edd96a26ef)

# Dados dos Clientes;
![image](https://github.com/WanderleiJullia/Comercio-_Eletr-nico/assets/144744092/62d7069e-7e88-44cd-807c-89e4d55402c7)

# Dados de Pedido; 
![image](https://github.com/WanderleiJullia/Comercio-_Eletr-nico/assets/144744092/1d458400-ceed-4c39-aaa4-e02a17c47f9e)

## 5º Stored Procedures: Implemente uma stored procedure para permitir que os clientes adicionem produtos ao carrinho de compras.
```SQL
delimiter $
CREATE PROCEDURE adicionar_produto_ao_carrinho (
  IN id_produto INT,
  IN Quantidade INT
)
BEGIN

  INSERT INTO itens_pedido ( id_Produto, quantidade)
  VALUES (id_produto, quantidade);

END$
delimiter ;
```
## Crie uma stored procedure para processar pedidos, atualizando o estoque de produtos e registrando os detalhes do pedido.
```SQL
delimiter $

CREATE PROCEDURE Processar_Pedidos (
  IN Cliente_id INT,
  IN Data_Pedido DATETIME,
  IN status VARCHAR(255)
)
BEGIN

  DECLARE id_pedido INT;

  SET id_pedido = (SELECT MAX(id) + 1 FROM pedidos);

  -- Inserir os detalhes do pedido
  INSERT INTO pedidos (id, Data_Pedido, Cliente_id, Status)
  VALUES (Pedido_id, Data_pedido, Cliente_id, Status);

  UPDATE produtos
  SET quantidade_estoque = quantidade_estoque - 
    (SELECT quantidade FROM itens_pedido WHERE pedido_id = id_pedido);

END$

delimiter ;
```
## Implementação de Views; 

## 6º Crie uma view que mostre o histórico de pedidos de um cliente específico, incluindo os produtos incluídos em cada pedido.
```SQL
CREATE VIEW Historico_pedidos AS
SELECT
  Pedidos.id,
  Pedidos.data,
  Pedidos.Cliente_id,
  Pedidos.status,
  Produtos.nome AS produto,
  Itens_pedido.quantidade AS quantidade
FROM pedidos
INNER JOIN itens_pedido ON itens_pedido.pedido_id = pedidos.id
INNER JOIN produtos ON produtos.id = itens_pedido.produto_id;
```

## 7º Implemente uma view que forneça uma lista de todos os produtos disponíveis, excluindo aqueles que estão esgotados; 
```SQL
CREATE VIEW produtos_disponiveis AS
SELECT
  Produtos.id,
  Produtos.nome,
  Produtos.Descricao,
  Produtos.preco,
  Produtos.quantidade_estoque
FROM produtos
WHERE produtos.quantidade_estoque > 0;
``` 

## Jullia Santos Wanderlei 
Bancos de Dados 
