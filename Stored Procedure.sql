Stored Procedures. 

1º delimiter $
CREATE PROCEDURE adicionar_produto_ao_carrinho (
  IN id_produto INT,
  IN Quantidade INT
)
BEGIN

  INSERT INTO itens_pedido ( id_Produto, quantidade)
  VALUES (id_produto, quantidade);

END$
delimiter ;


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


