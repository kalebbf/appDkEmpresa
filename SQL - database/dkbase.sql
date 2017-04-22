-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 22-Abr-2017 às 16:36
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dkbase`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_comprador`
--

CREATE TABLE `tbl_comprador` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `localizacao` varchar(300) DEFAULT NULL,
  `telefone` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_movimento_caixa`
--

CREATE TABLE `tbl_movimento_caixa` (
  `id` int(11) NOT NULL,
  `data_mov` datetime NOT NULL,
  `valor` double NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `tipo_mov` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_produtos`
--

CREATE TABLE `tbl_produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_user_client`
--

CREATE TABLE `tbl_user_client` (
  `id` int(11) NOT NULL,
  `login` varchar(20) NOT NULL DEFAULT 'NULL',
  `senha` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_valor_produto`
--

CREATE TABLE `tbl_valor_produto` (
  `id` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `valor_unit` double NOT NULL,
  `valor_qntd` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_venda`
--

CREATE TABLE `tbl_venda` (
  `id` int(11) NOT NULL,
  `dataHora` datetime NOT NULL,
  `id_valor_produto` int(11) NOT NULL,
  `id_comprador` int(11) NOT NULL,
  `id_produto_tbl_valor_negociado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_comprador`
--
ALTER TABLE `tbl_comprador`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_movimento_caixa`
--
ALTER TABLE `tbl_movimento_caixa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_produtos`
--
ALTER TABLE `tbl_produtos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_client`
--
ALTER TABLE `tbl_user_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_valor_produto`
--
ALTER TABLE `tbl_valor_produto`
  ADD PRIMARY KEY (`id`,`id_produto`);

--
-- Indexes for table `tbl_venda`
--
ALTER TABLE `tbl_venda`
  ADD PRIMARY KEY (`id`,`id_valor_produto`,`id_produto_tbl_valor_negociado`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_comprador`
--
ALTER TABLE `tbl_comprador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_movimento_caixa`
--
ALTER TABLE `tbl_movimento_caixa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_produtos`
--
ALTER TABLE `tbl_produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_client`
--
ALTER TABLE `tbl_user_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_valor_produto`
--
ALTER TABLE `tbl_valor_produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_venda`
--
ALTER TABLE `tbl_venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
