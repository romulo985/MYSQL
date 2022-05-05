USE `sucos_vendas`;
DROP procedure IF EXISTS `inclui_novo_produto_parametro`;
DELIMITER $$

USE `sucos_vendas`$$
CREATE PROCEDURE `inclui_novo_produto_parametro`(vCodigo varchar(50),
vNome varchar(50), vSabor varchar(50), vTamanho varchar(50),
vEmbalagem varchar(50), vPreco DECIMAL(10,2))
BEGIN
INSERT INTO tabela_de_produtos
(CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
     VALUES (vCodigo,
     vNome,
     vSabor,
     vTamanho,
     vEmbalagem,
     vPreco);   
END$$
DELIMITER   ;

Call inclui_novo_produto_parametro('4000001', 'Sabor do Pantanal 1 Litro - Melancia',
'Melancia', '1 Litro', 'PET', 4.76);

Call inclui_novo_produto_parametro('4000004', 'Sabor do Pantanal 1 Litro - Melancia',
'Melancia', '1 Litro', 'PET', 4.76);

USE `sucos_vendas`;
DROP procedure IF EXISTS `inclui_novo_produto_parametro_2`;  
DELIMITER $$

USE `sucos_vendas`$$
CREATE PROCEDURE `inclui_novo_produto_parametro_2`(vCodigo varchar(50),
vNome varchar(50), vSabor varchar(50), vTamanho varchar(50),
vEmbalagem varchar(50), vPreco DECIMAL(10,2))
BEGIN
DECLARE mensagem VARCHAR(40);
DECLARE EXIT HANDLER FOR 1062
BEGIN
   SET mensagem = 'Problema de Chave Primária !!!';
   SELECT mensagem;
END;

INSERT INTO tabela_de_produtos
(CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
     VALUES (vCodigo,
     vNome,
     vSabor,
     vTamanho,
     vEmbalagem,
     vPreco);
SET mensagem = 'Produto incluido com sucesso !!!';
SELECT mensagem;
END$$
DELIMITER ;

Call inclui_novo_produto_parametro_2('4000004', 'Sabor do Pantanal 1 Litro - Melancia',
'Melancia', '1 Litro', 'PET', 4.76);

--------------------


USE `sucos_vendas`;
DROP procedure IF EXISTS `acha_sabor_produto`;
DELIMITER $$

USE `sucos_vendas`$$
CREATE PROCEDURE `acha_sabor_produto`(vProduto VARCHAR(50))
BEGIN
   DECLARE vSabor VARCHAR(50);
   SELECT SABOR INTO vSabor FROM tabela_de_produtos WHERE codigo_do_produto = vProduto;
   SELECT vSabor;
END$$
DELIMITER ;


Call acha_sabor_produto('1013793');


