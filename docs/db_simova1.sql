-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Mar 11, 2013 as 12:07 AM
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
-- Estrutura da tabela `lote_vacina`
--

CREATE TABLE IF NOT EXISTS `lote_vacina` (
  `cod_lote` int(11) NOT NULL AUTO_INCREMENT,
  `cod_vac` int(11) NOT NULL,
  PRIMARY KEY (`cod_lote`,`cod_vac`),
  KEY `fk_lote_vacina2` (`cod_vac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `lote_vacina`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente_mensagem`
--

CREATE TABLE IF NOT EXISTS `paciente_mensagem` (
  `cod_pac` int(11) NOT NULL AUTO_INCREMENT,
  `cod_mens` int(11) NOT NULL,
  PRIMARY KEY (`cod_pac`,`cod_mens`),
  KEY `fk_paciente_mensagem2` (`cod_mens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `paciente_mensagem`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_banner`
--

CREATE TABLE IF NOT EXISTS `tb_banner` (
  `cod_banner` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` int(11) NOT NULL,
  `foto` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_banner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_banner`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_calendario_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_calendario_vacina` (
  `cod_calend` int(11) NOT NULL AUTO_INCREMENT,
  `dt_public_calend` date NOT NULL,
  `nome_calend` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_calend`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_calendario_vacina`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_campanha`
--

CREATE TABLE IF NOT EXISTS `tb_campanha` (
  `cod_camp` int(11) NOT NULL AUTO_INCREMENT,
  `nome_camp` varchar(100) NOT NULL,
  `dt_inicial_camp` date NOT NULL,
  `dt_final_camp` date NOT NULL,
  `dt_public_camp` date NOT NULL,
  PRIMARY KEY (`cod_camp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_campanha`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cargo`
--

CREATE TABLE IF NOT EXISTS `tb_cargo` (
  `cod_cargo` int(11) NOT NULL,
  `nome_cargo` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_cargo`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cartao_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_cartao_vacina` (
  `cod_cartao_vac` int(11) NOT NULL AUTO_INCREMENT,
  `cod_un_saude` int(11) DEFAULT NULL,
  `dt_vac_aplicada` date NOT NULL,
  `dt_aprazada` date NOT NULL,
  PRIMARY KEY (`cod_cartao_vac`),
  KEY `fk_unidade_saude_cartao_vacina` (`cod_un_saude`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_cartao_vacina`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cidade`
--

CREATE TABLE IF NOT EXISTS `tb_cidade` (
  `cod_cid` int(11) NOT NULL AUTO_INCREMENT,
  `cod_uf` int(11) NOT NULL,
  `nome_cid` varchar(35) NOT NULL,
  PRIMARY KEY (`cod_cid`),
  KEY `fk_uf_cidade` (`cod_uf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_cidade`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_doenca`
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

--
-- Extraindo dados da tabela `tb_doenca`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_dose_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_dose_vacina` (
  `cod_dose` int(11) NOT NULL AUTO_INCREMENT,
  `cod_vac` int(11) DEFAULT NULL,
  `dose` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod_dose`),
  KEY `fk_vacina_dose_vacina` (`cod_vac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_dose_vacina`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_endereco`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_endereco`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_estado_civil`
--

CREATE TABLE IF NOT EXISTS `tb_estado_civil` (
  `cod_estado_civil` int(11) NOT NULL AUTO_INCREMENT,
  `nome_estado_civil` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cod_estado_civil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_estado_civil`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_fabricante`
--

CREATE TABLE IF NOT EXISTS `tb_fabricante` (
  `cod_fabric` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fabric` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_fabric`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_fabricante`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcao`
--

CREATE TABLE IF NOT EXISTS `tb_funcao` (
  `cod_funcao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_funcao` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_funcao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_funcao`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcionario`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_funcionario`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_historico_mensagem`
--

CREATE TABLE IF NOT EXISTS `tb_historico_mensagem` (
  `cod_hist_mens` int(11) NOT NULL AUTO_INCREMENT,
  `dt_mens` datetime NOT NULL,
  `texto_mensagem` varchar(500) NOT NULL,
  PRIMARY KEY (`cod_hist_mens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_historico_mensagem`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_login`
--

CREATE TABLE IF NOT EXISTS `tb_login` (
  `cod_login` int(11) NOT NULL AUTO_INCREMENT,
  `cod_perfil` int(11) DEFAULT NULL,
  `cod_pessoa` int(11) DEFAULT NULL,
  `nome_login` varchar(50) NOT NULL,
  `senha_login` varchar(10) NOT NULL,
  PRIMARY KEY (`cod_login`),
  KEY `fk_login_perf_login2` (`cod_perfil`),
  KEY `fk_login_pessoa` (`cod_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_login`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_lote`
--

CREATE TABLE IF NOT EXISTS `tb_lote` (
  `cod_lote` int(11) NOT NULL AUTO_INCREMENT,
  `num_lote` int(11) NOT NULL,
  `dt_venc` date NOT NULL,
  `dt_fabric` date NOT NULL,
  PRIMARY KEY (`cod_lote`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_lote`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_mensagem`
--

CREATE TABLE IF NOT EXISTS `tb_mensagem` (
  `cod_mens` int(11) NOT NULL,
  `texto_mens` text NOT NULL,
  PRIMARY KEY (`cod_mens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_mensagem`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_paciente`
--

CREATE TABLE IF NOT EXISTS `tb_paciente` (
  `cod_pac` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pessoa` int(11) DEFAULT NULL,
  `cod_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_pac`),
  KEY `fk_paciente_pessoa2` (`cod_pessoa`),
  KEY `fk_status_paciente` (`cod_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_paciente`
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


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pessoa`
--

CREATE TABLE IF NOT EXISTS `tb_pessoa` (
  `cod_pessoa` int(11) NOT NULL,
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
  PRIMARY KEY (`cod_pessoa`),
  KEY `fk_endereco_pessoa` (`cod_end`),
  KEY `fk_login_pessoa2` (`cod_login`),
  KEY `fk_pessoa_cartao_vacina` (`cod_cartao_vac`),
  KEY `fk_pessoa_estado_civil` (`cod_estado_civil`),
  KEY `fk_pessoa_unidade_de_saude` (`cod_un_saude`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_pessoa`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_status`
--

CREATE TABLE IF NOT EXISTS `tb_status` (
  `cod_status` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pac` int(11) DEFAULT NULL,
  `nome_status` varchar(10) NOT NULL,
  PRIMARY KEY (`cod_status`),
  KEY `fk_status_paciente2` (`cod_pac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_status`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_telefone`
--

CREATE TABLE IF NOT EXISTS `tb_telefone` (
  `cod_tel` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pessoa` int(11) DEFAULT NULL,
  `num_tel` int(11) NOT NULL,
  PRIMARY KEY (`cod_tel`),
  KEY `fk_pessoa_telefone` (`cod_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_telefone`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_calendario`
--

CREATE TABLE IF NOT EXISTS `tb_tipo_calendario` (
  `cod_tipo_calend` int(11) NOT NULL AUTO_INCREMENT,
  `cod_calend` int(11) DEFAULT NULL,
  `faixa_etaria` int(11) NOT NULL,
  `nome_calendario` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_tipo_calend`),
  KEY `fk_calendario_vacina_tipo_calendario` (`cod_calend`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_tipo_calendario`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_mensagem`
--

CREATE TABLE IF NOT EXISTS `tb_tipo_mensagem` (
  `cod_tipo_mens` int(11) NOT NULL AUTO_INCREMENT,
  `cod_mens` int(11) DEFAULT NULL,
  `tipo_mens` varchar(15) NOT NULL,
  PRIMARY KEY (`cod_tipo_mens`),
  KEY `fk_mensagem_tipo_mensagem` (`cod_mens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_tipo_mensagem`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_paciente`
--

CREATE TABLE IF NOT EXISTS `tb_tipo_paciente` (
  `cod_tipo_pac` int(11) NOT NULL AUTO_INCREMENT,
  `cod_pac` int(11) NOT NULL,
  `tipo_pac` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_tipo_pac`),
  KEY `fk_tipo_pac_paciente` (`cod_pac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_tipo_paciente`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_telefone`
--

CREATE TABLE IF NOT EXISTS `tb_tipo_telefone` (
  `cod_tipo_tel` int(11) NOT NULL AUTO_INCREMENT,
  `cod_tel` int(11) DEFAULT NULL,
  `tipo_tel` varchar(15) NOT NULL,
  PRIMARY KEY (`cod_tipo_tel`),
  KEY `fk_telefone_tipo_telefone` (`cod_tel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_tipo_telefone`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_uf`
--

CREATE TABLE IF NOT EXISTS `tb_uf` (
  `cod_uf` int(11) NOT NULL AUTO_INCREMENT,
  `sigla_uf` char(2) NOT NULL,
  PRIMARY KEY (`cod_uf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_uf`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_unidade_saude`
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

--
-- Extraindo dados da tabela `tb_unidade_saude`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_vacina`
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

--
-- Extraindo dados da tabela `tb_vacina`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `vacina_fabricante`
--

CREATE TABLE IF NOT EXISTS `vacina_fabricante` (
  `cod_vac` int(11) NOT NULL AUTO_INCREMENT,
  `cod_fabric` int(11) NOT NULL,
  PRIMARY KEY (`cod_vac`,`cod_fabric`),
  KEY `fk_vacina_fabricante2` (`cod_fabric`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `vacina_fabricante`
--


--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `lote_vacina`
--
ALTER TABLE `lote_vacina`
  ADD CONSTRAINT `fk_lote_vacina2` FOREIGN KEY (`cod_vac`) REFERENCES `tb_vacina` (`cod_vac`),
  ADD CONSTRAINT `fk_lote_vacina` FOREIGN KEY (`cod_lote`) REFERENCES `tb_lote` (`cod_lote`);

--
-- Restrições para a tabela `paciente_mensagem`
--
ALTER TABLE `paciente_mensagem`
  ADD CONSTRAINT `fk_paciente_mensagem2` FOREIGN KEY (`cod_mens`) REFERENCES `tb_mensagem` (`cod_mens`),
  ADD CONSTRAINT `fk_paciente_mensagem` FOREIGN KEY (`cod_pac`) REFERENCES `tb_paciente` (`cod_pac`);

--
-- Restrições para a tabela `tb_cartao_vacina`
--
ALTER TABLE `tb_cartao_vacina`
  ADD CONSTRAINT `fk_unidade_saude_cartao_vacina` FOREIGN KEY (`cod_un_saude`) REFERENCES `tb_unidade_saude` (`cod_un_saude`);

--
-- Restrições para a tabela `tb_cidade`
--
ALTER TABLE `tb_cidade`
  ADD CONSTRAINT `fk_uf_cidade` FOREIGN KEY (`cod_uf`) REFERENCES `tb_uf` (`cod_uf`);

--
-- Restrições para a tabela `tb_doenca`
--
ALTER TABLE `tb_doenca`
  ADD CONSTRAINT `fk_vacina_doenca` FOREIGN KEY (`cod_vac`) REFERENCES `tb_vacina` (`cod_vac`),
  ADD CONSTRAINT `fk_calendario_vacina_doenca` FOREIGN KEY (`cod_calend`) REFERENCES `tb_calendario_vacina` (`cod_calend`);

--
-- Restrições para a tabela `tb_dose_vacina`
--
ALTER TABLE `tb_dose_vacina`
  ADD CONSTRAINT `fk_vacina_dose_vacina` FOREIGN KEY (`cod_vac`) REFERENCES `tb_vacina` (`cod_vac`);

--
-- Restrições para a tabela `tb_endereco`
--
ALTER TABLE `tb_endereco`
  ADD CONSTRAINT `fk_unidade_saude_endereco2` FOREIGN KEY (`cod_un_saude`) REFERENCES `tb_unidade_saude` (`cod_un_saude`),
  ADD CONSTRAINT `fk_endereco_cidade` FOREIGN KEY (`cod_cid`) REFERENCES `tb_cidade` (`cod_cid`);

--
-- Restrições para a tabela `tb_funcionario`
--
ALTER TABLE `tb_funcionario`
  ADD CONSTRAINT `fk_funcionario_pessoa2` FOREIGN KEY (`cod_pessoa`) REFERENCES `tb_pessoa` (`cod_pessoa`),
  ADD CONSTRAINT `fk_cargo_funcionario` FOREIGN KEY (`cod_cargo`) REFERENCES `tb_cargo` (`cod_cargo`),
  ADD CONSTRAINT `fk_funcao_funcionario` FOREIGN KEY (`cod_funcao`) REFERENCES `tb_funcao` (`cod_funcao`);

--
-- Restrições para a tabela `tb_login`
--
ALTER TABLE `tb_login`
  ADD CONSTRAINT `fk_login_pessoa` FOREIGN KEY (`cod_pessoa`) REFERENCES `tb_pessoa` (`cod_pessoa`),
  ADD CONSTRAINT `fk_login_perf_login2` FOREIGN KEY (`cod_perfil`) REFERENCES `tb_perfil` (`cod_peril`);

--
-- Restrições para a tabela `tb_paciente`
--
ALTER TABLE `tb_paciente`
  ADD CONSTRAINT `fk_status_paciente` FOREIGN KEY (`cod_status`) REFERENCES `tb_status` (`cod_status`),
  ADD CONSTRAINT `fk_paciente_pessoa2` FOREIGN KEY (`cod_pessoa`) REFERENCES `tb_pessoa` (`cod_pessoa`);

--
-- Restrições para a tabela `tb_perfil`
--
ALTER TABLE `tb_perfil`
  ADD CONSTRAINT `fk_login_perf_login` FOREIGN KEY (`cod_login`) REFERENCES `tb_login` (`cod_login`);

--
-- Restrições para a tabela `tb_pessoa`
--
ALTER TABLE `tb_pessoa`
  ADD CONSTRAINT `fk_pessoa_unidade_de_saude` FOREIGN KEY (`cod_un_saude`) REFERENCES `tb_unidade_saude` (`cod_un_saude`),
  ADD CONSTRAINT `fk_endereco_pessoa` FOREIGN KEY (`cod_end`) REFERENCES `tb_endereco` (`cod_end`),
  ADD CONSTRAINT `fk_funcionario_pessoa` FOREIGN KEY (`cod_pessoa`) REFERENCES `tb_funcionario` (`cod_funcionario`),
  ADD CONSTRAINT `fk_login_pessoa2` FOREIGN KEY (`cod_login`) REFERENCES `tb_login` (`cod_login`),
  ADD CONSTRAINT `fk_paciente_pessoa` FOREIGN KEY (`cod_pessoa`) REFERENCES `tb_paciente` (`cod_pac`),
  ADD CONSTRAINT `fk_pessoa_cartao_vacina` FOREIGN KEY (`cod_cartao_vac`) REFERENCES `tb_cartao_vacina` (`cod_cartao_vac`),
  ADD CONSTRAINT `fk_pessoa_estado_civil` FOREIGN KEY (`cod_estado_civil`) REFERENCES `tb_estado_civil` (`cod_estado_civil`);

--
-- Restrições para a tabela `tb_status`
--
ALTER TABLE `tb_status`
  ADD CONSTRAINT `fk_status_paciente2` FOREIGN KEY (`cod_pac`) REFERENCES `tb_paciente` (`cod_pac`);

--
-- Restrições para a tabela `tb_telefone`
--
ALTER TABLE `tb_telefone`
  ADD CONSTRAINT `fk_pessoa_telefone` FOREIGN KEY (`cod_pessoa`) REFERENCES `tb_pessoa` (`cod_pessoa`);

--
-- Restrições para a tabela `tb_tipo_calendario`
--
ALTER TABLE `tb_tipo_calendario`
  ADD CONSTRAINT `fk_calendario_vacina_tipo_calendario` FOREIGN KEY (`cod_calend`) REFERENCES `tb_calendario_vacina` (`cod_calend`);

--
-- Restrições para a tabela `tb_tipo_mensagem`
--
ALTER TABLE `tb_tipo_mensagem`
  ADD CONSTRAINT `fk_mensagem_tipo_mensagem` FOREIGN KEY (`cod_mens`) REFERENCES `tb_mensagem` (`cod_mens`);

--
-- Restrições para a tabela `tb_tipo_paciente`
--
ALTER TABLE `tb_tipo_paciente`
  ADD CONSTRAINT `fk_tipo_pac_paciente` FOREIGN KEY (`cod_pac`) REFERENCES `tb_paciente` (`cod_pac`);

--
-- Restrições para a tabela `tb_tipo_telefone`
--
ALTER TABLE `tb_tipo_telefone`
  ADD CONSTRAINT `fk_telefone_tipo_telefone` FOREIGN KEY (`cod_tel`) REFERENCES `tb_telefone` (`cod_tel`);

--
-- Restrições para a tabela `tb_unidade_saude`
--
ALTER TABLE `tb_unidade_saude`
  ADD CONSTRAINT `fk_unidade_saude_endereco` FOREIGN KEY (`cod_end`) REFERENCES `tb_endereco` (`cod_end`),
  ADD CONSTRAINT `fk_pessoa_unidade_de_saude2` FOREIGN KEY (`cod_pessoa`) REFERENCES `tb_pessoa` (`cod_pessoa`);

--
-- Restrições para a tabela `tb_vacina`
--
ALTER TABLE `tb_vacina`
  ADD CONSTRAINT `fk_relationship_27` FOREIGN KEY (`cod_camp`) REFERENCES `tb_campanha` (`cod_camp`),
  ADD CONSTRAINT `fk_calendario_vacina_vacina` FOREIGN KEY (`cod_calend`) REFERENCES `tb_calendario_vacina` (`cod_calend`),
  ADD CONSTRAINT `fk_cartao_vacina_vacina` FOREIGN KEY (`cod_cartao_vac`) REFERENCES `tb_cartao_vacina` (`cod_cartao_vac`);

--
-- Restrições para a tabela `vacina_fabricante`
--
ALTER TABLE `vacina_fabricante`
  ADD CONSTRAINT `fk_vacina_fabricante2` FOREIGN KEY (`cod_fabric`) REFERENCES `tb_fabricante` (`cod_fabric`),
  ADD CONSTRAINT `fk_vacina_fabricante` FOREIGN KEY (`cod_vac`) REFERENCES `tb_vacina` (`cod_vac`);
