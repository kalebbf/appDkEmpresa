-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'tbl_user_client'
-- 
-- ---

DROP TABLE IF EXISTS `tbl_user_client`;
		
CREATE TABLE `tbl_user_client` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `login` VARCHAR(20) NOT NULL DEFAULT 'NULL',
  `senha` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'tbl_produtos'
-- 
-- ---

DROP TABLE IF EXISTS `tbl_produtos`;
		
CREATE TABLE `tbl_produtos` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nome` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'tbl_valor_produto'
-- 
-- ---

DROP TABLE IF EXISTS `tbl_valor_produto`;
		
CREATE TABLE `tbl_valor_produto` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_produto` INTEGER NOT NULL,
  `valor_unit` DOUBLE NOT NULL,
  `valor_qntd` DOUBLE NOT NULL,
  PRIMARY KEY (`id`, `id_produto`)
);

-- ---
-- Table 'tbl_movimento_caixa'
-- 
-- ---

DROP TABLE IF EXISTS `tbl_movimento_caixa`;
		
CREATE TABLE `tbl_movimento_caixa` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `data_mov` DATETIME NOT NULL,
  `valor` DOUBLE NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `tipo_mov` INTEGER NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'tbl_venda'
-- 
-- ---

DROP TABLE IF EXISTS `tbl_venda`;
		
CREATE TABLE `tbl_venda` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `dataHora` DATETIME NOT NULL,
  `id_valor_produto` INTEGER NOT NULL,
  `id_comprador` INTEGER NOT NULL,
  `id_produto_tbl_valor_negociado` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `id_valor_produto`, `id_produto_tbl_valor_negociado`)
);

-- ---
-- Table 'tbl_comprador'
-- 
-- ---

DROP TABLE IF EXISTS `tbl_comprador`;
		
CREATE TABLE `tbl_comprador` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nome` VARCHAR NOT NULL,
  `localizacao` VARCHAR(500) NULL DEFAULT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'tbl_valor_negociado'
-- 
-- ---

DROP TABLE IF EXISTS `tbl_valor_negociado`;
		
CREATE TABLE `tbl_valor_negociado` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_comprador` INTEGER NOT NULL,
  `id_produto` INTEGER NULL DEFAULT NULL,
  `valor_negociado` DOUBLE NOT NULL,
  PRIMARY KEY (`id`, `id_comprador`, `id_produto`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `tbl_produtos` ADD FOREIGN KEY (id) REFERENCES `tbl_valor_produto` (`id_produto`);
ALTER TABLE `tbl_valor_produto` ADD FOREIGN KEY (id) REFERENCES `tbl_venda` (`id_valor_produto`);
ALTER TABLE `tbl_valor_produto` ADD FOREIGN KEY (id_produto) REFERENCES `tbl_valor_negociado` (`id_produto`);
ALTER TABLE `tbl_venda` ADD FOREIGN KEY (id_produto_tbl_valor_negociado) REFERENCES `tbl_valor_negociado` (`id`);
ALTER TABLE `tbl_comprador` ADD FOREIGN KEY (id) REFERENCES `tbl_valor_negociado` (`id_comprador`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `tbl_user_client` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tbl_produtos` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tbl_valor_produto` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tbl_movimento_caixa` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tbl_venda` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tbl_comprador` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `tbl_valor_negociado` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


