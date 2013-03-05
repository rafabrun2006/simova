-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tempo de Geração: Mar 05, 2013 as 02:28 AM
-- Versão do Servidor: 5.0.45
-- Versão do PHP: 5.4.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Banco de Dados: `db_simova`
-- 
CREATE DATABASE `db_simova` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_simova`;

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `lote_vacina`
-- 

CREATE TABLE `lote_vacina` (
  `COD_LOTE` int(11) NOT NULL,
  `COD_VAC` int(11) NOT NULL,
  PRIMARY KEY  (`COD_LOTE`,`COD_VAC`),
  KEY `FK_LOTE_VACINA2` (`COD_VAC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Extraindo dados da tabela `lote_vacina`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `paciente_mensagem`
-- 

CREATE TABLE `paciente_mensagem` (
  `COD_PAC` int(11) NOT NULL,
  `COD_MENS` int(11) NOT NULL,
  PRIMARY KEY  (`COD_PAC`,`COD_MENS`),
  KEY `FK_PACIENTE_MENSAGEM2` (`COD_MENS`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Extraindo dados da tabela `paciente_mensagem`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_banner`
-- 

CREATE TABLE `tb_banner` (
  `COD_BANNER` int(11) NOT NULL,
  `ATIVO` int(11) NOT NULL,
  `FOTO` varchar(45) NOT NULL,
  PRIMARY KEY  (`COD_BANNER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Extraindo dados da tabela `tb_banner`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_calendario_vacina`
-- 

CREATE TABLE `tb_calendario_vacina` (
  `COD_CALEND` int(11) NOT NULL,
  `COD_TIPO_CALEND` int(11) default NULL,
  `DT_PUBLIC_CALEND` date NOT NULL,
  `NOME_CALEND` varchar(45) NOT NULL,
  PRIMARY KEY  (`COD_CALEND`),
  KEY `FK_CALENDARIO_VACINA_TIPO_CALENDARIO` (`COD_TIPO_CALEND`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Extraindo dados da tabela `tb_calendario_vacina`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_campanha`
-- 

CREATE TABLE `tb_campanha` (
  `Cod_Camp` int(11) NOT NULL auto_increment,
  `Nome_Camp` varchar(100) NOT NULL,
  `Dt_Inicial_Camp` date NOT NULL,
  `Dt_Final_Camp` date NOT NULL,
  `Data_Public_Camp` date NOT NULL,
  PRIMARY KEY  (`Cod_Camp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_campanha`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_cargo`
-- 

CREATE TABLE `tb_cargo` (
  `Cod_Cargo` int(11) NOT NULL auto_increment,
  `Nome_Cargo` varchar(20) NOT NULL,
  PRIMARY KEY  (`Cod_Cargo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_cargo`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_cartao_vacina`
-- 

CREATE TABLE `tb_cartao_vacina` (
  `Cod_Cartao_Vac` int(11) NOT NULL auto_increment,
  `Dt_Vac_Aplicada` date NOT NULL,
  `Dt_Aprazada` date NOT NULL,
  `TB_Paciente_Cod_Pac` int(11) NOT NULL,
  `TB_Funcionario_Cod_Funcionario` int(11) NOT NULL,
  `TB_Unidade_Saude_Cod_Un_Saude` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Cartao_Vac`),
  KEY `fk_Cartao_Vacina_Paciente1_idx` (`TB_Paciente_Cod_Pac`),
  KEY `fk_TB_Cartao_Vacina_TB_Funcionario1_idx` (`TB_Funcionario_Cod_Funcionario`),
  KEY `fk_TB_Cartao_Vacina_TB_Unidade_Saude1` (`TB_Unidade_Saude_Cod_Un_Saude`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_cartao_vacina`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_cidade`
-- 

CREATE TABLE `tb_cidade` (
  `COD_CID` int(11) NOT NULL,
  `COD_UF` int(11) NOT NULL,
  `NOME_CID` varchar(35) NOT NULL,
  PRIMARY KEY  (`COD_CID`),
  KEY `FK_UF_CIDADE` (`COD_UF`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Extraindo dados da tabela `tb_cidade`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_doenca`
-- 

CREATE TABLE `tb_doenca` (
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

CREATE TABLE `tb_dose_vacina` (
  `COD_DOSE` int(11) NOT NULL,
  `COD_VAC` int(11) default NULL,
  `DOSE` varchar(10) default NULL,
  PRIMARY KEY  (`COD_DOSE`),
  KEY `FK_VACINA_DOSE_VACINA` (`COD_VAC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Extraindo dados da tabela `tb_dose_vacina`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_email`
-- 

CREATE TABLE `tb_email` (
  `COD_EMAIL` int(11) NOT NULL,
  `NOME_EMAIL` varchar(60) NOT NULL,
  PRIMARY KEY  (`COD_EMAIL`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Extraindo dados da tabela `tb_email`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_endereco`
-- 

CREATE TABLE `tb_endereco` (
  `Cod_End` int(11) NOT NULL auto_increment,
  `Endereco` varchar(100) NOT NULL,
  `Cep` int(11) NOT NULL,
  `Bairro` varchar(45) NOT NULL,
  `Numero` int(11) default NULL,
  `Complemento` varchar(60) default NULL,
  `TB_Cidade_Cod_Cid` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_End`),
  KEY `fk_TB_Endereco_TB_Cidade1` (`TB_Cidade_Cod_Cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_endereco`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_fabricante`
-- 

CREATE TABLE `tb_fabricante` (
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

CREATE TABLE `tb_funcao` (
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

CREATE TABLE `tb_funcionario` (
  `Cod_Funcionario` int(11) NOT NULL auto_increment,
  `Mat` int(11) NOT NULL,
  `TB_Status_Cod_Status` int(11) NOT NULL,
  `TB_Funcao_Cod_Funcao` int(11) NOT NULL,
  `TB_Lotacao_Cod_Lotaca` int(11) NOT NULL,
  `TB_Cargo_Cod_Cargo` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Funcionario`),
  KEY `fk_TB_Funcionario_TB_Status1` (`TB_Status_Cod_Status`),
  KEY `fk_TB_Funcionario_TB_Funcao1` (`TB_Funcao_Cod_Funcao`),
  KEY `fk_TB_Funcionario_TB_Lotacao1` (`TB_Lotacao_Cod_Lotaca`),
  KEY `fk_TB_Funcionario_TB_Cargo1` (`TB_Cargo_Cod_Cargo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_funcionario`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_historico_mensagem`
-- 

CREATE TABLE `tb_historico_mensagem` (
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

CREATE TABLE `tb_login` (
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

CREATE TABLE `tb_lotacao` (
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

CREATE TABLE `tb_lote` (
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

CREATE TABLE `tb_lote_has_tb_vacina` (
  `TB_Lote_Cod_Lote` int(11) NOT NULL,
  `TB_Vacina_Cod_Vac` int(11) NOT NULL,
  PRIMARY KEY  (`TB_Lote_Cod_Lote`,`TB_Vacina_Cod_Vac`),
  KEY `fk_TB_Lote_has_TB_Vacina_TB_Lote1_idx` (`TB_Lote_Cod_Lote`),
  KEY `fk_TB_Lote_has_TB_Vacina_TB_Vacina1_idx` (`TB_Vacina_Cod_Vac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Extraindo dados da tabela `tb_lote_has_tb_vacina`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_mensagem`
-- 

CREATE TABLE `tb_mensagem` (
  `Cod_Mens` int(11) NOT NULL auto_increment,
  `Texto_Mens` text NOT NULL,
  `TB_Tipo_Mensagem_Cod_Tipo_Mens` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Mens`),
  KEY `fk_TB_Mensagem_TB_Tipo_Mensagem1` (`TB_Tipo_Mensagem_Cod_Tipo_Mens`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_mensagem`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_paciente`
-- 

CREATE TABLE `tb_paciente` (
  `Cod_Pac` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`Cod_Pac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_paciente`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_paciente_has_tb_mensagem`
-- 

CREATE TABLE `tb_paciente_has_tb_mensagem` (
  `TB_Paciente_Cod_Pac` int(11) NOT NULL,
  `TB_Mensagem_Cod_Mens` int(11) NOT NULL,
  PRIMARY KEY  (`TB_Paciente_Cod_Pac`,`TB_Mensagem_Cod_Mens`),
  KEY `fk_TB_Paciente_has_TB_Mensagem_TB_Paciente1_idx` (`TB_Paciente_Cod_Pac`),
  KEY `fk_TB_Paciente_has_TB_Mensagem_TB_Mensagem1_idx` (`TB_Mensagem_Cod_Mens`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Extraindo dados da tabela `tb_paciente_has_tb_mensagem`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_perfil`
-- 

CREATE TABLE `tb_perfil` (
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

CREATE TABLE `tb_pessoa` (
  `Cod_Pessoa` int(11) NOT NULL auto_increment,
  `Nome` varchar(100) NOT NULL,
  `CPF` varchar(14) default NULL,
  `Nome_Mae` varchar(100) NOT NULL,
  `Nome_Pai` varchar(100) default NULL,
  `Sexo` char(1) default NULL,
  `RG` varchar(20) default NULL,
  `Estado_Civil` varchar(10) default NULL,
  `TB_Funcionario_Cod_Funcionario` int(11) NOT NULL,
  `TB_Paciente_Cod_Pac` int(11) NOT NULL,
  `Dt_nasc` date NOT NULL,
  `Registro` varchar(100) default NULL,
  `TB_Endereco_Cod_End` int(11) NOT NULL,
  `TB_Unidade_Saude_Cod_Un_Saude` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Pessoa`),
  KEY `fk_TB_Pessoa_TB_Funcionario1_idx` (`TB_Funcionario_Cod_Funcionario`),
  KEY `fk_TB_Pessoa_TB_Paciente1_idx` (`TB_Paciente_Cod_Pac`),
  KEY `fk_TB_Pessoa_TB_Endereco1` (`TB_Endereco_Cod_End`),
  KEY `fk_TB_Pessoa_TB_Unidade_Saude1` (`TB_Unidade_Saude_Cod_Un_Saude`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_pessoa`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_status`
-- 

CREATE TABLE `tb_status` (
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

CREATE TABLE `tb_telefone` (
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

CREATE TABLE `tb_tipo_calendario` (
  `Cod_Tipo_Calend` int(11) NOT NULL auto_increment,
  `Faixa_Etaria` int(11) NOT NULL,
  `Nome_Calend` varchar(45) NOT NULL,
  PRIMARY KEY  (`Cod_Tipo_Calend`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_tipo_calendario`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_tipo_mensagem`
-- 

CREATE TABLE `tb_tipo_mensagem` (
  `Cod_Tipo_Mens` int(11) NOT NULL auto_increment,
  `Tipo_Mens` text,
  PRIMARY KEY  (`Cod_Tipo_Mens`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_tipo_mensagem`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_tipo_paciente`
-- 

CREATE TABLE `tb_tipo_paciente` (
  `Cod_Tipo_Pac` int(11) NOT NULL auto_increment,
  `Tipo_Pac` varchar(15) NOT NULL,
  `TB_Paciente_Cod_Pac` int(11) NOT NULL,
  PRIMARY KEY  (`Cod_Tipo_Pac`),
  KEY `fk_TB_Tipo_Paciente_TB_Paciente1_idx` (`TB_Paciente_Cod_Pac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_tipo_paciente`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_tipo_telefone`
-- 

CREATE TABLE `tb_tipo_telefone` (
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
-- Estrutura da tabela `tb_uf`
-- 

CREATE TABLE `tb_uf` (
  `Cod_UF` int(11) NOT NULL auto_increment,
  `Sigla_UF` varchar(2) NOT NULL,
  PRIMARY KEY  (`Cod_UF`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_uf`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_unidade_saude`
-- 

CREATE TABLE `tb_unidade_saude` (
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

CREATE TABLE `tb_vacina` (
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
-- Estrutura da tabela `tb_vacina_has_tb_fabricante`
-- 

CREATE TABLE `tb_vacina_has_tb_fabricante` (
  `TB_Vacina_Cod_Vac` int(11) NOT NULL,
  `TB_Fabricante_Cod_Fabric` int(11) NOT NULL,
  PRIMARY KEY  (`TB_Vacina_Cod_Vac`,`TB_Fabricante_Cod_Fabric`),
  KEY `fk_TB_Vacina_has_TB_Fabricante_TB_Vacina1` (`TB_Vacina_Cod_Vac`),
  KEY `fk_TB_Vacina_has_TB_Fabricante_TB_Fabricante1` (`TB_Fabricante_Cod_Fabric`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Extraindo dados da tabela `tb_vacina_has_tb_fabricante`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `vacina_fabricante`
-- 

CREATE TABLE `vacina_fabricante` (
  `COD_VAC` int(11) NOT NULL,
  `COD_FABRIC` int(11) NOT NULL,
  PRIMARY KEY  (`COD_VAC`,`COD_FABRIC`),
  KEY `FK_VACINA_FABRICANTE2` (`COD_FABRIC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Extraindo dados da tabela `vacina_fabricante`
-- 

