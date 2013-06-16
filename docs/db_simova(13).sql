-- phpMyAdmin SQL Dump
-- version 4.0.0-beta2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 15, 2013 at 10:26 AM
-- Server version: 5.5.29-0ubuntu1
-- PHP Version: 5.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_simova`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_banner`
--

CREATE TABLE IF NOT EXISTS `tb_banner` (
  `cod_banner` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` int(11) NOT NULL,
  `foto` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_banner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_calendario_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_calendario_vacina` (
  `cod_calend` int(11) NOT NULL AUTO_INCREMENT,
  `dt_public_calend` date NOT NULL,
  `nome_calend` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_calend`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_campanha`
--

CREATE TABLE IF NOT EXISTS `tb_campanha` (
  `cod_camp` int(11) NOT NULL AUTO_INCREMENT,
  `nome_camp` varchar(100) NOT NULL,
  `dt_inicial_camp` date NOT NULL,
  `dt_final_camp` date NOT NULL,
  `dt_public_camp` date NOT NULL,
  PRIMARY KEY (`cod_camp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_cargo`
--

CREATE TABLE IF NOT EXISTS `tb_cargo` (
  `cod_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cargo` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_cargo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_cargo`
--

INSERT INTO `tb_cargo` (`cod_cargo`, `nome_cargo`) VALUES
(1, 'Médico'),
(2, 'Enfermeiro'),
(3, 'Técnico de Enfermage');

-- --------------------------------------------------------

--
-- Table structure for table `tb_cartao_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_cartao_vacina` (
  `cod_cartao_vac` int(11) NOT NULL AUTO_INCREMENT,
  `cod_un_saude` int(11) DEFAULT NULL,
  `dt_vac_aplicada` date NOT NULL,
  `dt_aprazada` date NOT NULL,
  `Cod_Campanha` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_cartao_vac`),
  KEY `fk_unidade_saude_cartao_vacina` (`cod_un_saude`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_cidade`
--

CREATE TABLE IF NOT EXISTS `tb_cidade` (
  `cod_cid` int(11) NOT NULL AUTO_INCREMENT,
  `cod_uf` int(11) NOT NULL,
  `nome_cid` varchar(35) NOT NULL,
  PRIMARY KEY (`cod_cid`),
  KEY `fk_uf_cidade` (`cod_uf`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tb_cidade`
--

INSERT INTO `tb_cidade` (`cod_cid`, `cod_uf`, `nome_cid`) VALUES
(1, 12, 'Gama'),
(2, 17, 'Santa Maria da Vitoria');

-- --------------------------------------------------------

--
-- Table structure for table `tb_doenca`
--

CREATE TABLE IF NOT EXISTS `tb_doenca` (
  `cod_doenca` int(11) NOT NULL AUTO_INCREMENT,
  `cod_vac` int(11) DEFAULT NULL,
  `cod_calend` int(11) DEFAULT NULL,
  `descricao_doenca` text NOT NULL,
  `doenca_evitada` text NOT NULL,
  PRIMARY KEY (`cod_doenca`),
  KEY `fk_calendario_vacina_doenca` (`cod_calend`),
  KEY `fk_vacina_doenca` (`cod_vac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_dose_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_dose_vacina` (
  `cod_dose` int(11) NOT NULL AUTO_INCREMENT,
  `cod_vac` int(11) DEFAULT NULL,
  `dose` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod_dose`),
  KEY `fk_vacina_dose_vacina` (`cod_vac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_endereco`
--

CREATE TABLE IF NOT EXISTS `tb_endereco` (
  `cod_end` int(11) NOT NULL AUTO_INCREMENT,
  `cod_cid` int(11) DEFAULT NULL,
  `endereco` varchar(100) NOT NULL,
  `cep` varchar(20) DEFAULT NULL,
  `bairro` varchar(45) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`cod_end`),
  KEY `fk_endereco_cidade` (`cod_cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `tb_endereco`
--

INSERT INTO `tb_endereco` (`cod_end`, `cod_cid`, `endereco`, `cep`, `bairro`, `numero`, `complemento`) VALUES
(6, NULL, 'Quadra 10', '0', '', NULL, NULL),
(29, 2, 'Quadra 10', '11111111', 'Pedregal', 2, 'igreja evangelica'),
(30, 1, 'Quadrai ', '72860000', 'Pedregal', 11, '11'),
(31, 1, 'Quadrai ', '72860000', 'Pedregal', 11, '11'),
(32, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(33, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(34, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(35, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(36, 1, 'rua', '222222', 'Pedregal', 0, 'comp'),
(37, 1, 'rua', '222222', 'Pedregal', 0, 'comp'),
(38, 1, 'rua', '222222', 'Pedregal', 0, 'comp'),
(39, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(40, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(41, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(42, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(43, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(44, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(45, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(46, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(47, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(48, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(49, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(50, 1, 'rua', '222222', 'Pedregal', 0, 'comp'),
(51, 1, 'rua', '222222', 'Pedregal', 0, 'comp'),
(52, 1, 'rua', '222222', 'Pedregal', 0, 'comp'),
(53, 1, 'rua', '222222', 'Pedregal', 0, 'comp'),
(54, 1, 'rua', '222222', 'Pedregal', 44, 'comp'),
(55, 1, 'rua', '222222', 'Pedregal', 11, 'comp'),
(56, 2, '', '72593091', 'Res Santos Dumont', 34, 'QBR 06 Bloco A'),
(57, 1, 'Rua da pedra', '123456789', 'Pedregal', 9, '11'),
(58, 1, 'Rua da pedra', '123456789', 'Pedregal', 9, '11'),
(60, 2, 'Quadra 10', '11111111', 'Pedregal', 2, 'igreja evangelica'),
(62, 1, 'Q 213/313', '72000', '', 1, 'Àrea especial'),
(63, 1, 'Q 213/313', '72.000-000', 'Centro', 1, ''),
(64, 1, 'Q 17 casa', '72.000-000', '', 18, ''),
(65, 1, 'QBR 06 BL A', '72593091', '', 34, ''),
(66, 1, 'QBR 06 BL A', '72593091', '', 1, 'area especial'),
(67, 1, 'QBR 06 BL A', '72593091', 'Residencial Santos Dumont', 34, ''),
(68, 1, 'Q. 02 casa', '72593091', 'Santa Rita', 1, ''),
(69, 1, 'QBR 06 BL A', '72593091', 'Residencial Santos Dumont', 34, ''),
(70, 1, 'QBR 06 BL A', '72593091', 'Residencial Santos Dumont', 34, ''),
(71, 1, 'Q. 02 casa', '72500000', '', 32, ''),
(72, 2, 'Quadra 10', '111.111-11', 'Pedregal', 2, 'igreja evangelica'),
(73, 1, 'Rua da pedra', '728.600-00', 'Pedregal', 9, '11'),
(74, 1, 'Rua da pedra', '111.111-11', 'Pedregal', 9, '11'),
(75, 1, 'Rua das Ostras', '999.999-99', 'Pedregal', 9, '11'),
(76, 1, 'Rua da pedra', '222.222-22', 'Pedregal', 9, '11'),
(77, 1, 'Rua da pedra', '222.222-22', 'Pedregal', 9, '11'),
(78, 1, 'Rua da pedra', '222.222-22', 'Pedregal', 9, '11');

-- --------------------------------------------------------

--
-- Table structure for table `tb_estado_civil`
--

CREATE TABLE IF NOT EXISTS `tb_estado_civil` (
  `cod_estado_civil` int(11) NOT NULL AUTO_INCREMENT,
  `nome_estado_civil` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cod_estado_civil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tb_estado_civil`
--

INSERT INTO `tb_estado_civil` (`cod_estado_civil`, `nome_estado_civil`) VALUES
(1, 'Solteiro'),
(2, 'Casado');

-- --------------------------------------------------------

--
-- Table structure for table `tb_fabricante`
--

CREATE TABLE IF NOT EXISTS `tb_fabricante` (
  `cod_fabric` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fabric` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_fabric`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tb_fabricante`
--

INSERT INTO `tb_fabricante` (`cod_fabric`, `nome_fabric`) VALUES
(6, 'Evanilson Vacinas'),
(7, 'Nastigios'),
(8, 'Evanilson Vacinas'),
(9, 'BCG Grupal Medics'),
(10, 'BCG Grupal Medics'),
(11, 'BCG Grupal Medics');

-- --------------------------------------------------------

--
-- Table structure for table `tb_fale_conosco`
--

CREATE TABLE IF NOT EXISTS `tb_fale_conosco` (
  `cod_fale` int(11) NOT NULL,
  `conteudo_texto` text NOT NULL,
  `nome_fale_conosco` varchar(100) NOT NULL,
  `email_fale_conosco` varchar(100) NOT NULL,
  PRIMARY KEY (`cod_fale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_funcao`
--

CREATE TABLE IF NOT EXISTS `tb_funcao` (
  `cod_funcao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_funcao` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_funcao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tb_funcao`
--

INSERT INTO `tb_funcao` (`cod_funcao`, `nome_funcao`) VALUES
(1, 'Diretor Geral'),
(2, 'Clinico Geral');

-- --------------------------------------------------------

--
-- Table structure for table `tb_funcionario`
--

CREATE TABLE IF NOT EXISTS `tb_funcionario` (
  `cod_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `cod_funcao` int(11) DEFAULT NULL,
  `cod_cargo` int(11) DEFAULT NULL,
  `cod_pessoa` int(11) DEFAULT NULL,
  `matricula` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_funcionario`),
  KEY `fk_cargo_funcionario` (`cod_cargo`),
  KEY `fk_funcao_funcionario` (`cod_funcao`),
  KEY `fk_funcionario_pessoa2` (`cod_pessoa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tb_funcionario`
--

INSERT INTO `tb_funcionario` (`cod_funcionario`, `cod_funcao`, `cod_cargo`, `cod_pessoa`, `matricula`) VALUES
(3, 1, 2, 7, 123123),
(4, 1, 2, 8, 123123),
(5, 1, 2, 9, 33333),
(6, 1, 1, 11, 123456798);

-- --------------------------------------------------------

--
-- Table structure for table `tb_historico_mensagem`
--

CREATE TABLE IF NOT EXISTS `tb_historico_mensagem` (
  `cod_hist_mens` int(11) NOT NULL AUTO_INCREMENT,
  `dt_mens` datetime NOT NULL,
  `texto_mensagem` varchar(500) NOT NULL,
  PRIMARY KEY (`cod_hist_mens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_login`
--

CREATE TABLE IF NOT EXISTS `tb_login` (
  `cod_login` int(11) NOT NULL AUTO_INCREMENT,
  `cod_perfil` int(11) DEFAULT NULL,
  `nome_login` varchar(50) NOT NULL,
  `senha_login` varchar(255) NOT NULL,
  PRIMARY KEY (`cod_login`),
  KEY `fk_login_perf_login2` (`cod_perfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `tb_login`
--

INSERT INTO `tb_login` (`cod_login`, `cod_perfil`, `nome_login`, `senha_login`) VALUES
(1, 1, 'rosetebsb@gmail.com', '6e1f55f1cb184084ef6794dcaa3964b8'),
(34, 1, 'rafabrun2006@gmail.com', '912ec803b2ce49e4a541068d495ab570'),
(37, 1, 'rafabrun2010', '912ec803b2ce49e4a541068d495ab570'),
(38, 3, 'renata.santana@gmail.com', '202cb962ac59075b964b07152d234b70'),
(39, 3, 'gilmar@gmail.com', '202cb962ac59075b964b07152d234b70'),
(40, 3, 'rosetebsb@gmail.com', '202cb962ac59075b964b07152d234b70'),
(41, 1, 'rosetebsb@gmail.com', '202cb962ac59075b964b07152d234b70'),
(42, 1, 'itgills@gmail.com', '202cb962ac59075b964b07152d234b70'),
(43, 1, 'hebert.hmeso@gmail.com', '202cb962ac59075b964b07152d234b70'),
(44, 1, 'rosetebsb@gmail.com', '202cb962ac59075b964b07152d234b70'),
(45, 1, 'hebert.silva@gmail.com', '202cb962ac59075b964b07152d234b70'),
(46, 1, 'rafabrun2010', '3a9c4af6b787433ede7a9f3b8bec09c5'),
(47, 1, 'rafabrun2011', '912ec803b2ce49e4a541068d495ab570'),
(48, 1, 'rafabrun2012', '5259ee4a034fdeddd1b65be92debe731'),
(49, 1, 'rafabrun2009', '912ec803b2ce49e4a541068d495ab570');

-- --------------------------------------------------------

--
-- Table structure for table `tb_lote`
--

CREATE TABLE IF NOT EXISTS `tb_lote` (
  `cod_lote` int(11) NOT NULL AUTO_INCREMENT,
  `num_lote` int(11) NOT NULL,
  `dt_venc` date NOT NULL,
  `dt_fabric` date NOT NULL,
  PRIMARY KEY (`cod_lote`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tb_lote`
--

INSERT INTO `tb_lote` (`cod_lote`, `num_lote`, `dt_venc`, `dt_fabric`) VALUES
(6, 22, '2013-04-13', '2013-04-13'),
(7, 22, '2013-04-13', '2013-04-13'),
(8, 22, '2013-04-24', '2013-04-03'),
(9, 22, '2013-04-24', '2013-04-03'),
(10, 22, '2013-04-24', '2013-04-03'),
(11, 123, '2013-04-15', '2013-04-14');

-- --------------------------------------------------------

--
-- Table structure for table `tb_lote_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_lote_vacina` (
  `cod_lote` int(11) NOT NULL,
  `cod_lote_vacina` int(11) NOT NULL AUTO_INCREMENT,
  `cod_vacina` int(11) NOT NULL,
  `qtd_vacina` int(11) NOT NULL,
  PRIMARY KEY (`cod_lote_vacina`,`cod_lote`,`cod_vacina`),
  KEY `fk_lote_vacina2` (`cod_vacina`),
  KEY `cod_lote` (`cod_lote`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tb_lote_vacina`
--

INSERT INTO `tb_lote_vacina` (`cod_lote`, `cod_lote_vacina`, `cod_vacina`, `qtd_vacina`) VALUES
(7, 7, 11, 18),
(8, 8, 12, 13),
(9, 9, 13, 13),
(11, 10, 15, 12);

-- --------------------------------------------------------

--
-- Table structure for table `tb_mensagem`
--

CREATE TABLE IF NOT EXISTS `tb_mensagem` (
  `cod_mens` int(11) NOT NULL,
  `texto_mens` text NOT NULL,
  PRIMARY KEY (`cod_mens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_paciente`
--

CREATE TABLE IF NOT EXISTS `tb_paciente` (
  `cod_pac` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pessoa` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_pac`),
  KEY `fk_paciente_pessoa2` (`cod_pessoa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_paciente`
--

INSERT INTO `tb_paciente` (`cod_pac`, `cod_pessoa`) VALUES
(1, 10),
(2, 12),
(3, 13);

-- --------------------------------------------------------

--
-- Table structure for table `tb_paciente_mensagem`
--

CREATE TABLE IF NOT EXISTS `tb_paciente_mensagem` (
  `cod_pac` int(11) NOT NULL AUTO_INCREMENT,
  `cod_mens` int(11) NOT NULL,
  PRIMARY KEY (`cod_pac`,`cod_mens`),
  KEY `fk_paciente_mensagem2` (`cod_mens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_perfil`
--

CREATE TABLE IF NOT EXISTS `tb_perfil` (
  `cod_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `nome_perfil` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_perfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_perfil`
--

INSERT INTO `tb_perfil` (`cod_perfil`, `nome_perfil`) VALUES
(1, 'Administrador'),
(2, 'Funcionário'),
(3, 'Paciente');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pessoa`
--

CREATE TABLE IF NOT EXISTS `tb_pessoa` (
  `cod_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `cod_estado_civil` int(11) DEFAULT NULL,
  `cod_un_saude` int(11) DEFAULT NULL,
  `cod_login` int(11) DEFAULT NULL,
  `cod_cartao_vac` int(11) DEFAULT NULL,
  `cod_end` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `nome_mae` varchar(100) NOT NULL,
  `nome_pai` varchar(100) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `rg` varchar(20) NOT NULL,
  `dt_nasc` date DEFAULT NULL,
  `registro_nasc` varchar(100) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `cod_perfil` int(11) NOT NULL,
  `cod_status` int(11) NOT NULL,
  `telefone_celular` int(11) DEFAULT NULL,
  `telefone_residencial` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_pessoa`),
  KEY `fk_endereco_pessoa` (`cod_end`),
  KEY `fk_login_pessoa2` (`cod_login`),
  KEY `fk_pessoa_cartao_vacina` (`cod_cartao_vac`),
  KEY `fk_pessoa_estado_civil` (`cod_estado_civil`),
  KEY `fk_pessoa_unidade_de_saude` (`cod_un_saude`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `tb_pessoa`
--

INSERT INTO `tb_pessoa` (`cod_pessoa`, `cod_estado_civil`, `cod_un_saude`, `cod_login`, `cod_cartao_vac`, `cod_end`, `nome`, `cpf`, `nome_mae`, `nome_pai`, `sexo`, `rg`, `dt_nasc`, `registro_nasc`, `email`, `cod_perfil`, `cod_status`, `telefone_celular`, `telefone_residencial`) VALUES
(7, 1, 1, 42, NULL, 68, 'Gilmar C. Rodrigues', '1212221111', 'Joana', 'Sinval', 'M', '123123', '1982-09-04', '', 'itgills@gmail.com', 1, 1, NULL, NULL),
(8, 1, 1, 43, NULL, 69, 'Hebert da silva sauro', '', 'fran da silva sauro', 'dino da sauro', 'M', '', '2003-02-13', '', 'hebert.hmeso@gmail.com', 1, 1, NULL, NULL),
(9, 1, 1, 44, NULL, 70, 'Rosete P. Lima', '', 'Fatima', 'Jose', 'M', '', '2005-02-02', '', 'rosetebsb@gmail.com', 1, 1, NULL, NULL),
(10, 1, 1, 46, NULL, 74, 'Dino da Silva Sauro', '222.222.222-22', 'Rossete da Silva Sauro', 'Jonas da Silva Sauro', 'M', '2.222.222', '2013-04-14', '222222222222', 'rafabrun2006@gmail.com', 1, 1, NULL, NULL),
(11, 1, 1, 47, NULL, 76, 'Dino da Silva Sauro', '222.222.222-22', 'Rossete da Silva Sauro', 'Jonas da Silva Sauro', 'M', '2.222.222', '2013-04-15', '123456789', 'rafabrun2006@gmail.com', 1, 1, NULL, NULL),
(12, 1, 1, 48, NULL, 77, 'Rafael Administrador de Sousa Oliveira', '222.222.222-22', 'Rossete da Silva Sauro', 'Jonas da Silva Sauro', 'M', '2.222.222', '2013-04-15', '222222222222', 'rafabrun2006@gmail.com', 1, 1, NULL, NULL),
(13, 1, 1, 49, NULL, 78, 'Rafael Administrador de Sousa Oliveira', '222.222.222-22', 'Rossete da Silva Sauro', 'Jonas da Silva Sauro', 'M', '2.222.222', '2013-04-15', '222222222222', 'rafabrun2006@gmail.com', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_status`
--

CREATE TABLE IF NOT EXISTS `tb_status` (
  `cod_status` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pessoa` int(11) DEFAULT NULL,
  `nome_status` varchar(10) NOT NULL,
  PRIMARY KEY (`cod_status`),
  KEY `fk_status_paciente2` (`cod_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_telefone`
--

CREATE TABLE IF NOT EXISTS `tb_telefone` (
  `cod_tel` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pessoa` int(11) DEFAULT NULL,
  `num_tel` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_tel`),
  KEY `fk_pessoa_telefone` (`cod_pessoa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `tb_telefone`
--

INSERT INTO `tb_telefone` (`cod_tel`, `cod_pessoa`, `num_tel`) VALUES
(9, 7, '95388848'),
(10, 8, '91912345'),
(11, 9, '91357856'),
(12, 10, '(22)2222-2222'),
(13, 10, '(22)2222-2222'),
(14, 10, '(22)2222-2222'),
(15, 10, '(11)1111-1111'),
(16, 10, '(11)1111-1111'),
(17, 11, '(22)2222-2222'),
(18, 12, '(22)2222-2222'),
(19, 12, '(22)2222-2222'),
(20, 13, '(22)2222-2222');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tipo_calendario`
--

CREATE TABLE IF NOT EXISTS `tb_tipo_calendario` (
  `cod_tipo_calend` int(11) NOT NULL AUTO_INCREMENT,
  `cod_calend` int(11) DEFAULT NULL,
  `faixa_etaria` int(11) NOT NULL,
  `nome_calendario` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_tipo_calend`),
  KEY `fk_calendario_vacina_tipo_calendario` (`cod_calend`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tipo_mensagem`
--

CREATE TABLE IF NOT EXISTS `tb_tipo_mensagem` (
  `cod_tipo_mens` int(11) NOT NULL AUTO_INCREMENT,
  `cod_mens` int(11) DEFAULT NULL,
  `tipo_mens` varchar(15) NOT NULL,
  PRIMARY KEY (`cod_tipo_mens`),
  KEY `fk_mensagem_tipo_mensagem` (`cod_mens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tipo_paciente`
--

CREATE TABLE IF NOT EXISTS `tb_tipo_paciente` (
  `cod_tipo_pac` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pac` int(11) NOT NULL,
  `tipo_pac` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_tipo_pac`),
  KEY `fk_tipo_pac_paciente` (`cod_pac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tipo_telefone`
--

CREATE TABLE IF NOT EXISTS `tb_tipo_telefone` (
  `cod_tipo_tel` int(11) NOT NULL AUTO_INCREMENT,
  `cod_tel` int(11) DEFAULT NULL,
  `tipo_tel` varchar(15) NOT NULL,
  PRIMARY KEY (`cod_tipo_tel`),
  KEY `fk_telefone_tipo_telefone` (`cod_tel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_uf`
--

CREATE TABLE IF NOT EXISTS `tb_uf` (
  `cod_uf` int(11) NOT NULL AUTO_INCREMENT,
  `sigla_uf` char(2) NOT NULL,
  `nome_uf` varchar(100) NOT NULL,
  PRIMARY KEY (`cod_uf`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `tb_uf`
--

INSERT INTO `tb_uf` (`cod_uf`, `sigla_uf`, `nome_uf`) VALUES
(1, 'AC', 'Acre'),
(2, 'AL', 'Alagoas'),
(3, 'AP', 'Amapá'),
(4, 'AM', 'Amazonas'),
(5, 'BA', 'Bahia'),
(6, 'CE', 'Ceará'),
(7, 'DF', 'Distrito Federal'),
(8, 'ES', 'Espirito Santo'),
(9, 'GO', 'Goiás'),
(10, 'MA', 'Maranhão'),
(11, 'MS', 'Mato Grosso do Sul'),
(12, 'MT', 'Mato Grosso'),
(13, 'MG', 'Minas Gerais'),
(14, 'PA', 'Pará'),
(15, 'PB', 'Paraíba'),
(16, 'PR', 'Paraná'),
(17, 'PE', 'Pernambuco'),
(18, 'PI', 'Piauí'),
(19, 'RJ', 'Rio de Janeiro');

-- --------------------------------------------------------

--
-- Table structure for table `tb_unidade_saude`
--

CREATE TABLE IF NOT EXISTS `tb_unidade_saude` (
  `cod_un_saude` int(11) NOT NULL AUTO_INCREMENT,
  `cod_end` int(11) DEFAULT NULL,
  `nome_un_saude` varchar(30) NOT NULL,
  `num_un_saude` int(11) NOT NULL,
  PRIMARY KEY (`cod_un_saude`),
  KEY `fk_unidade_saude_endereco` (`cod_end`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_unidade_saude`
--

INSERT INTO `tb_unidade_saude` (`cod_un_saude`, `cod_end`, `nome_un_saude`, `num_un_saude`) VALUES
(1, 72, 'Centro de Saude', 1),
(2, 73, 'Postinho Paraisopolis', 1234),
(3, 75, 'Postinho Paraisopolis', 1234);

-- --------------------------------------------------------

--
-- Table structure for table `tb_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_vacina` (
  `cod_vacina` int(11) NOT NULL AUTO_INCREMENT,
  `nome_vacina` varchar(60) NOT NULL,
  PRIMARY KEY (`cod_vacina`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `tb_vacina`
--

INSERT INTO `tb_vacina` (`cod_vacina`, `nome_vacina`) VALUES
(10, 'Benegrip'),
(12, 'Benegrip'),
(13, 'BCG'),
(14, 'Poliomielite Benus'),
(15, 'BCG');

-- --------------------------------------------------------

--
-- Table structure for table `tb_vacina_fabricante`
--

CREATE TABLE IF NOT EXISTS `tb_vacina_fabricante` (
  `cod_vacina` int(11) NOT NULL,
  `cod_fabric` int(11) NOT NULL,
  `cod_vacina_fabricante` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cod_vacina_fabricante`),
  KEY `fk_vacina_fabricante2` (`cod_fabric`),
  KEY `cod_vacina` (`cod_vacina`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tb_vacina_fabricante`
--

INSERT INTO `tb_vacina_fabricante` (`cod_vacina`, `cod_fabric`, `cod_vacina_fabricante`) VALUES
(10, 6, 2),
(12, 8, 8),
(13, 9, 9),
(14, 10, 10),
(15, 11, 11);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_cartao_vacina`
--
ALTER TABLE `tb_cartao_vacina`
  ADD CONSTRAINT `fk_unidade_saude_cartao_vacina` FOREIGN KEY (`cod_un_saude`) REFERENCES `tb_unidade_saude` (`cod_un_saude`);

--
-- Constraints for table `tb_cidade`
--
ALTER TABLE `tb_cidade`
  ADD CONSTRAINT `fk_uf_cidade` FOREIGN KEY (`cod_uf`) REFERENCES `tb_uf` (`cod_uf`);

--
-- Constraints for table `tb_vacina_fabricante`
--
ALTER TABLE `tb_vacina_fabricante`
  ADD CONSTRAINT `tb_vacina_fabricante_ibfk_1` FOREIGN KEY (`cod_fabric`) REFERENCES `tb_fabricante` (`cod_fabric`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_vacina_fabricante_ibfk_2` FOREIGN KEY (`cod_vacina`) REFERENCES `tb_vacina` (`cod_vacina`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
