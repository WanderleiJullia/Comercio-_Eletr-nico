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



4º CREATE VIEW produtos_disponiveis AS
SELECT
  Produtos.id,
  Produtos.nome,
  Produtos.Descricao,
  Produtos.preco,
  Produtos.quantidade_estoque
FROM produtos
WHERE produtos.quantidade_estoque > 0;
 

