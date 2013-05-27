-- phpMyAdmin SQL Dump
-- version 4.0.0-beta2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 25, 2013 at 04:28 PM
-- Server version: 5.1.50-community
-- PHP Version: 5.3.9-ZS5.6.0

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
-- Table structure for table `bak_tb_dose_vacina`
--

CREATE TABLE IF NOT EXISTS `bak_tb_dose_vacina` (
  `cod_dose` int(11) NOT NULL AUTO_INCREMENT,
  `cod_vacina` int(11) DEFAULT NULL,
  `dose` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod_dose`),
  KEY `fk_vacina_dose_vacina` (`cod_vacina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tb_campanha`
--

INSERT INTO `tb_campanha` (`cod_camp`, `nome_camp`, `dt_inicial_camp`, `dt_final_camp`, `dt_public_camp`) VALUES
(1, 'Campanha Nacional de Vacinação', '2013-05-24', '2013-05-27', '2013-02-20'),
(2, 'Campanha Nacional de Vacinação contra aPoliomilite.', '2013-08-23', '2013-08-23', '2013-05-20');

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
  `cod_cartao_vacina` int(11) NOT NULL AUTO_INCREMENT,
  `cod_un_saude` int(11) DEFAULT NULL,
  `dt_vacina` date NOT NULL,
  `cod_grupo_vacina` int(11) NOT NULL,
  `dose` int(11) NOT NULL,
  `cod_vacina` int(11) NOT NULL,
  `cod_pessoa` int(11) NOT NULL,
  `cod_situacao_vacina` int(11) NOT NULL,
  `cod_tipo_cartao` int(11) NOT NULL,
  PRIMARY KEY (`cod_cartao_vacina`),
  KEY `fk_unidade_saude_cartao_vacina` (`cod_un_saude`),
  KEY `cod_grupo_vacina` (`cod_grupo_vacina`),
  KEY `cod_situacao_vacina` (`cod_situacao_vacina`),
  KEY `cod_pessoa` (`cod_pessoa`),
  KEY `cod_vacina` (`cod_vacina`),
  KEY `cod_tipo_cartao` (`cod_tipo_cartao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `tb_cartao_vacina`
--

INSERT INTO `tb_cartao_vacina` (`cod_cartao_vacina`, `cod_un_saude`, `dt_vacina`, `cod_grupo_vacina`, `dose`, `cod_vacina`, `cod_pessoa`, `cod_situacao_vacina`, `cod_tipo_cartao`) VALUES
(50, 1, '2013-07-05', 2, 2, 2, 26, 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10273 ;

--
-- Dumping data for table `tb_cidade`
--

INSERT INTO `tb_cidade` (`cod_cid`, `cod_uf`, `nome_cid`) VALUES
(1, 12, 'Águas claras'),
(2, 12, 'Areal'),
(3, 12, 'Braslândia'),
(5, 12, 'Brasilinha'),
(6, 12, 'Ceilândia'),
(7, 12, 'Candangolandia'),
(8, 12, 'Cruzeiro'),
(9, 12, 'Cidade Ocidental'),
(10, 9, 'Céu Azul'),
(13, 12, 'Gama'),
(14, 9, 'Jardim Ingá'),
(15, 12, 'Jardim Botanico'),
(16, 9, 'Luziânia'),
(17, 12, 'Lago Sul'),
(18, 12, 'Lago Norte'),
(19, 9, 'Lago Azul'),
(20, 12, 'Núcleo Bandeirante'),
(21, 9, 'Novo Gama'),
(22, 12, 'Paranoá'),
(23, 9, 'Pedregal'),
(24, 12, 'Planaltina'),
(25, 9, 'Planaltina de Goiás'),
(26, 12, 'Recanto das Emas'),
(27, 12, 'Riacho Fundo I'),
(28, 12, 'Riacho Fundo II'),
(29, 12, 'Santa Maria'),
(30, 9, 'Paranoá'),
(31, 12, 'Samambaia'),
(32, 12, 'Sobradinho'),
(33, 12, 'São Sebastião'),
(34, 4, 'Santa Maria'),
(35, 4, 'Santo Antônio do Descoberto'),
(36, 12, 'Sudoeste'),
(37, 12, 'Varjão'),
(38, 1, 'Anapólis');

-- --------------------------------------------------------

--
-- Table structure for table `tb_doenca`
--

CREATE TABLE IF NOT EXISTS `tb_doenca` (
  `cod_doenca` int(11) NOT NULL AUTO_INCREMENT,
  `cod_vac` int(11) DEFAULT NULL,
  `cod_calend` int(11) DEFAULT NULL,
  `doenca_evitada` text NOT NULL,
  PRIMARY KEY (`cod_doenca`),
  KEY `fk_calendario_vacina_doenca` (`cod_calend`),
  KEY `fk_vacina_doenca` (`cod_vac`)
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
  `numero` varchar(11) DEFAULT NULL,
  `complemento` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`cod_end`),
  KEY `fk_endereco_cidade` (`cod_cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `tb_endereco`
--

INSERT INTO `tb_endereco` (`cod_end`, `cod_cid`, `endereco`, `cep`, `bairro`, `numero`, `complemento`) VALUES
(13, 10248, 'quadra 17 casa', '72.000-000', '', '', ''),
(24, 10254, 'QBR 06 BL A apt', '72.593-091', 'Res. Santos Dumont', '34', ''),
(25, 10249, 'Q 09 conj 5 casa', '72.889-000', '', '20', ''),
(26, 10263, 'aksjdka akw2 2', '73.331-000', 'kajsdkajs', '34', 'kasdkj aksjd'),
(27, 10246, 'asdkjaskd slakdj', '73.333-111', 'akjsdkjaksdj', '45', 'kdjksfkj'),
(28, 10254, 'Q 316 conj 10 casa', '72.590-000', '', '29', ''),
(29, 5, 'sdfsdfasf', '', '', '2343243', ''),
(30, 2228, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_estado_civil`
--

CREATE TABLE IF NOT EXISTS `tb_estado_civil` (
  `cod_estado_civil` int(11) NOT NULL AUTO_INCREMENT,
  `nome_estado_civil` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cod_estado_civil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tb_estado_civil`
--

INSERT INTO `tb_estado_civil` (`cod_estado_civil`, `nome_estado_civil`) VALUES
(1, 'Solteiro'),
(2, 'Casado'),
(3, 'Viúvo'),
(4, 'Outros');

-- --------------------------------------------------------

--
-- Table structure for table `tb_fabricante`
--

CREATE TABLE IF NOT EXISTS `tb_fabricante` (
  `cod_fabric` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fabric` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_fabric`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tb_fabricante`
--

INSERT INTO `tb_fabricante` (`cod_fabric`, `nome_fabric`) VALUES
(1, 'Sanofi Aventis Ltda'),
(2, 'GlaxoSmithKline Brasil Ltda'),
(3, 'Merck Sharp & Dohme'),
(4, 'Fundação Ataulpho de Paiva'),
(5, ' Baxter Hospital Ltda'),
(6, 'Abbott Laboratórios do Brasil Ltda');

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

--
-- Dumping data for table `tb_fale_conosco`
--

INSERT INTO `tb_fale_conosco` (`cod_fale`, `conteudo_texto`, `nome_fale_conosco`, `email_fale_conosco`) VALUES
(1, 'Quando será realizada a campanha de vacinaçao contra vacina hepatite B', 'Eduardo', 'eduardo.edu@gmail.com'),
(2, 'Desejo saber a proxima campanha contra gripe.', 'Jaqueline Andrade', 'jaque@hotmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tb_funcao`
--

CREATE TABLE IF NOT EXISTS `tb_funcao` (
  `cod_funcao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_funcao` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_funcao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_funcao`
--

INSERT INTO `tb_funcao` (`cod_funcao`, `nome_funcao`) VALUES
(1, 'Médico '),
(2, 'Enfermeiro '),
(3, 'Técn. em Enfermagem');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `tb_funcionario`
--

INSERT INTO `tb_funcionario` (`cod_funcionario`, `cod_funcao`, `cod_cargo`, `cod_pessoa`, `matricula`) VALUES
(11, 1, 1, 22, 1122),
(12, 2, NULL, 23, 1234),
(13, 1, NULL, 25, 9283928),
(14, 1, NULL, 28, 999);

-- --------------------------------------------------------

--
-- Table structure for table `tb_grupo_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_grupo_vacina` (
  `cod_grupo_vacina` int(11) NOT NULL AUTO_INCREMENT,
  `nome_grupo_vacina` varchar(13) NOT NULL,
  PRIMARY KEY (`cod_grupo_vacina`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_grupo_vacina`
--

INSERT INTO `tb_grupo_vacina` (`cod_grupo_vacina`, `nome_grupo_vacina`) VALUES
(1, 'Regular'),
(2, 'Campanha'),
(3, 'Outras');

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
-- Table structure for table `tb_log`
--

CREATE TABLE IF NOT EXISTS `tb_log` (
  `cod_log` int(11) NOT NULL AUTO_INCREMENT,
  `hora_log` time DEFAULT NULL,
  `IP` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cod_log`)
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `tb_login`
--

INSERT INTO `tb_login` (`cod_login`, `cod_perfil`, `nome_login`, `senha_login`) VALUES
(1, 1, 'rosetebsb@gmail.com', 'ODQ0NDE2'),
(24, 1, 'rosete', 'MTkxNTIy'),
(25, 3, 'wermans', 'NDE4MTQzMTk5MzM='),
(27, 3, 'jonas', 'MDEwMTAxMDEwMQ=='),
(28, 3, 'yuri', 'ODk1NDQ0MTM2MTI=');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_lote`
--

INSERT INTO `tb_lote` (`cod_lote`, `num_lote`, `dt_venc`, `dt_fabric`) VALUES
(1, 1, '2013-08-07', '2009-03-01'),
(2, 2, '2013-05-16', '2006-06-15'),
(3, 1, '2015-12-03', '1969-12-31');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_lote_vacina`
--

INSERT INTO `tb_lote_vacina` (`cod_lote`, `cod_lote_vacina`, `cod_vacina`, `qtd_vacina`) VALUES
(1, 1, 2, 200),
(2, 2, 3, 234),
(3, 3, 5, 14782);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `tb_paciente`
--

INSERT INTO `tb_paciente` (`cod_pac`, `cod_pessoa`) VALUES
(21, 24),
(22, 26),
(23, 27);

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
  `cod_status` varchar(11) NOT NULL,
  `telefone_celular` varchar(20) DEFAULT NULL,
  `telefone_residencial` varchar(20) DEFAULT NULL,
  `cod_sit` int(11) DEFAULT '1',
  PRIMARY KEY (`cod_pessoa`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `fk_endereco_pessoa` (`cod_end`),
  KEY `fk_login_pessoa2` (`cod_login`),
  KEY `fk_pessoa_cartao_vacina` (`cod_cartao_vac`),
  KEY `fk_pessoa_estado_civil` (`cod_estado_civil`),
  KEY `fk_pessoa_unidade_de_saude` (`cod_un_saude`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `tb_pessoa`
--

INSERT INTO `tb_pessoa` (`cod_pessoa`, `cod_estado_civil`, `cod_un_saude`, `cod_login`, `cod_cartao_vac`, `cod_end`, `nome`, `cpf`, `nome_mae`, `nome_pai`, `sexo`, `rg`, `dt_nasc`, `registro_nasc`, `email`, `cod_perfil`, `cod_status`, `telefone_celular`, `telefone_residencial`, `cod_sit`) VALUES
(12, 1, 1, 13, NULL, 13, 'Rosete P. de Lima', '213910876666', 'Fatima', 'Jose', 'F', '', '1978-02-02', '', 'rosetebsb@gmail.com', 1, '1', '(61)8138-6241', '(61)3394-7869', 1),
(23, 1, 1, 24, NULL, 24, 'Rosete Lima', '838.321.491-04', 'asd', 'asdf', 'F', '1654 ', '1979-02-02', '', 'rosetebsb@gmail.com', 1, '1', '(61)9135-7856', '(61)3394-9864', 1),
(24, 1, 1, 25, NULL, 25, 'Wermans ', '034.773.301-88', 'asdf', 'asdf', 'F', '', '1990-01-10', '', 'wermansg@gmail.com', 3, '1', '(61)8888-8888', '(61)9999-9999', 0),
(25, 1, 1, 26, NULL, 26, 'wermans', '833.238.666-73', 'ddddjjjj dnd', ' dksjdsk skdjsk', 'M', '81273812', '1969-12-31', '123123123123123124', 'wermans@hotmail.com', 1, '1', '(61)9182-9381', '(61)9812-9839', 1),
(26, 1, 1, 27, NULL, 27, 'jonas', '888.256.714-15', 'kajsdkja askdjkasjd', 'askdjaks kajdskj', 'M', '00495', '1988-02-03', '2223423423', 'jo@hotmail.com', 3, '1', '(62)2132-1232', '(61)9222-2222', 1),
(27, 1, 1, 28, NULL, 28, 'Yuri da Silva', '523.889.678-64', 'adf', 'asdf', 'M', '786544', '1998-01-03', '', 'yuri.silva@gmail.com', 3, '1', '(61)8678-7655', '(61)9926-7783', 1),
(28, 1, 1, 29, NULL, 29, 'Rogério Spindula', '766.923.611-68', 'asdfsadfaf', 'asfasdf', 'M', 'dfds12323', '2013-05-07', 'asdfasd', '', 2, '1', '(61)8141-9777', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_situacao_registro`
--

CREATE TABLE IF NOT EXISTS `tb_situacao_registro` (
  `cod_sit_registro` int(11) NOT NULL AUTO_INCREMENT,
  `reg_situacao` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_sit_registro`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_situacao_registro`
--

INSERT INTO `tb_situacao_registro` (`cod_sit_registro`, `reg_situacao`) VALUES
(1, 'Ativo'),
(2, 'Excluido');

-- --------------------------------------------------------

--
-- Table structure for table `tb_situacao_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_situacao_vacina` (
  `cod_situacao_vacina` int(11) NOT NULL AUTO_INCREMENT,
  `nome_situacao` varchar(100) NOT NULL,
  PRIMARY KEY (`cod_situacao_vacina`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tb_situacao_vacina`
--

INSERT INTO `tb_situacao_vacina` (`cod_situacao_vacina`, `nome_situacao`) VALUES
(1, 'Aplicada'),
(2, 'Aprazada');

-- --------------------------------------------------------

--
-- Table structure for table `tb_status`
--

CREATE TABLE IF NOT EXISTS `tb_status` (
  `cod_status` int(11) NOT NULL AUTO_INCREMENT,
  `nome_status` varchar(10) NOT NULL,
  PRIMARY KEY (`cod_status`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tb_status`
--

INSERT INTO `tb_status` (`cod_status`, `nome_status`) VALUES
(0, 'Inativo'),
(1, 'Ativo');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tipo_calendario`
--

CREATE TABLE IF NOT EXISTS `tb_tipo_calendario` (
  `cod_tipo_calend` int(11) NOT NULL AUTO_INCREMENT,
  `nome_calendario` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_tipo_calend`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tipo_cartao`
--

CREATE TABLE IF NOT EXISTS `tb_tipo_cartao` (
  `cod_tipo_cartao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tipo_cartao` varchar(100) NOT NULL,
  PRIMARY KEY (`cod_tipo_cartao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tb_tipo_cartao`
--

INSERT INTO `tb_tipo_cartao` (`cod_tipo_cartao`, `nome_tipo_cartao`) VALUES
(1, 'Criança'),
(2, 'Adolescente'),
(3, 'Adulto'),
(4, 'Idoso');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

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
(19, 'RJ', 'Rio de Janeiro'),
(20, 'RN', 'Rio Grande do Norte'),
(21, 'RO', 'Rondonia'),
(22, 'RR', 'Roraima'),
(23, 'RS', 'Rio Grande do Sul'),
(24, 'SC', 'Santa Catarina'),
(25, 'SE', 'Sergipe'),
(26, 'SP', 'São Paulo'),
(27, 'TO', 'Tocantins');

-- --------------------------------------------------------

--
-- Table structure for table `tb_unidade_saude`
--

CREATE TABLE IF NOT EXISTS `tb_unidade_saude` (
  `cod_un_saude` int(11) NOT NULL AUTO_INCREMENT,
  `cod_end` int(11) DEFAULT NULL,
  `num_tel` varchar(20) NOT NULL,
  `nome_un_saude` varchar(30) NOT NULL,
  `num_un_saude` int(11) NOT NULL,
  PRIMARY KEY (`cod_un_saude`),
  KEY `fk_unidade_saude_endereco` (`cod_end`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tb_unidade_saude`
--

INSERT INTO `tb_unidade_saude` (`cod_un_saude`, `cod_end`, `num_tel`, `nome_un_saude`, `num_un_saude`) VALUES
(1, 12, '61 3394-4517', 'Centro de Saúde nº 01', 1),
(7, 30, '(11)1111-1111', 'teste', 111);

-- --------------------------------------------------------

--
-- Table structure for table `tb_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_vacina` (
  `cod_vacina` int(11) NOT NULL AUTO_INCREMENT,
  `nome_vacina` varchar(60) NOT NULL,
  PRIMARY KEY (`cod_vacina`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tb_vacina`
--

INSERT INTO `tb_vacina` (`cod_vacina`, `nome_vacina`) VALUES
(1, 'BCG'),
(2, 'BCG'),
(3, 'BCG'),
(4, 'Tiplice Viral'),
(5, 'Tiplice Viral');

-- --------------------------------------------------------

--
-- Table structure for table `tb_vacina_aplicada`
--

CREATE TABLE IF NOT EXISTS `tb_vacina_aplicada` (
  `cod_vacina_aplicada` int(11) NOT NULL AUTO_INCREMENT,
  `lote` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  `cod_cartao_vacina` int(11) NOT NULL,
  `cod_campanha` int(11) NOT NULL,
  PRIMARY KEY (`cod_vacina_aplicada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `tb_vacina_fabricante`
--

INSERT INTO `tb_vacina_fabricante` (`cod_vacina`, `cod_fabric`, `cod_vacina_fabricante`) VALUES
(2, 1, 28),
(3, 2, 29),
(5, 2, 30);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_cartao_vacina`
--
ALTER TABLE `tb_cartao_vacina`
  ADD CONSTRAINT `tb_cartao_vacina_ibfk_2` FOREIGN KEY (`cod_un_saude`) REFERENCES `tb_unidade_saude` (`cod_un_saude`),
  ADD CONSTRAINT `tb_cartao_vacina_ibfk_3` FOREIGN KEY (`cod_grupo_vacina`) REFERENCES `tb_grupo_vacina` (`cod_grupo_vacina`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_cartao_vacina_ibfk_4` FOREIGN KEY (`cod_pessoa`) REFERENCES `tb_pessoa` (`cod_pessoa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_cartao_vacina_ibfk_5` FOREIGN KEY (`cod_situacao_vacina`) REFERENCES `tb_situacao_vacina` (`cod_situacao_vacina`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_cartao_vacina_ibfk_6` FOREIGN KEY (`cod_vacina`) REFERENCES `tb_vacina` (`cod_vacina`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_cartao_vacina_ibfk_7` FOREIGN KEY (`cod_tipo_cartao`) REFERENCES `tb_tipo_cartao` (`cod_tipo_cartao`);

--
-- Constraints for table `tb_cidade`
--
ALTER TABLE `tb_cidade`
  ADD CONSTRAINT `fk_uf_cidade` FOREIGN KEY (`cod_uf`) REFERENCES `tb_uf` (`cod_uf`);

--
-- Constraints for table `tb_lote_vacina`
--
ALTER TABLE `tb_lote_vacina`
  ADD CONSTRAINT `tb_lote_vacina_ibfk_1` FOREIGN KEY (`cod_lote`) REFERENCES `tb_lote` (`cod_lote`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_lote_vacina_ibfk_2` FOREIGN KEY (`cod_vacina`) REFERENCES `tb_vacina` (`cod_vacina`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_pessoa`
--
ALTER TABLE `tb_pessoa`
  ADD CONSTRAINT `fk_endereco_cod` FOREIGN KEY (`cod_end`) REFERENCES `tb_endereco` (`cod_end`);

--
-- Constraints for table `tb_vacina_fabricante`
--
ALTER TABLE `tb_vacina_fabricante`
  ADD CONSTRAINT `tb_vacina_fabricante_ibfk_1` FOREIGN KEY (`cod_fabric`) REFERENCES `tb_fabricante` (`cod_fabric`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_vacina_fabricante_ibfk_2` FOREIGN KEY (`cod_vacina`) REFERENCES `tb_vacina` (`cod_vacina`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
