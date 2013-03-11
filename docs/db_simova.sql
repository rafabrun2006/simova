-- phpMyAdmin SQL Dump
-- version 3.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 11/03/2013 às 01h45min
-- Versão do Servidor: 5.5.29
-- Versão do PHP: 5.4.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `db_simova`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Banner`
--

CREATE TABLE IF NOT EXISTS `TB_Banner` (
  `Cod_Banner` int(11) NOT NULL AUTO_INCREMENT,
  `Ativo` int(11) NOT NULL,
  `foto` varchar(45) NOT NULL,
  `Nome_banner` varchar(20) NOT NULL,
  PRIMARY KEY (`Cod_Banner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Calendario_Vacina`
--

CREATE TABLE IF NOT EXISTS `TB_Calendario_Vacina` (
  `Cod_Calend` int(11) NOT NULL AUTO_INCREMENT,
  `Data_Public_Calend` date NOT NULL,
  PRIMARY KEY (`Cod_Calend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Campanha`
--

CREATE TABLE IF NOT EXISTS `TB_Campanha` (
  `Cod_Camp` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Camp` varchar(100) NOT NULL,
  `Dt_Inicial_Camp` date NOT NULL,
  `Dt_Final_Camp` date NOT NULL,
  `Data_Public_Camp` date NOT NULL,
  PRIMARY KEY (`Cod_Camp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Cargo`
--

CREATE TABLE IF NOT EXISTS `TB_Cargo` (
  `Cod_Cargo` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Cargo` varchar(20) NOT NULL,
  PRIMARY KEY (`Cod_Cargo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `TB_Cargo`
--

INSERT INTO `TB_Cargo` (`Cod_Cargo`, `Nome_Cargo`) VALUES
(1, 'Médico'),
(2, 'Enfermeiro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Cartao_Vacina`
--

CREATE TABLE IF NOT EXISTS `TB_Cartao_Vacina` (
  `Cod_Cartao_Vac` int(11) NOT NULL AUTO_INCREMENT,
  `Dt_Vac_Aplicada` date NOT NULL,
  `Dt_Aprazada` date NOT NULL,
  `TB_Unidade_Saude_Cod_Un_Saude` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Cartao_Vac`),
  KEY `fk_TB_Cartao_Vacina_TB_Unidade_Saude1` (`TB_Unidade_Saude_Cod_Un_Saude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Cidade`
--

CREATE TABLE IF NOT EXISTS `TB_Cidade` (
  `Cod_Cid` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Cid` varchar(35) NOT NULL,
  `TB_UF_Cod_UF` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Cid`),
  KEY `fk_TB_Cidade_TB_UF1` (`TB_UF_Cod_UF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Doenca`
--

CREATE TABLE IF NOT EXISTS `TB_Doenca` (
  `Cod_Doenca` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Doenca` varchar(20) NOT NULL,
  `Descricao_Doenca` text NOT NULL,
  `Doenca_Evitada` text NOT NULL,
  `TB_Vacina_Cod_Vac` int(11) NOT NULL,
  `TB_Calendario_Vac_Cod_Calend` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Doenca`),
  KEY `fk_Doença_Vacina1_idx` (`TB_Vacina_Cod_Vac`),
  KEY `fk_Doença_Calendario_Vacina1_idx` (`TB_Calendario_Vac_Cod_Calend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Dose_Vacina`
--

CREATE TABLE IF NOT EXISTS `TB_Dose_Vacina` (
  `Cod_Dose` int(11) NOT NULL AUTO_INCREMENT,
  `Dose` varchar(10) NOT NULL,
  `TB_Vacina_Cod_Vac` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Dose`),
  KEY `fk_Dose_vacina_Vacina1_idx` (`TB_Vacina_Cod_Vac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Endereco`
--

CREATE TABLE IF NOT EXISTS `TB_Endereco` (
  `Cod_End` int(11) NOT NULL AUTO_INCREMENT,
  `Endereco` varchar(100) NOT NULL,
  `Cep` int(11) NOT NULL,
  `Bairro` varchar(45) NOT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Complemento` varchar(60) DEFAULT NULL,
  `TB_Cidade_Cod_Cid` int(11) NOT NULL,
  PRIMARY KEY (`Cod_End`),
  KEY `fk_TB_Endereco_TB_Cidade1` (`TB_Cidade_Cod_Cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Estado_Civil`
--

CREATE TABLE IF NOT EXISTS `TB_Estado_Civil` (
  `Cod_Estado_Civil` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Estado_Civil` varchar(20) NOT NULL,
  PRIMARY KEY (`Cod_Estado_Civil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Fabricante`
--

CREATE TABLE IF NOT EXISTS `TB_Fabricante` (
  `Cod_Fabric` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Fabric` varchar(30) NOT NULL,
  PRIMARY KEY (`Cod_Fabric`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Funcao`
--

CREATE TABLE IF NOT EXISTS `TB_Funcao` (
  `Cod_Funcao` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Funcao` varchar(20) NOT NULL,
  PRIMARY KEY (`Cod_Funcao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Funcionario`
--

CREATE TABLE IF NOT EXISTS `TB_Funcionario` (
  `Cod_Funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `Mat` int(11) NOT NULL,
  `TB_Status_Cod_Status` int(11) NOT NULL,
  `TB_Funcao_Cod_Funcao` int(11) NOT NULL,
  `TB_Lotacao_Cod_Lotaca` int(11) NOT NULL,
  `TB_Cargo_Cod_Cargo` int(11) NOT NULL,
  `TB_Pessoa_Cod_Pessoa` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Funcionario`),
  KEY `fk_TB_Funcionario_TB_Status1` (`TB_Status_Cod_Status`),
  KEY `fk_TB_Funcionario_TB_Funcao1` (`TB_Funcao_Cod_Funcao`),
  KEY `fk_TB_Funcionario_TB_Lotacao1` (`TB_Lotacao_Cod_Lotaca`),
  KEY `fk_TB_Funcionario_TB_Cargo1` (`TB_Cargo_Cod_Cargo`),
  KEY `fk_TB_Funcionario_TB_Pessoa1` (`TB_Pessoa_Cod_Pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Historico_Mensagem`
--

CREATE TABLE IF NOT EXISTS `TB_Historico_Mensagem` (
  `Cod_Hist_Mens` int(11) NOT NULL AUTO_INCREMENT,
  `Dt_Mens` datetime NOT NULL,
  `Mens` text NOT NULL,
  PRIMARY KEY (`Cod_Hist_Mens`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Login`
--

CREATE TABLE IF NOT EXISTS `TB_Login` (
  `Cod_Login` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Log` varchar(50) NOT NULL,
  `Senha_Log` varchar(10) NOT NULL,
  `TB_Pessoa_Cod_Pessoa` int(11) NOT NULL,
  `TB_Perfil_Cod_Perfil` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Login`),
  KEY `fk_TB_Login_TB_Pessoa1` (`TB_Pessoa_Cod_Pessoa`),
  KEY `fk_TB_Login_TB_Perfil1` (`TB_Perfil_Cod_Perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Lotacao`
--

CREATE TABLE IF NOT EXISTS `TB_Lotacao` (
  `Cod_Lotaca` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Lotacao` varchar(20) NOT NULL,
  PRIMARY KEY (`Cod_Lotaca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Lote`
--

CREATE TABLE IF NOT EXISTS `TB_Lote` (
  `Cod_Lote` int(11) NOT NULL AUTO_INCREMENT,
  `Num_Lote` int(11) NOT NULL,
  `Dt_Venc` date NOT NULL,
  `Dt_Fabric` date NOT NULL,
  PRIMARY KEY (`Cod_Lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Lote_has_TB_Vacina`
--

CREATE TABLE IF NOT EXISTS `TB_Lote_has_TB_Vacina` (
  `TB_Lote_Cod_Lote` int(11) NOT NULL AUTO_INCREMENT,
  `TB_Vacina_Cod_Vac` int(11) NOT NULL,
  PRIMARY KEY (`TB_Lote_Cod_Lote`,`TB_Vacina_Cod_Vac`),
  KEY `fk_TB_Lote_has_TB_Vacina_TB_Lote1_idx` (`TB_Lote_Cod_Lote`),
  KEY `fk_TB_Lote_has_TB_Vacina_TB_Vacina1_idx` (`TB_Vacina_Cod_Vac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Lote_Vacina`
--

CREATE TABLE IF NOT EXISTS `TB_Lote_Vacina` (
  `COD_LOTE` int(11) NOT NULL AUTO_INCREMENT,
  `COD_VAC` int(11) NOT NULL,
  PRIMARY KEY (`COD_LOTE`,`COD_VAC`),
  KEY `FK_LOTE_VACINA2` (`COD_VAC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Mensagem`
--

CREATE TABLE IF NOT EXISTS `TB_Mensagem` (
  `Cod_Mens` int(11) NOT NULL AUTO_INCREMENT,
  `Texto_Mens` text NOT NULL,
  PRIMARY KEY (`Cod_Mens`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Paciente`
--

CREATE TABLE IF NOT EXISTS `TB_Paciente` (
  `Cod_Pac` int(11) NOT NULL AUTO_INCREMENT,
  `TB_Pessoa_Cod_Pessoa` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Pac`),
  KEY `fk_TB_Paciente_TB_Pessoa` (`TB_Pessoa_Cod_Pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Paciente_has_TB_Mensagem`
--

CREATE TABLE IF NOT EXISTS `TB_Paciente_has_TB_Mensagem` (
  `TB_Paciente_Cod_Pac` int(11) NOT NULL AUTO_INCREMENT,
  `TB_Mensagem_Cod_Mens` int(11) NOT NULL,
  PRIMARY KEY (`TB_Paciente_Cod_Pac`,`TB_Mensagem_Cod_Mens`),
  KEY `fk_TB_Paciente_has_TB_Mensagem_TB_Paciente1_idx` (`TB_Paciente_Cod_Pac`),
  KEY `fk_TB_Paciente_has_TB_Mensagem_TB_Mensagem1_idx` (`TB_Mensagem_Cod_Mens`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Paciente_Mensagem`
--

CREATE TABLE IF NOT EXISTS `TB_Paciente_Mensagem` (
  `COD_PAC` int(11) NOT NULL AUTO_INCREMENT,
  `COD_MENS` int(11) NOT NULL,
  PRIMARY KEY (`COD_PAC`,`COD_MENS`),
  KEY `FK_PACIENTE_MENSAGEM2` (`COD_MENS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Perfil`
--

CREATE TABLE IF NOT EXISTS `TB_Perfil` (
  `Cod_Perfil` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Perfil` varchar(15) NOT NULL,
  PRIMARY KEY (`Cod_Perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Pessoa`
--

CREATE TABLE IF NOT EXISTS `TB_Pessoa` (
  `Cod_Pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `CPF` varchar(14) DEFAULT NULL,
  `Nome_Mae` varchar(100) NOT NULL,
  `Nome_Pai` varchar(100) DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `RG` varchar(20) DEFAULT NULL,
  `Dt_nasc` date NOT NULL,
  `Registro` varchar(100) DEFAULT NULL,
  `TB_Endereco_Cod_End` int(11) NOT NULL,
  `TB_Unidade_Saude_Cod_Un_Saude` int(11) NOT NULL,
  `TB_Cartao_Vacina_Cod_Cartao_Vac` int(11) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Estado Civil_Cod_Estado_Civil` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Pessoa`),
  KEY `fk_TB_Pessoa_TB_Endereco1` (`TB_Endereco_Cod_End`),
  KEY `fk_TB_Pessoa_TB_Unidade_Saude1` (`TB_Unidade_Saude_Cod_Un_Saude`),
  KEY `fk_TB_Pessoa_TB_Cartao_Vacina1` (`TB_Cartao_Vacina_Cod_Cartao_Vac`),
  KEY `fk_TB_Pessoa_Estado Civil1` (`Estado Civil_Cod_Estado_Civil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_Ssatus`
--

CREATE TABLE IF NOT EXISTS `tb_Ssatus` (
  `Cod_Status` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Status` varchar(10) NOT NULL,
  `TB_Paciente_Cod_Pac` int(11) NOT NULL,
  `TB_Funcionario_Cod_Funcionario` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Status`),
  KEY `fk_Status_TB_Paciente1_idx` (`TB_Paciente_Cod_Pac`),
  KEY `fk_TB_Status_TB_Funcionario1` (`TB_Funcionario_Cod_Funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Telefone`
--

CREATE TABLE IF NOT EXISTS `TB_Telefone` (
  `Cod_Tel` int(11) NOT NULL AUTO_INCREMENT,
  `Num_Tel` int(11) NOT NULL,
  `TB_Pessoa_Cod_Pessoa` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Tel`),
  KEY `fk_TB_Telefone_TB_Pessoa1` (`TB_Pessoa_Cod_Pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Tipo_Calendario`
--

CREATE TABLE IF NOT EXISTS `TB_Tipo_Calendario` (
  `Cod_Tipo_Calend` int(11) NOT NULL AUTO_INCREMENT,
  `Faixa_Etaria` int(11) NOT NULL,
  `Nome_Calend` varchar(45) NOT NULL,
  `TB_Calendario_Vacina_Cod_Calend` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Tipo_Calend`),
  KEY `fk_TB_Tipo_Calendario_TB_Calendario_Vacina1` (`TB_Calendario_Vacina_Cod_Calend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Tipo_Mensagem`
--

CREATE TABLE IF NOT EXISTS `TB_Tipo_Mensagem` (
  `Cod_Tipo_Mens` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_Mens` text,
  `TB_Mensagem_Cod_Mens` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Tipo_Mens`),
  KEY `fk_TB_Tipo_Mensagem_TB_Mensagem1` (`TB_Mensagem_Cod_Mens`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Tipo_Paciente`
--

CREATE TABLE IF NOT EXISTS `TB_Tipo_Paciente` (
  `Cod_Tipo_Pac` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_Pac` varchar(15) NOT NULL,
  `TB_Paciente_Cod_Pac` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Tipo_Pac`),
  KEY `fk_TB_Tipo_Paciente_TB_Paciente1` (`TB_Paciente_Cod_Pac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Tipo_Telefone`
--

CREATE TABLE IF NOT EXISTS `TB_Tipo_Telefone` (
  `Cod_Tipo_Tel` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_Tel` varchar(15) NOT NULL,
  `TB_Telefone_Cod_Tel` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Tipo_Tel`),
  KEY `fk_TB_Tipo_Telefone_TB_Telefone1` (`TB_Telefone_Cod_Tel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Tpo_Telefone`
--

CREATE TABLE IF NOT EXISTS `TB_Tpo_Telefone` (
  `COD_TIPO_TEL` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO_TEL` varchar(15) NOT NULL,
  PRIMARY KEY (`COD_TIPO_TEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_UF`
--

CREATE TABLE IF NOT EXISTS `TB_UF` (
  `Cod_UF` int(11) NOT NULL AUTO_INCREMENT,
  `Sigla_UF` varchar(2) NOT NULL,
  `Nome_UF` varchar(45) NOT NULL,
  PRIMARY KEY (`Cod_UF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Unidade_Saude`
--

CREATE TABLE IF NOT EXISTS `TB_Unidade_Saude` (
  `Cod_Un_Saude` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Un_Saude` varchar(30) NOT NULL,
  `Num_Un_Saude` int(11) NOT NULL,
  `TB_Endereco_Cod_End` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Un_Saude`),
  KEY `fk_TB_Unidade_Saude_TB_Endereco1` (`TB_Endereco_Cod_End`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Vacina`
--

CREATE TABLE IF NOT EXISTS `TB_Vacina` (
  `Cod_Vac` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Vac` varchar(60) NOT NULL,
  `TB_Cartao_Vacina_Cod_Cartao_Vac` int(11) NOT NULL,
  `TB_Campanha_Cod_Camp` int(11) NOT NULL,
  `TB_Calendario_Vac_Cod_Calend` int(11) NOT NULL,
  PRIMARY KEY (`Cod_Vac`),
  KEY `fk_Vacina_Cartao_Vacina1_idx` (`TB_Cartao_Vacina_Cod_Cartao_Vac`),
  KEY `fk_Vacina_Campanha1_idx` (`TB_Campanha_Cod_Camp`),
  KEY `fk_Vacina_Calendario_Vacina1_idx` (`TB_Calendario_Vac_Cod_Calend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Vacina_Fabricante`
--

CREATE TABLE IF NOT EXISTS `TB_Vacina_Fabricante` (
  `COD_VAC` int(11) NOT NULL AUTO_INCREMENT,
  `COD_FABRIC` int(11) NOT NULL,
  PRIMARY KEY (`COD_VAC`,`COD_FABRIC`),
  KEY `FK_VACINA_FABRICANTE2` (`COD_FABRIC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `TB_Vacina_has_TB_Fabricante`
--

CREATE TABLE IF NOT EXISTS `TB_Vacina_has_TB_Fabricante` (
  `TB_Vacina_Cod_Vac` int(11) NOT NULL AUTO_INCREMENT,
  `TB_Fabricante_Cod_Fabric` int(11) NOT NULL,
  PRIMARY KEY (`TB_Vacina_Cod_Vac`,`TB_Fabricante_Cod_Fabric`),
  KEY `fk_TB_Vacina_has_TB_Fabricante_TB_Vacina1` (`TB_Vacina_Cod_Vac`),
  KEY `fk_TB_Vacina_has_TB_Fabricante_TB_Fabricante1` (`TB_Fabricante_Cod_Fabric`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `TB_Cartao_Vacina`
--
ALTER TABLE `TB_Cartao_Vacina`
  ADD CONSTRAINT `fk_TB_Cartao_Vacina_TB_Unidade_Saude1` FOREIGN KEY (`TB_Unidade_Saude_Cod_Un_Saude`) REFERENCES `TB_Unidade_Saude` (`Cod_Un_Saude`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Cidade`
--
ALTER TABLE `TB_Cidade`
  ADD CONSTRAINT `fk_TB_Cidade_TB_UF1` FOREIGN KEY (`TB_UF_Cod_UF`) REFERENCES `TB_UF` (`Cod_UF`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Doenca`
--
ALTER TABLE `TB_Doenca`
  ADD CONSTRAINT `fk_Doença_Vacina1` FOREIGN KEY (`TB_Vacina_Cod_Vac`) REFERENCES `TB_Vacina` (`Cod_Vac`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Doença_Calendario_Vacina1` FOREIGN KEY (`TB_Calendario_Vac_Cod_Calend`) REFERENCES `TB_Calendario_Vacina` (`Cod_Calend`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Dose_Vacina`
--
ALTER TABLE `TB_Dose_Vacina`
  ADD CONSTRAINT `fk_Dose_vacina_Vacina1` FOREIGN KEY (`TB_Vacina_Cod_Vac`) REFERENCES `TB_Vacina` (`Cod_Vac`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Endereco`
--
ALTER TABLE `TB_Endereco`
  ADD CONSTRAINT `fk_TB_Endereco_TB_Cidade1` FOREIGN KEY (`TB_Cidade_Cod_Cid`) REFERENCES `TB_Cidade` (`Cod_Cid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Funcionario`
--
ALTER TABLE `TB_Funcionario`
  ADD CONSTRAINT `fk_TB_Funcionario_TB_Status1` FOREIGN KEY (`TB_Status_Cod_Status`) REFERENCES `tb_Status` (`Cod_Status`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Funcionario_TB_Cargo1` FOREIGN KEY (`TB_Cargo_Cod_Cargo`) REFERENCES `TB_Cargo` (`Cod_Cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Funcionario_TB_Funcao1` FOREIGN KEY (`TB_Funcao_Cod_Funcao`) REFERENCES `TB_Funcao` (`Cod_Funcao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Funcionario_TB_Lotacao1` FOREIGN KEY (`TB_Lotacao_Cod_Lotaca`) REFERENCES `TB_Lotacao` (`Cod_Lotaca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Funcionario_TB_Pessoa1` FOREIGN KEY (`TB_Pessoa_Cod_Pessoa`) REFERENCES `TB_Pessoa` (`Cod_Pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Login`
--
ALTER TABLE `TB_Login`
  ADD CONSTRAINT `fk_TB_Login_TB_Pessoa1` FOREIGN KEY (`TB_Pessoa_Cod_Pessoa`) REFERENCES `TB_Pessoa` (`Cod_Pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Login_TB_Perfil1` FOREIGN KEY (`TB_Perfil_Cod_Perfil`) REFERENCES `TB_Perfil` (`Cod_Perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Lote_has_TB_Vacina`
--
ALTER TABLE `TB_Lote_has_TB_Vacina`
  ADD CONSTRAINT `fk_TB_Lote_has_TB_Vacina_TB_Lote1` FOREIGN KEY (`TB_Lote_Cod_Lote`) REFERENCES `TB_Lote` (`Cod_Lote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Lote_has_TB_Vacina_TB_Vacina1` FOREIGN KEY (`TB_Vacina_Cod_Vac`) REFERENCES `TB_Vacina` (`Cod_Vac`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Paciente`
--
ALTER TABLE `TB_Paciente`
  ADD CONSTRAINT `fk_TB_Paciente_TB_Pessoa` FOREIGN KEY (`TB_Pessoa_Cod_Pessoa`) REFERENCES `TB_Pessoa` (`Cod_Pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Paciente_has_TB_Mensagem`
--
ALTER TABLE `TB_Paciente_has_TB_Mensagem`
  ADD CONSTRAINT `fk_TB_Paciente_has_TB_Mensagem_TB_Paciente1` FOREIGN KEY (`TB_Paciente_Cod_Pac`) REFERENCES `TB_Paciente` (`Cod_Pac`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Paciente_has_TB_Mensagem_TB_Mensagem1` FOREIGN KEY (`TB_Mensagem_Cod_Mens`) REFERENCES `TB_Mensagem` (`Cod_Mens`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Pessoa`
--
ALTER TABLE `TB_Pessoa`
  ADD CONSTRAINT `fk_TB_Pessoa_TB_Endereco1` FOREIGN KEY (`TB_Endereco_Cod_End`) REFERENCES `TB_Endereco` (`Cod_End`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Pessoa_TB_Unidade_Saude1` FOREIGN KEY (`TB_Unidade_Saude_Cod_Un_Saude`) REFERENCES `TB_Unidade_Saude` (`Cod_Un_Saude`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Pessoa_TB_Cartao_Vacina1` FOREIGN KEY (`TB_Cartao_Vacina_Cod_Cartao_Vac`) REFERENCES `TB_Cartao_Vacina` (`Cod_Cartao_Vac`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Pessoa_Estado Civil1` FOREIGN KEY (`Estado Civil_Cod_Estado_Civil`) REFERENCES `TB_Estado_Civil` (`Cod_Estado_Civil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `tb_Ssatus`
--
ALTER TABLE `tb_Ssatus`
  ADD CONSTRAINT `fk_Status_TB_Paciente1` FOREIGN KEY (`TB_Paciente_Cod_Pac`) REFERENCES `TB_Paciente` (`Cod_Pac`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Status_TB_Funcionario1` FOREIGN KEY (`TB_Funcionario_Cod_Funcionario`) REFERENCES `TB_Funcionario` (`Cod_Funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Telefone`
--
ALTER TABLE `TB_Telefone`
  ADD CONSTRAINT `fk_TB_Telefone_TB_Pessoa1` FOREIGN KEY (`TB_Pessoa_Cod_Pessoa`) REFERENCES `TB_Pessoa` (`Cod_Pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Tipo_Calendario`
--
ALTER TABLE `TB_Tipo_Calendario`
  ADD CONSTRAINT `fk_TB_Tipo_Calendario_TB_Calendario_Vacina1` FOREIGN KEY (`TB_Calendario_Vacina_Cod_Calend`) REFERENCES `TB_Calendario_Vacina` (`Cod_Calend`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Tipo_Mensagem`
--
ALTER TABLE `TB_Tipo_Mensagem`
  ADD CONSTRAINT `fk_TB_Tipo_Mensagem_TB_Mensagem1` FOREIGN KEY (`TB_Mensagem_Cod_Mens`) REFERENCES `TB_Mensagem` (`Cod_Mens`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Tipo_Paciente`
--
ALTER TABLE `TB_Tipo_Paciente`
  ADD CONSTRAINT `fk_TB_Tipo_Paciente_TB_Paciente1` FOREIGN KEY (`TB_Paciente_Cod_Pac`) REFERENCES `TB_Paciente` (`Cod_Pac`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Tipo_Telefone`
--
ALTER TABLE `TB_Tipo_Telefone`
  ADD CONSTRAINT `fk_TB_Tipo_Telefone_TB_Telefone1` FOREIGN KEY (`TB_Telefone_Cod_Tel`) REFERENCES `TB_Telefone` (`Cod_Tel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Unidade_Saude`
--
ALTER TABLE `TB_Unidade_Saude`
  ADD CONSTRAINT `fk_TB_Unidade_Saude_TB_Endereco1` FOREIGN KEY (`TB_Endereco_Cod_End`) REFERENCES `TB_Endereco` (`Cod_End`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Vacina`
--
ALTER TABLE `TB_Vacina`
  ADD CONSTRAINT `fk_Vacina_Cartao_Vacina1` FOREIGN KEY (`TB_Cartao_Vacina_Cod_Cartao_Vac`) REFERENCES `TB_Cartao_Vacina` (`Cod_Cartao_Vac`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Vacina_Campanha1` FOREIGN KEY (`TB_Campanha_Cod_Camp`) REFERENCES `TB_Campanha` (`Cod_Camp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Vacina_Calendario_Vacina1` FOREIGN KEY (`TB_Calendario_Vac_Cod_Calend`) REFERENCES `TB_Calendario_Vacina` (`Cod_Calend`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `TB_Vacina_has_TB_Fabricante`
--
ALTER TABLE `TB_Vacina_has_TB_Fabricante`
  ADD CONSTRAINT `fk_TB_Vacina_has_TB_Fabricante_TB_Vacina1` FOREIGN KEY (`TB_Vacina_Cod_Vac`) REFERENCES `TB_Vacina` (`Cod_Vac`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Vacina_has_TB_Fabricante_TB_Fabricante1` FOREIGN KEY (`TB_Fabricante_Cod_Fabric`) REFERENCES `TB_Fabricante` (`Cod_Fabric`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
