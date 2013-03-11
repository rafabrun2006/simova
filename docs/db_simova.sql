-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Mar 10, 2013 as 11:42 PM
-- Versão do Servidor: 5.1.50
-- Versão do PHP: 5.3.9-ZS5.6.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `db_simova`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_perfil`
--

CREATE TABLE IF NOT EXISTS `tb_perfil` (
  `cod_peril` int(11) NOT NULL AUTO_INCREMENT,
  `cod_login` int(11) DEFAULT NULL,
  `nome_perfil` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_peril`),
  KEY `fk_login_perf_login` (`cod_login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_perfil`
--


--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `tb_perfil`
--
ALTER TABLE `tb_perfil`
  ADD CONSTRAINT `fk_login_perf_login` FOREIGN KEY (`cod_login`) REFERENCES `tb_login` (`cod_login`);
