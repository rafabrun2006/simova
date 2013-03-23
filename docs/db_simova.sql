-- phpMyAdmin SQL Dump
-- version 4.0.0-beta2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 18, 2013 at 10:51 PM
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
-- Table structure for table `lote_vacina`
--

CREATE TABLE IF NOT EXISTS `lote_vacina` (
  `cod_lote` int(11) NOT NULL AUTO_INCREMENT,
  `cod_vac` int(11) NOT NULL,
  PRIMARY KEY (`cod_lote`,`cod_vac`),
  KEY `fk_lote_vacina2` (`cod_vac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paciente_mensagem`
--

CREATE TABLE IF NOT EXISTS `paciente_mensagem` (
  `cod_pac` int(11) NOT NULL AUTO_INCREMENT,
  `cod_mens` int(11) NOT NULL,
  PRIMARY KEY (`cod_pac`,`cod_mens`),
  KEY `fk_paciente_mensagem2` (`cod_mens`)
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
  `nome_doenca` varchar(20) NOT NULL,
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
  `cod_un_saude` int(11) DEFAULT NULL,
  `endereco` varchar(100) NOT NULL,
  `cep` int(11) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`cod_end`),
  KEY `fk_endereco_cidade` (`cod_cid`),
  KEY `fk_unidade_saude_endereco2` (`cod_un_saude`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `tb_endereco`
--

INSERT INTO `tb_endereco` (`cod_end`, `cod_cid`, `cod_un_saude`, `endereco`, `cep`, `bairro`, `numero`, `complemento`) VALUES
(6, NULL, NULL, 'Quadra 10', 0, '', NULL, NULL),
(29, 2, NULL, 'Quadra 10', 11111111, 'Pedregal', 2, 'igreja evangelica');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_funcionario`
--

INSERT INTO `tb_funcionario` (`cod_funcionario`, `cod_funcao`, `cod_cargo`, `cod_pessoa`, `matricula`) VALUES
(3, 1, 1, 9, 1111111);

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
  `senha_login` varchar(10) NOT NULL,
  PRIMARY KEY (`cod_login`),
  KEY `fk_login_perf_login2` (`cod_perfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tb_login`
--

INSERT INTO `tb_login` (`cod_login`, `cod_perfil`, `nome_login`, `senha_login`) VALUES
(2, 1, 'rafabrun2006@gmail.com', 'asdf'),
(7, 1, 'rafabrun2006', 'asdf');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `cod_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_pac`),
  KEY `fk_paciente_pessoa2` (`cod_pessoa`),
  KEY `fk_status_paciente` (`cod_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_perfil`
--

CREATE TABLE IF NOT EXISTS `tb_perfil` (
  `cod_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `nome_perfil` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_perfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tb_perfil`
--

INSERT INTO `tb_perfil` (`cod_perfil`, `nome_perfil`) VALUES
(1, 'Administrador');

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
  PRIMARY KEY (`cod_pessoa`),
  KEY `fk_endereco_pessoa` (`cod_end`),
  KEY `fk_login_pessoa2` (`cod_login`),
  KEY `fk_pessoa_cartao_vacina` (`cod_cartao_vac`),
  KEY `fk_pessoa_estado_civil` (`cod_estado_civil`),
  KEY `fk_pessoa_unidade_de_saude` (`cod_un_saude`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tb_pessoa`
--

INSERT INTO `tb_pessoa` (`cod_pessoa`, `cod_estado_civil`, `cod_un_saude`, `cod_login`, `cod_cartao_vac`, `cod_end`, `nome`, `cpf`, `nome_mae`, `nome_pai`, `sexo`, `rg`, `dt_nasc`, `registro_nasc`, `email`, `cod_perfil`, `cod_status`) VALUES
(1, 1, NULL, NULL, NULL, 6, 'Rafael Bruno', '8888888', 'Antonia Celma', 'Nao declarado', 'M', '8888888', '0000-00-00', NULL, '', 1, 0),
(9, 1, NULL, NULL, NULL, 29, 'Rafael Bruno', '99999999', 'Antonia Celma', 'Nao declarado', 'M', '99999999', '1969-12-31', '1234', 'rafabrun2006@gmail.com', 1, 1);

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
  `num_tel` int(11) NOT NULL,
  PRIMARY KEY (`cod_tel`),
  KEY `fk_pessoa_telefone` (`cod_pessoa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tb_telefone`
--

INSERT INTO `tb_telefone` (`cod_tel`, `cod_pessoa`, `num_tel`) VALUES
(5, 9, 88888888);

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
  `cod_pessoa` int(11) DEFAULT NULL,
  `cod_end` int(11) DEFAULT NULL,
  `nome_un_saude` varchar(30) NOT NULL,
  `num_un_saude` int(11) NOT NULL,
  PRIMARY KEY (`cod_un_saude`),
  KEY `fk_pessoa_unidade_de_saude2` (`cod_pessoa`),
  KEY `fk_unidade_saude_endereco` (`cod_end`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_vacina` (
  `cod_vac` int(11) NOT NULL AUTO_INCREMENT,
  `cod_calend` int(11) DEFAULT NULL,
  `cod_camp` int(11) DEFAULT NULL,
  `cod_cartao_vac` int(11) DEFAULT NULL,
  `nome_vac` varchar(60) NOT NULL,
  PRIMARY KEY (`cod_vac`),
  KEY `fk_calendario_vacina_vacina` (`cod_calend`),
  KEY `fk_cartao_vacina_vacina` (`cod_cartao_vac`),
  KEY `fk_relationship_27` (`cod_camp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vacina_fabricante`
--

CREATE TABLE IF NOT EXISTS `vacina_fabricante` (
  `cod_vac` int(11) NOT NULL AUTO_INCREMENT,
  `cod_fabric` int(11) NOT NULL,
  PRIMARY KEY (`cod_vac`,`cod_fabric`),
  KEY `fk_vacina_fabricante2` (`cod_fabric`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lote_vacina`
--
ALTER TABLE `lote_vacina`
  ADD CONSTRAINT `fk_lote_vacina` FOREIGN KEY (`cod_lote`) REFERENCES `tb_lote` (`cod_lote`),
  ADD CONSTRAINT `fk_lote_vacina2` FOREIGN KEY (`cod_vac`) REFERENCES `tb_vacina` (`cod_vac`);

--
-- Constraints for table `paciente_mensagem`
--
ALTER TABLE `paciente_mensagem`
  ADD CONSTRAINT `fk_paciente_mensagem` FOREIGN KEY (`cod_pac`) REFERENCES `tb_paciente` (`cod_pac`),
  ADD CONSTRAINT `fk_paciente_mensagem2` FOREIGN KEY (`cod_mens`) REFERENCES `tb_mensagem` (`cod_mens`);

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
-- Constraints for table `tb_doenca`
--
ALTER TABLE `tb_doenca`
  ADD CONSTRAINT `fk_calendario_vacina_doenca` FOREIGN KEY (`cod_calend`) REFERENCES `tb_calendario_vacina` (`cod_calend`),
  ADD CONSTRAINT `fk_vacina_doenca` FOREIGN KEY (`cod_vac`) REFERENCES `tb_vacina` (`cod_vac`);

--
-- Constraints for table `tb_dose_vacina`
--
ALTER TABLE `tb_dose_vacina`
  ADD CONSTRAINT `fk_vacina_dose_vacina` FOREIGN KEY (`cod_vac`) REFERENCES `tb_vacina` (`cod_vac`);

--
-- Constraints for table `tb_endereco`
--
ALTER TABLE `tb_endereco`
  ADD CONSTRAINT `fk_endereco_cidade` FOREIGN KEY (`cod_cid`) REFERENCES `tb_cidade` (`cod_cid`),
  ADD CONSTRAINT `fk_unidade_saude_endereco2` FOREIGN KEY (`cod_un_saude`) REFERENCES `tb_unidade_saude` (`cod_un_saude`);

--
-- Constraints for table `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  ADD CONSTRAINT `fk_cargo_funcionario` FOREIGN KEY (`cod_cargo`) REFERENCES `tb_cargo` (`cod_cargo`),
  ADD CONSTRAINT `fk_funcao_funcionario` FOREIGN KEY (`cod_funcao`) REFERENCES `tb_funcao` (`cod_funcao`),
  ADD CONSTRAINT `fk_funcionario_pessoa2` FOREIGN KEY (`cod_pessoa`) REFERENCES `tb_pessoa` (`cod_pessoa`);

--
-- Constraints for table `tb_login`
--
ALTER TABLE `tb_login`
  ADD CONSTRAINT `tb_login_ibfk_1` FOREIGN KEY (`cod_perfil`) REFERENCES `tb_perfil` (`cod_perfil`);

--
-- Constraints for table `tb_paciente`
--
ALTER TABLE `tb_paciente`
  ADD CONSTRAINT `fk_paciente_pessoa2` FOREIGN KEY (`cod_pessoa`) REFERENCES `tb_pessoa` (`cod_pessoa`),
  ADD CONSTRAINT `fk_status_paciente` FOREIGN KEY (`cod_status`) REFERENCES `tb_status` (`cod_status`);

--
-- Constraints for table `tb_pessoa`
--
ALTER TABLE `tb_pessoa`
  ADD CONSTRAINT `tb_pessoa_ibfk_10` FOREIGN KEY (`cod_end`) REFERENCES `tb_endereco` (`cod_end`),
  ADD CONSTRAINT `tb_pessoa_ibfk_6` FOREIGN KEY (`cod_estado_civil`) REFERENCES `tb_estado_civil` (`cod_estado_civil`),
  ADD CONSTRAINT `tb_pessoa_ibfk_7` FOREIGN KEY (`cod_un_saude`) REFERENCES `tb_unidade_saude` (`cod_un_saude`),
  ADD CONSTRAINT `tb_pessoa_ibfk_8` FOREIGN KEY (`cod_login`) REFERENCES `tb_login` (`cod_login`),
  ADD CONSTRAINT `tb_pessoa_ibfk_9` FOREIGN KEY (`cod_cartao_vac`) REFERENCES `tb_cartao_vacina` (`cod_cartao_vac`);

--
-- Constraints for table `tb_status`
--
ALTER TABLE `tb_status`
  ADD CONSTRAINT `fk_pessoa_cod` FOREIGN KEY (`cod_pessoa`) REFERENCES `tb_pessoa` (`cod_pessoa`);

--
-- Constraints for table `tb_telefone`
--
ALTER TABLE `tb_telefone`
  ADD CONSTRAINT `fk_pessoa_telefone` FOREIGN KEY (`cod_pessoa`) REFERENCES `tb_pessoa` (`cod_pessoa`);

--
-- Constraints for table `tb_tipo_calendario`
--
ALTER TABLE `tb_tipo_calendario`
  ADD CONSTRAINT `fk_calendario_vacina_tipo_calendario` FOREIGN KEY (`cod_calend`) REFERENCES `tb_calendario_vacina` (`cod_calend`);

--
-- Constraints for table `tb_tipo_mensagem`
--
ALTER TABLE `tb_tipo_mensagem`
  ADD CONSTRAINT `fk_mensagem_tipo_mensagem` FOREIGN KEY (`cod_mens`) REFERENCES `tb_mensagem` (`cod_mens`);

--
-- Constraints for table `tb_tipo_paciente`
--
ALTER TABLE `tb_tipo_paciente`
  ADD CONSTRAINT `fk_tipo_pac_paciente` FOREIGN KEY (`cod_pac`) REFERENCES `tb_paciente` (`cod_pac`);

--
-- Constraints for table `tb_tipo_telefone`
--
ALTER TABLE `tb_tipo_telefone`
  ADD CONSTRAINT `fk_telefone_tipo_telefone` FOREIGN KEY (`cod_tel`) REFERENCES `tb_telefone` (`cod_tel`);

--
-- Constraints for table `tb_unidade_saude`
--
ALTER TABLE `tb_unidade_saude`
  ADD CONSTRAINT `fk_pessoa_unidade_de_saude2` FOREIGN KEY (`cod_pessoa`) REFERENCES `tb_pessoa` (`cod_pessoa`),
  ADD CONSTRAINT `fk_unidade_saude_endereco` FOREIGN KEY (`cod_end`) REFERENCES `tb_endereco` (`cod_end`);

--
-- Constraints for table `tb_vacina`
--
ALTER TABLE `tb_vacina`
  ADD CONSTRAINT `fk_calendario_vacina_vacina` FOREIGN KEY (`cod_calend`) REFERENCES `tb_calendario_vacina` (`cod_calend`),
  ADD CONSTRAINT `fk_cartao_vacina_vacina` FOREIGN KEY (`cod_cartao_vac`) REFERENCES `tb_cartao_vacina` (`cod_cartao_vac`),
  ADD CONSTRAINT `fk_relationship_27` FOREIGN KEY (`cod_camp`) REFERENCES `tb_campanha` (`cod_camp`);

--
-- Constraints for table `vacina_fabricante`
--
ALTER TABLE `vacina_fabricante`
  ADD CONSTRAINT `fk_vacina_fabricante` FOREIGN KEY (`cod_vac`) REFERENCES `tb_vacina` (`cod_vac`),
  ADD CONSTRAINT `fk_vacina_fabricante2` FOREIGN KEY (`cod_fabric`) REFERENCES `tb_fabricante` (`cod_fabric`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
