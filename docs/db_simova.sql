-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Mar 10, 2013 as 10:39 AM
-- Versão do Servidor: 5.0.45
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
-- Estrutura da tabela `tb_banner`
--

CREATE TABLE IF NOT EXISTS `tb_banner` (
  `Cod_Banner` int(11) NOT NULL auto_increment,
  `Ativo` int(11) NOT NULL,
  `Foto` varchar(45) NOT NULL,
  PRIMARY KEY  (`Cod_Banner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_banner`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_calendario_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_calendario_vacina` (
  `Cod_Calend` int(11) NOT NULL auto_increment,
  `Data_Public_Calend` date NOT NULL,
  PRIMARY KEY  (`Cod_Calend`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_calendario_vacina`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_campanha`
--

CREATE TABLE IF NOT EXISTS `tb_campanha` (
  `Cod_Camp` int(11) NOT NULL auto_increment,
  `Nome_Camp` varchar(100) NOT NULL,
  `Dt_Inicial_Camp` date NOT NULL,
  `Dt_Final_Camp` date NOT NULL,
  `Dt_Public_Camp` date NOT NULL,
  PRIMARY KEY  (`Cod_Camp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_campanha`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cargo`
--

CREATE TABLE IF NOT EXISTS `tb_cargo` (
  `Cod_Cargo` int(11) NOT NULL,
  `Nome_Cargo` varchar(20) NOT NULL,
  PRIMARY KEY  (`Cod_Cargo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_cargo`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cartao_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_cartao_vacina` (
  `Cod_Cartao_Vac` int(11) NOT NULL auto_increment,
  `Dt_Vac_Aplicada` date NOT NULL,
  `Dt_Aprazada` date NOT NULL,
  `TB_Unidade_Saude_Cod_Un_Saude` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Cartao_Vac`),
  KEY `fk_TB_Cartao_Vacina_TB_Unidade_Saude1` (`TB_Unidade_Saude_Cod_Un_Saude`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_cartao_vacina`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cidade`
--

CREATE TABLE IF NOT EXISTS `tb_cidade` (
  `Cod_Cid` int(11) NOT NULL auto_increment,
  `Nome_Cid` varchar(35) NOT NULL,
  `TB_UF_Cod_UF` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Cid`),
  KEY `fk_TB_Cidade_TB_UF1` (`TB_UF_Cod_UF`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_cidade`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_doenca`
--

CREATE TABLE IF NOT EXISTS `tb_doenca` (
  `Cod_Doenca` int(11) NOT NULL auto_increment,
  `Nome_Doenca` varchar(20) NOT NULL,
  `Descricao_Doenca` text NOT NULL,
  `Doenca_Evitada` text NOT NULL,
  `TB_Vacina_Cod_Vac` int(11) NOT NULL,
  `TB_Calendario_Vac_Cod_Calend` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Doenca`),
  KEY `fk_Doença_Vacina1_idx` (`TB_Vacina_Cod_Vac`),
  KEY `fk_Doença_Calendario_Vacina1_idx` (`TB_Calendario_Vac_Cod_Calend`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_doenca`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_dose_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_dose_vacina` (
  `Cod_Dose` int(11) NOT NULL auto_increment,
  `Dose` varchar(10) NOT NULL,
  `TB_Vacina_Cod_Vac` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Dose`),
  KEY `fk_Dose_vacina_Vacina1_idx` (`TB_Vacina_Cod_Vac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_dose_vacina`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_endereco`
--

CREATE TABLE IF NOT EXISTS `tb_endereco` (
  `Cod_End` int(11) NOT NULL auto_increment,
  `Cod_Cid` int(11) default NULL,
  `Cod_Un_Saude` int(11) default NULL,
  `Endereco` varchar(100) NOT NULL,
  `CEP` int(11) NOT NULL,
  `Bairro` varchar(45) NOT NULL,
  `Numero` int(11) default NULL,
  `Complemento` varchar(60) default NULL,
  PRIMARY KEY  (`Cod_End`),
  KEY `FK_ENDERECO_CIDADE` (`Cod_Cid`),
  KEY `FK_UNIDADE_SAUDE_ENDERECO2` (`Cod_Un_Saude`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_endereco`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_estado_civil`
--

CREATE TABLE IF NOT EXISTS `tb_estado_civil` (
  `Cod_Estado_Civil` int(11) NOT NULL auto_increment,
  `Nome_Estado_Civil` varchar(20) NOT NULL,
  PRIMARY KEY  (`Cod_Estado_Civil`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_estado_civil`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_fabricante`
--

CREATE TABLE IF NOT EXISTS `tb_fabricante` (
  `Cod_Fabric` int(11) NOT NULL auto_increment,
  `Nome_Fabric` varchar(30) NOT NULL,
  PRIMARY KEY  (`Cod_Fabric`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_fabricante`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcao`
--

CREATE TABLE IF NOT EXISTS `tb_funcao` (
  `Cod_Funcao` int(11) NOT NULL auto_increment,
  `Nome_Funcao` varchar(20) NOT NULL,
  PRIMARY KEY  (`Cod_Funcao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_funcao`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_funcionario`
--

CREATE TABLE IF NOT EXISTS `tb_funcionario` (
  `Cod_Funcionario` int(11) NOT NULL auto_increment,
  `Cod_Funcao` int(11) default NULL,
  `Cod_Cargo` int(11) default NULL,
  `Cod_Pessoa` int(11) default NULL,
  `Matricula` int(11) default NULL,
  PRIMARY KEY  (`Cod_Funcionario`),
  KEY `fk_Cargo_Funcionario` (`Cod_Cargo`),
  KEY `fk_Funcao_Funcionario` (`Cod_Funcao`),
  KEY `fk_Funcionario_Pessoa2` (`Cod_Pessoa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_funcionario`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_historico_mensagem`
--

CREATE TABLE IF NOT EXISTS `tb_historico_mensagem` (
  `Cod_Hist_Mens` int(11) NOT NULL auto_increment,
  `Dt_Mens` datetime NOT NULL,
  `Mens` text NOT NULL,
  PRIMARY KEY  (`Cod_Hist_Mens`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_historico_mensagem`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_login`
--

CREATE TABLE IF NOT EXISTS `tb_login` (
  `Cod_Login` int(11) NOT NULL auto_increment,
  `Nome_Log` varchar(50) NOT NULL,
  `Senha_Log` varchar(10) NOT NULL,
  `TB_Pessoa_Cod_Pessoa` int(11) NOT NULL,
  `TB_Perfil_Cod_Perfil` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Login`),
  KEY `fk_TB_Login_TB_Pessoa1` (`TB_Pessoa_Cod_Pessoa`),
  KEY `fk_TB_Login_TB_Perfil1` (`TB_Perfil_Cod_Perfil`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_login`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_lotacao`
--

CREATE TABLE IF NOT EXISTS `tb_lotacao` (
  `Cod_Lotaca` int(11) NOT NULL auto_increment,
  `Nome_Lotacao` varchar(20) NOT NULL,
  PRIMARY KEY  (`Cod_Lotaca`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_lotacao`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_lote`
--

CREATE TABLE IF NOT EXISTS `tb_lote` (
  `Cod_Lote` int(11) NOT NULL auto_increment,
  `Num_Lote` int(11) NOT NULL,
  `Dt_Venc` date NOT NULL,
  `Dt_Fabric` date NOT NULL,
  PRIMARY KEY  (`Cod_Lote`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_lote`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_lote_has_tb_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_lote_has_tb_vacina` (
  `TB_Lote_Cod_Lote` int(11) NOT NULL auto_increment,
  `TB_Vacina_Cod_Vac` int(11) NOT NULL,
  PRIMARY KEY  (`TB_Lote_Cod_Lote`,`TB_Vacina_Cod_Vac`),
  KEY `fk_TB_Lote_has_TB_Vacina_TB_Lote1_idx` (`TB_Lote_Cod_Lote`),
  KEY `fk_TB_Lote_has_TB_Vacina_TB_Vacina1_idx` (`TB_Vacina_Cod_Vac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_lote_has_tb_vacina`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_lote_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_lote_vacina` (
  `Cod_Lote` int(11) NOT NULL auto_increment,
  `Cod_Vac` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Lote`,`Cod_Vac`),
  KEY `fk_Lote_Vacina2` (`Cod_Vac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_lote_vacina`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_mensagem`
--

CREATE TABLE IF NOT EXISTS `tb_mensagem` (
  `Cod_Mens` int(11) NOT NULL,
  `Cod_Tipo_Mens` int(11) default NULL,
  `Texto_Mens` text NOT NULL,
  PRIMARY KEY  (`Cod_Mens`),
  KEY `fk_Mensagem_Tipo_Mensagem` (`Cod_Tipo_Mens`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_mensagem`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_paciente`
--

CREATE TABLE IF NOT EXISTS `tb_paciente` (
  `Cod_Pac` int(11) NOT NULL auto_increment,
  `TB_Pessoa_Cod_Pessoa` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Pac`),
  KEY `fk_TB_Paciente_TB_Pessoa` (`TB_Pessoa_Cod_Pessoa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_paciente`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_paciente_has_tb_mensagem`
--

CREATE TABLE IF NOT EXISTS `tb_paciente_has_tb_mensagem` (
  `TB_Paciente_Cod_Pac` int(11) NOT NULL auto_increment,
  `TB_Mensagem_Cod_Mens` int(11) NOT NULL,
  PRIMARY KEY  (`TB_Paciente_Cod_Pac`,`TB_Mensagem_Cod_Mens`),
  KEY `fk_TB_Paciente_has_TB_Mensagem_TB_Paciente1_idx` (`TB_Paciente_Cod_Pac`),
  KEY `fk_TB_Paciente_has_TB_Mensagem_TB_Mensagem1_idx` (`TB_Mensagem_Cod_Mens`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_paciente_has_tb_mensagem`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_paciente_mensagem`
--

CREATE TABLE IF NOT EXISTS `tb_paciente_mensagem` (
  `Cod_Pac` int(11) NOT NULL auto_increment,
  `Cod_Mens` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Pac`,`Cod_Mens`),
  KEY `FK_PACIENTE_MENSAGEM2` (`Cod_Mens`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_paciente_mensagem`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_perfil`
--

CREATE TABLE IF NOT EXISTS `tb_perfil` (
  `Cod_Perfil` int(11) NOT NULL auto_increment,
  `Nome_Perfil` varchar(15) NOT NULL,
  PRIMARY KEY  (`Cod_Perfil`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_perfil`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_pessoa`
--

CREATE TABLE IF NOT EXISTS `tb_pessoa` (
  `Cod_Pessoa` int(11) NOT NULL auto_increment,
  `Nome` varchar(100) NOT NULL,
  `CPF` varchar(14) default NULL,
  `Nome_Mae` varchar(100) NOT NULL,
  `Nome_Pai` varchar(100) default NULL,
  `Sexo` char(1) default NULL,
  `RG` varchar(20) default NULL,
  `Dt_nasc` date NOT NULL,
  `Registro` varchar(100) default NULL,
  `TB_Endereco_Cod_End` int(11) NOT NULL,
  `TB_Unidade_Saude_Cod_Un_Saude` int(11) NOT NULL,
  `TB_Cartao_Vacina_Cod_Cartao_Vac` int(11) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Estado Civil_Cod_Estado_Civil` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Pessoa`),
  KEY `fk_TB_Pessoa_TB_Endereco1` (`TB_Endereco_Cod_End`),
  KEY `fk_TB_Pessoa_TB_Unidade_Saude1` (`TB_Unidade_Saude_Cod_Un_Saude`),
  KEY `fk_TB_Pessoa_TB_Cartao_Vacina1` (`TB_Cartao_Vacina_Cod_Cartao_Vac`),
  KEY `fk_TB_Pessoa_Estado Civil1` (`Estado Civil_Cod_Estado_Civil`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tb_pessoa`
--

INSERT INTO `tb_pessoa` (`Cod_Pessoa`, `Nome`, `CPF`, `Nome_Mae`, `Nome_Pai`, `Sexo`, `RG`, `Dt_nasc`, `Registro`, `TB_Endereco_Cod_End`, `TB_Unidade_Saude_Cod_Un_Saude`, `TB_Cartao_Vacina_Cod_Cartao_Vac`, `Email`, `Estado Civil_Cod_Estado_Civil`) VALUES
(1, 'Ana Maria', '123.345.127.-0', 'joana', 'almir', 'F', '4569234', '1990-09-02', NULL, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_status`
--

CREATE TABLE IF NOT EXISTS `tb_status` (
  `Cod_Status` int(11) NOT NULL auto_increment,
  `Nome_Status` varchar(10) NOT NULL,
  `TB_Paciente_Cod_Pac` int(11) NOT NULL,
  `TB_Funcionario_Cod_Funcionario` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Status`),
  KEY `fk_Status_TB_Paciente1_idx` (`TB_Paciente_Cod_Pac`),
  KEY `fk_TB_Status_TB_Funcionario1` (`TB_Funcionario_Cod_Funcionario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_status`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_telefone`
--

CREATE TABLE IF NOT EXISTS `tb_telefone` (
  `Cod_Tel` int(11) NOT NULL auto_increment,
  `Num_Tel` int(11) NOT NULL,
  `TB_Pessoa_Cod_Pessoa` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Tel`),
  KEY `fk_TB_Telefone_TB_Pessoa1` (`TB_Pessoa_Cod_Pessoa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_telefone`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_calendario`
--

CREATE TABLE IF NOT EXISTS `tb_tipo_calendario` (
  `Cod_Tipo_Calend` int(11) NOT NULL auto_increment,
  `Faixa_Etaria` int(11) NOT NULL,
  `Nome_Calend` varchar(45) NOT NULL,
  `TB_Calendario_Vacina_Cod_Calend` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Tipo_Calend`),
  KEY `fk_TB_Tipo_Calendario_TB_Calendario_Vacina1` (`TB_Calendario_Vacina_Cod_Calend`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_tipo_calendario`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_mensagem`
--

CREATE TABLE IF NOT EXISTS `tb_tipo_mensagem` (
  `Cod_Tipo_Mens` int(11) NOT NULL auto_increment,
  `Tipo_Mens` text,
  `TB_Mensagem_Cod_Mens` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Tipo_Mens`),
  KEY `fk_TB_Tipo_Mensagem_TB_Mensagem1` (`TB_Mensagem_Cod_Mens`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_tipo_mensagem`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_paciente`
--

CREATE TABLE IF NOT EXISTS `tb_tipo_paciente` (
  `Cod_Tipo_Pac` int(11) NOT NULL auto_increment,
  `Tipo_Pac` varchar(15) NOT NULL,
  `TB_Paciente_Cod_Pac` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Tipo_Pac`),
  KEY `fk_TB_Tipo_Paciente_TB_Paciente1` (`TB_Paciente_Cod_Pac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_tipo_paciente`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo_telefone`
--

CREATE TABLE IF NOT EXISTS `tb_tipo_telefone` (
  `Cod_Tipo_Tel` int(11) NOT NULL auto_increment,
  `Tipo_Tel` varchar(15) NOT NULL,
  `TB_Telefone_Cod_Tel` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Tipo_Tel`),
  KEY `fk_TB_Tipo_Telefone_TB_Telefone1` (`TB_Telefone_Cod_Tel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_tipo_telefone`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tpo_telefone`
--

CREATE TABLE IF NOT EXISTS `tb_tpo_telefone` (
  `Cod_Tipo_Tel` int(11) NOT NULL auto_increment,
  `Tipo_Tel` varchar(15) NOT NULL,
  PRIMARY KEY  (`Cod_Tipo_Tel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_tpo_telefone`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_uf`
--

CREATE TABLE IF NOT EXISTS `tb_uf` (
  `Cod_UF` int(11) NOT NULL auto_increment,
  `Sigla_UF` varchar(2) NOT NULL,
  `Nome_UF` varchar(45) NOT NULL,
  PRIMARY KEY  (`Cod_UF`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_uf`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_unidade_saude`
--

CREATE TABLE IF NOT EXISTS `tb_unidade_saude` (
  `Cod_Un_Saude` int(11) NOT NULL auto_increment,
  `Nome_Un_Saude` varchar(30) NOT NULL,
  `Num_Un_Saude` int(11) NOT NULL,
  `TB_Endereco_Cod_End` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Un_Saude`),
  KEY `fk_TB_Unidade_Saude_TB_Endereco1` (`TB_Endereco_Cod_End`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_unidade_saude`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_vacina`
--

CREATE TABLE IF NOT EXISTS `tb_vacina` (
  `Cod_Vac` int(11) NOT NULL auto_increment,
  `Nome_Vac` varchar(60) NOT NULL,
  `TB_Cartao_Vacina_Cod_Cartao_Vac` int(11) NOT NULL,
  `TB_Campanha_Cod_Camp` int(11) NOT NULL,
  `TB_Calendario_Vac_Cod_Calend` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Vac`),
  KEY `fk_Vacina_Cartao_Vacina1_idx` (`TB_Cartao_Vacina_Cod_Cartao_Vac`),
  KEY `fk_Vacina_Campanha1_idx` (`TB_Campanha_Cod_Camp`),
  KEY `fk_Vacina_Calendario_Vacina1_idx` (`TB_Calendario_Vac_Cod_Calend`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_vacina`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_vacina_fabricante`
--

CREATE TABLE IF NOT EXISTS `tb_vacina_fabricante` (
  `Cod_Vac` int(11) NOT NULL auto_increment,
  `Cod_Fabric` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Vac`,`Cod_Fabric`),
  KEY `fk_Vacina_Fabricante2` (`Cod_Fabric`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_vacina_fabricante`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_vacina_has_tb_fabricante`
--

CREATE TABLE IF NOT EXISTS `tb_vacina_has_tb_fabricante` (
  `TB_Vacina_Cod_Vac` int(11) NOT NULL auto_increment,
  `TB_Fabricante_Cod_Fabric` int(11) NOT NULL,
  PRIMARY KEY  (`TB_Vacina_Cod_Vac`,`TB_Fabricante_Cod_Fabric`),
  KEY `fk_TB_Vacina_has_TB_Fabricante_TB_Vacina1` (`TB_Vacina_Cod_Vac`),
  KEY `fk_TB_Vacina_has_TB_Fabricante_TB_Fabricante1` (`TB_Fabricante_Cod_Fabric`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `tb_vacina_has_tb_fabricante`
--

