-- phpMyAdmin SQL Dump
-- version 2.10.2
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tempo de Geração: Fev 25, 2013 as 09:35 PM
-- Versão do Servidor: 5.0.45
-- Versão do PHP: 5.2.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Banco de Dados: `db_simova`
-- 

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
  `COD_BANNER` int(11) NOT NULL auto_increment,
  `COD_FUNCIONARIO` int(11) default NULL,
  `ATIVO` int(11) NOT NULL,
  `FOTO` varchar(45) NOT NULL,
  PRIMARY KEY  (`COD_BANNER`),
  KEY `FK_BANNER_FUNCIONARIO` (`COD_FUNCIONARIO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_banner`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_calendario_vacina`
-- 

CREATE TABLE `tb_calendario_vacina` (
  `COD_CALEND` int(11) NOT NULL auto_increment,
  `COD_TIPO_CALEND` int(11) default NULL,
  `DT_PUBLIC_CALEND` date NOT NULL,
  `NOME_CALEND` varchar(45) NOT NULL,
  PRIMARY KEY  (`COD_CALEND`),
  KEY `FK_CALENDARIO_VACINA_TIPO_CALENDARIO` (`COD_TIPO_CALEND`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_calendario_vacina`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_campanha`
-- 

CREATE TABLE `tb_campanha` (
  `COD_CAMP` int(11) NOT NULL auto_increment,
  `NOME_CAMP` varchar(100) NOT NULL,
  `DT_INICIAL_CAMP` date NOT NULL,
  `DT_FINAL_CAMP` date NOT NULL,
  `DT_PUBLIC_CAMP` date NOT NULL,
  PRIMARY KEY  (`COD_CAMP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_campanha`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_cargo`
-- 

CREATE TABLE `tb_cargo` (
  `COD_CARGO` int(11) NOT NULL auto_increment,
  `NOME_CARGO` varchar(20) NOT NULL,
  PRIMARY KEY  (`COD_CARGO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_cargo`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_cartao_vacina`
-- 

CREATE TABLE `tb_cartao_vacina` (
  `COD_CARTAO_VAC` int(11) NOT NULL auto_increment,
  `COD_PAC` int(11) default NULL,
  `COD_UN_SAUDE` int(11) default NULL,
  `DT_VAC_APLICADA` date NOT NULL,
  `DT_APRAZADA` date NOT NULL,
  PRIMARY KEY  (`COD_CARTAO_VAC`),
  KEY `FK_PACIENTE_CARTAO_VACINA` (`COD_PAC`),
  KEY `FK_UNIDADE_SAUDE_CARTAO_VACINA` (`COD_UN_SAUDE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_cartao_vacina`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_cidade`
-- 

CREATE TABLE `tb_cidade` (
  `COD_CID` int(11) NOT NULL auto_increment,
  `COD_UF` int(11) NOT NULL,
  `NOME_CID` varchar(35) NOT NULL,
  PRIMARY KEY  (`COD_CID`),
  KEY `FK_UF_CIDADE` (`COD_UF`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=95 ;

-- 
-- Extraindo dados da tabela `tb_cidade`
-- 

INSERT INTO `tb_cidade` VALUES (1, 20, 'JBC0RP02YCA3BIAAM642GL4C92TXK1R HTE');
INSERT INTO `tb_cidade` VALUES (3, 58, 'IH6D36GMP7NTSYUKH38A9WOEK3266C4GK1V');
INSERT INTO `tb_cidade` VALUES (14, 22, '4SM83T0G1D9Q1Y5WES0ULW5NN6662N5SKN ');
INSERT INTO `tb_cidade` VALUES (33, 18, 'TDKQ9 B2JNG0QI66130SSEFYIV6U1FNQ27Y');
INSERT INTO `tb_cidade` VALUES (58, 98, 'KP6ANMITCY51RFNUDN7SAAIHH 033HEW1HN');
INSERT INTO `tb_cidade` VALUES (35, 38, 'A20SS3XDFVT39KIGIPFNSL27P57Q6WI1U7F');
INSERT INTO `tb_cidade` VALUES (17, 60, 'O3I8SRHQ81BV AFD163XCOO02K9SHSP6EA2');
INSERT INTO `tb_cidade` VALUES (2, 17, 'JJWA9XVTB56HCDP4CBIBEAOGJLEY97TMQA4');
INSERT INTO `tb_cidade` VALUES (43, 53, 'R72CKNXMN5FA49K6EG9143KD5CE47U8160J');
INSERT INTO `tb_cidade` VALUES (59, 59, 'XARQLKA1TTS223YX4505TAQAI603RLRC14S');
INSERT INTO `tb_cidade` VALUES (50, 46, 'LBLV 075BWDCAARWL65E847M5QU8GYCY IU');
INSERT INTO `tb_cidade` VALUES (78, 77, 'Q6JKRAWXPBQFMNE8 L4735TIUUYKN 9A9IY');
INSERT INTO `tb_cidade` VALUES (16, 46, 'F7LM9R1PW4NSWQSID3GD1ML2QG44MMVQO7B');
INSERT INTO `tb_cidade` VALUES (62, 53, '3OWJ77LF18L966GX0JCSD 2K0CK98FL1N77');
INSERT INTO `tb_cidade` VALUES (10, 55, 'V8P9DA35H0E3WV0CHTSCY7QINQ2GX4QD6OY');
INSERT INTO `tb_cidade` VALUES (7, 45, 'LE27O P25BG7PV6VCFHVJ1GBXOPWRLCU8XB');
INSERT INTO `tb_cidade` VALUES (84, 48, '019XJVMNL238A8PXJCIH3FH22ECWJVXCOUW');
INSERT INTO `tb_cidade` VALUES (18, 84, '6EOTTIUCMCC05FD5SPE35F MYIHXWA9HYK5');
INSERT INTO `tb_cidade` VALUES (21, 96, 'DM1 VWL542VM2BMISE SN0G4X6L7OL61C90');
INSERT INTO `tb_cidade` VALUES (83, 17, '6XJXCC04TEUPLDPHVRIE0JO674EP9B74QTW');
INSERT INTO `tb_cidade` VALUES (41, 97, 'HPIR2BB41L68GU7QLJSFDEIHUSDFQNV8O7Y');
INSERT INTO `tb_cidade` VALUES (48, 55, 'II41Q O3O81DXO8CQDOK OW593JFR8 LTYX');
INSERT INTO `tb_cidade` VALUES (65, 43, 'S973H1VDL8FTCG1I1TGXTH6OVK5AUMQ1V4M');
INSERT INTO `tb_cidade` VALUES (15, 74, 'BAUAHBP05IO32QYRE28R0NLPKNDWFKNGW W');
INSERT INTO `tb_cidade` VALUES (27, 31, '4NX8U71216F4G 53E66SFDIUBR638LKHTSX');
INSERT INTO `tb_cidade` VALUES (34, 75, 'PM5OL3902OIS1EDYX6HF8PB5MPDJALHTWAC');
INSERT INTO `tb_cidade` VALUES (81, 81, 'POBGDEVYBFVKIQ1T 4F2SAY8 EG 4F59Y3I');
INSERT INTO `tb_cidade` VALUES (42, 33, 'KDLPHI2RADUGE7JPLL2BFHA66DWPHR2B004');
INSERT INTO `tb_cidade` VALUES (37, 16, '6DR4OS4R2GQXK5 UEB4UDM6SSV084W7AJ3W');
INSERT INTO `tb_cidade` VALUES (94, 98, '74XCWUBQ3RPGE4GLEBJ6HIC2M2X0BD8ECC8');
INSERT INTO `tb_cidade` VALUES (30, 79, 'PM1KT8VSIEPI1N7R 88 XN3KFDGL7WAYU56');
INSERT INTO `tb_cidade` VALUES (12, 91, 'V818ORFJC7OWUCAN216 UKHY3QQUVHN12QI');
INSERT INTO `tb_cidade` VALUES (51, 61, 'X7P1GXC14YWPO1EF6HGL7S21JJD6P4J5WY1');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_controle_funcionalidade`
-- 

CREATE TABLE `tb_controle_funcionalidade` (
  `COD_CONTR_FUNC` int(11) NOT NULL auto_increment,
  `COD_FUNCIONARIO` int(11) default NULL,
  `NOME_CONTR_FUNC` varchar(20) NOT NULL,
  PRIMARY KEY  (`COD_CONTR_FUNC`),
  KEY `FK_FUNCIONARIO_CONTROLE_FUNCIONALIDADE` (`COD_FUNCIONARIO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_controle_funcionalidade`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_doenca`
-- 

CREATE TABLE `tb_doenca` (
  `COD_DOENCA` int(11) NOT NULL auto_increment,
  `COD_VAC` int(11) default NULL,
  `COD_CALEND` int(11) default NULL,
  `NOME_DOENCA` varchar(20) NOT NULL,
  `DESCRICAO_DOENCA` text NOT NULL,
  `DOENCA_EVITADA` text NOT NULL,
  PRIMARY KEY  (`COD_DOENCA`),
  KEY `FK_CALENDARIO_VACINA_DOENCA` (`COD_CALEND`),
  KEY `FK_VACINA_DOENCA` (`COD_VAC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_doenca`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_dose_vacina`
-- 

CREATE TABLE `tb_dose_vacina` (
  `COD_DOSE` int(11) NOT NULL auto_increment,
  `COD_VAC` int(11) default NULL,
  `DOSE` varchar(10) default NULL,
  PRIMARY KEY  (`COD_DOSE`),
  KEY `FK_VACINA_DOSE_VACINA` (`COD_VAC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_dose_vacina`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_email`
-- 

CREATE TABLE `tb_email` (
  `COD_EMAIL` int(11) NOT NULL auto_increment,
  `COD_FUNCIONARIO` int(11) default NULL,
  `COD_PAC` int(11) default NULL,
  `NOME_EMAIL` varchar(60) NOT NULL,
  PRIMARY KEY  (`COD_EMAIL`),
  KEY `FK_FUNCIONARIO_EMAIL` (`COD_FUNCIONARIO`),
  KEY `FK_PACIENTE_EMAIL` (`COD_PAC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_email`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_endereco`
-- 

CREATE TABLE `tb_endereco` (
  `COD_END` int(11) NOT NULL auto_increment,
  `COD_CID` int(11) default NULL,
  `COD_UN_SAUDE` int(11) default NULL,
  `ENDERECO` varchar(100) NOT NULL,
  `CEP` int(11) NOT NULL,
  `BAIRRO` varchar(45) NOT NULL,
  `NUMERO` int(11) default NULL,
  `COMPLEMENTO` varchar(60) default NULL,
  PRIMARY KEY  (`COD_END`),
  KEY `FK_ENDERECO_CIDADE` (`COD_CID`),
  KEY `FK_UNIDADE_SAUDE_ENDERECO2` (`COD_UN_SAUDE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_endereco`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_fabricante`
-- 

CREATE TABLE `tb_fabricante` (
  `COD_FABRIC` int(11) NOT NULL auto_increment,
  `NOME_FABRIC` varchar(30) NOT NULL,
  PRIMARY KEY  (`COD_FABRIC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_fabricante`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_funcao`
-- 

CREATE TABLE `tb_funcao` (
  `COD_FUNCAO` int(11) NOT NULL auto_increment,
  `NOME_FUNCAO` varchar(20) NOT NULL,
  PRIMARY KEY  (`COD_FUNCAO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_funcao`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_funcionario`
-- 

CREATE TABLE `tb_funcionario` (
  `COD_FUNCIONARIO` int(11) NOT NULL auto_increment,
  `COD_FUNCAO` int(11) default NULL,
  `COD_EMAIL` int(11) default NULL,
  `COD_CARGO` int(11) default NULL,
  `COD_PESSOA` int(11) default NULL,
  `MATRICULA` int(11) default NULL,
  PRIMARY KEY  (`COD_FUNCIONARIO`),
  KEY `FK_CARGO_FUNCIONARIO` (`COD_CARGO`),
  KEY `FK_FUNCAO_FUNCIONARIO` (`COD_FUNCAO`),
  KEY `FK_FUNCIONARIO_EMAIL2` (`COD_EMAIL`),
  KEY `FK_FUNCIONARIO_PESSOA2` (`COD_PESSOA`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_funcionario`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_historico_mensagem`
-- 

CREATE TABLE `tb_historico_mensagem` (
  `COD_HIST_MENS` int(11) NOT NULL auto_increment,
  `DT_MENS` datetime NOT NULL,
  `TEXTO_MENSAGEM` varchar(500) NOT NULL,
  PRIMARY KEY  (`COD_HIST_MENS`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_historico_mensagem`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_login`
-- 

CREATE TABLE `tb_login` (
  `COD_LOGIN` int(11) NOT NULL auto_increment,
  `COD_PAC` int(11) default NULL,
  `NOME_LOGIN` varchar(20) NOT NULL,
  `SENHA_LOGIN` varchar(10) NOT NULL,
  PRIMARY KEY  (`COD_LOGIN`),
  KEY `FK_LOGIN_PACIENTE2` (`COD_PAC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_login`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_lote`
-- 

CREATE TABLE `tb_lote` (
  `COD_LOTE` int(11) NOT NULL auto_increment,
  `NUM_LOTE` int(11) NOT NULL,
  `DT_VENC` date NOT NULL,
  `DT_FABRIC` date NOT NULL,
  PRIMARY KEY  (`COD_LOTE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_lote`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_mensagem`
-- 

CREATE TABLE `tb_mensagem` (
  `COD_MENS` int(11) NOT NULL auto_increment,
  `COD_TIPO_MENS` int(11) default NULL,
  `TEXTO_MENS` text NOT NULL,
  PRIMARY KEY  (`COD_MENS`),
  KEY `FK_MENSAGEM_TIPO_MENSAGEM` (`COD_TIPO_MENS`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_mensagem`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_paciente`
-- 

CREATE TABLE `tb_paciente` (
  `COD_PAC` int(11) NOT NULL auto_increment,
  `COD_LOGIN` int(11) default NULL,
  `COD_PESSOA` int(11) default NULL,
  `COD_STATUS` int(11) default NULL,
  `COD_EMAIL` int(11) default NULL,
  `COD_TIPO_PAC` int(11) default NULL,
  `COD_END` int(11) NOT NULL,
  PRIMARY KEY  (`COD_PAC`),
  KEY `FK_ENDERECO_PACIENTE` (`COD_END`),
  KEY `FK_LOGIN_PACIENTE` (`COD_LOGIN`),
  KEY `FK_PACIENTE_EMAIL2` (`COD_EMAIL`),
  KEY `FK_PACIENTE_PESSOA2` (`COD_PESSOA`),
  KEY `FK_STATUS_PACIENTE` (`COD_STATUS`),
  KEY `FK_TIPO_PAC_PACIENTE` (`COD_TIPO_PAC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_paciente`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_perf_login`
-- 

CREATE TABLE `tb_perf_login` (
  `COD_LOGIN` int(11) NOT NULL auto_increment,
  `TB__COD_LOGIN` int(11) default NULL,
  `TIPO_PERFIL` varchar(15) NOT NULL,
  PRIMARY KEY  (`COD_LOGIN`),
  KEY `FK_LOGIN_PERF_LOGIN` (`TB__COD_LOGIN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_perf_login`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_pessoa`
-- 

CREATE TABLE `tb_pessoa` (
  `COD_PESSOA` int(11) NOT NULL auto_increment,
  `COD_PAC` int(11) default NULL,
  `COD_FUNCIONARIO` int(11) default NULL,
  `NOME` varchar(100) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `NOME_MAE` varchar(100) NOT NULL,
  `NOME_PAI` varchar(100) default NULL,
  `SEXO` char(1) default NULL,
  `RG` varchar(20) NOT NULL,
  `ESTADO_CIVIL` varchar(10) default NULL,
  `DT_NASC` date default NULL,
  PRIMARY KEY  (`COD_PESSOA`),
  KEY `FK_FUNCIONARIO_PESSOA` (`COD_FUNCIONARIO`),
  KEY `FK_PACIENTE_PESSOA` (`COD_PAC`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Extraindo dados da tabela `tb_pessoa`
-- 

INSERT INTO `tb_pessoa` VALUES (1, NULL, NULL, 'ana', '1233', 'maria', 'joao', 'm', '1234', 'solteiro', '2013-02-25');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_status`
-- 

CREATE TABLE `tb_status` (
  `COD_STATUS` int(11) NOT NULL auto_increment,
  `COD_PAC` int(11) default NULL,
  `NOME_STATUS` varchar(10) NOT NULL,
  PRIMARY KEY  (`COD_STATUS`),
  KEY `FK_STATUS_PACIENTE2` (`COD_PAC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_status`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_telefone`
-- 

CREATE TABLE `tb_telefone` (
  `COD_TEL` int(11) NOT NULL auto_increment,
  `COD_TIPO_TEL` int(11) default NULL,
  `COD_PAC` int(11) default NULL,
  `NUM_TEL` int(11) NOT NULL,
  PRIMARY KEY  (`COD_TEL`),
  KEY `FK_PACIENTE_TELEFONE` (`COD_PAC`),
  KEY `FK_TELEFONE_TIPO_TELEFONE` (`COD_TIPO_TEL`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_telefone`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_tipo_calendario`
-- 

CREATE TABLE `tb_tipo_calendario` (
  `COD_TIPO_CALEND` int(11) NOT NULL auto_increment,
  `FAIXA_ETARIA` int(11) NOT NULL,
  `NOME_CALENDARIO` varchar(45) NOT NULL,
  PRIMARY KEY  (`COD_TIPO_CALEND`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_tipo_calendario`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_tipo_mensagem`
-- 

CREATE TABLE `tb_tipo_mensagem` (
  `COD_TIPO_MENS` int(11) NOT NULL auto_increment,
  `TIPO_MENS` varchar(15) NOT NULL,
  PRIMARY KEY  (`COD_TIPO_MENS`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_tipo_mensagem`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_tipo_paciente`
-- 

CREATE TABLE `tb_tipo_paciente` (
  `COD_TIPO_PAC` int(11) NOT NULL auto_increment,
  `TIPO_PAC` varchar(30) NOT NULL,
  PRIMARY KEY  (`COD_TIPO_PAC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_tipo_paciente`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_tipo_telefone`
-- 

CREATE TABLE `tb_tipo_telefone` (
  `COD_TIPO_TEL` int(11) NOT NULL auto_increment,
  `TIPO_TEL` varchar(15) NOT NULL,
  PRIMARY KEY  (`COD_TIPO_TEL`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_tipo_telefone`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_uf`
-- 

CREATE TABLE `tb_uf` (
  `COD_UF` int(11) NOT NULL auto_increment,
  `SIGLA_UF` char(2) NOT NULL,
  PRIMARY KEY  (`COD_UF`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=101 ;

-- 
-- Extraindo dados da tabela `tb_uf`
-- 

INSERT INTO `tb_uf` VALUES (33, ' 7');
INSERT INTO `tb_uf` VALUES (76, ' 8');
INSERT INTO `tb_uf` VALUES (69, ' 9');
INSERT INTO `tb_uf` VALUES (87, ' A');
INSERT INTO `tb_uf` VALUES (77, ' B');
INSERT INTO `tb_uf` VALUES (23, ' C');
INSERT INTO `tb_uf` VALUES (42, ' D');
INSERT INTO `tb_uf` VALUES (62, ' E');
INSERT INTO `tb_uf` VALUES (82, ' F');
INSERT INTO `tb_uf` VALUES (96, ' G');
INSERT INTO `tb_uf` VALUES (5, ' H');
INSERT INTO `tb_uf` VALUES (47, ' I');
INSERT INTO `tb_uf` VALUES (14, ' J');
INSERT INTO `tb_uf` VALUES (94, ' K');
INSERT INTO `tb_uf` VALUES (83, ' L');
INSERT INTO `tb_uf` VALUES (85, ' M');
INSERT INTO `tb_uf` VALUES (8, ' N');
INSERT INTO `tb_uf` VALUES (18, ' O');
INSERT INTO `tb_uf` VALUES (17, ' P');
INSERT INTO `tb_uf` VALUES (95, ' Q');
INSERT INTO `tb_uf` VALUES (4, ' R');
INSERT INTO `tb_uf` VALUES (29, ' S');
INSERT INTO `tb_uf` VALUES (79, ' T');
INSERT INTO `tb_uf` VALUES (13, ' U');
INSERT INTO `tb_uf` VALUES (57, ' V');
INSERT INTO `tb_uf` VALUES (39, ' W');
INSERT INTO `tb_uf` VALUES (38, ' X');
INSERT INTO `tb_uf` VALUES (45, ' Y');
INSERT INTO `tb_uf` VALUES (73, ' Z');
INSERT INTO `tb_uf` VALUES (30, '0');
INSERT INTO `tb_uf` VALUES (44, '00');
INSERT INTO `tb_uf` VALUES (34, '01');
INSERT INTO `tb_uf` VALUES (21, '02');
INSERT INTO `tb_uf` VALUES (80, '03');
INSERT INTO `tb_uf` VALUES (50, '04');
INSERT INTO `tb_uf` VALUES (9, '05');
INSERT INTO `tb_uf` VALUES (24, '06');
INSERT INTO `tb_uf` VALUES (72, '07');
INSERT INTO `tb_uf` VALUES (65, '08');
INSERT INTO `tb_uf` VALUES (71, '09');
INSERT INTO `tb_uf` VALUES (61, '0A');
INSERT INTO `tb_uf` VALUES (31, '0B');
INSERT INTO `tb_uf` VALUES (20, '0C');
INSERT INTO `tb_uf` VALUES (15, '0D');
INSERT INTO `tb_uf` VALUES (2, '0E');
INSERT INTO `tb_uf` VALUES (11, '0F');
INSERT INTO `tb_uf` VALUES (68, '0G');
INSERT INTO `tb_uf` VALUES (89, '0H');
INSERT INTO `tb_uf` VALUES (56, '0I');
INSERT INTO `tb_uf` VALUES (78, '0J');
INSERT INTO `tb_uf` VALUES (64, '0K');
INSERT INTO `tb_uf` VALUES (81, '0L');
INSERT INTO `tb_uf` VALUES (1, '0M');
INSERT INTO `tb_uf` VALUES (26, '0N');
INSERT INTO `tb_uf` VALUES (43, '0O');
INSERT INTO `tb_uf` VALUES (16, '0P');
INSERT INTO `tb_uf` VALUES (37, '0Q');
INSERT INTO `tb_uf` VALUES (74, '0R');
INSERT INTO `tb_uf` VALUES (99, '0S');
INSERT INTO `tb_uf` VALUES (32, '0T');
INSERT INTO `tb_uf` VALUES (28, '0U');
INSERT INTO `tb_uf` VALUES (55, '0V');
INSERT INTO `tb_uf` VALUES (25, '0W');
INSERT INTO `tb_uf` VALUES (46, '0X');
INSERT INTO `tb_uf` VALUES (53, '0Y');
INSERT INTO `tb_uf` VALUES (49, '0Z');
INSERT INTO `tb_uf` VALUES (88, '1');
INSERT INTO `tb_uf` VALUES (60, '10');
INSERT INTO `tb_uf` VALUES (70, '11');
INSERT INTO `tb_uf` VALUES (41, '12');
INSERT INTO `tb_uf` VALUES (90, '13');
INSERT INTO `tb_uf` VALUES (22, '14');
INSERT INTO `tb_uf` VALUES (6, '15');
INSERT INTO `tb_uf` VALUES (58, '16');
INSERT INTO `tb_uf` VALUES (27, '17');
INSERT INTO `tb_uf` VALUES (91, '18');
INSERT INTO `tb_uf` VALUES (10, '19');
INSERT INTO `tb_uf` VALUES (84, '1A');
INSERT INTO `tb_uf` VALUES (93, '1B');
INSERT INTO `tb_uf` VALUES (59, '1C');
INSERT INTO `tb_uf` VALUES (100, '1D');
INSERT INTO `tb_uf` VALUES (36, '1E');
INSERT INTO `tb_uf` VALUES (51, '1F');
INSERT INTO `tb_uf` VALUES (67, '1G');
INSERT INTO `tb_uf` VALUES (19, '1H');
INSERT INTO `tb_uf` VALUES (66, '1I');
INSERT INTO `tb_uf` VALUES (86, '1J');
INSERT INTO `tb_uf` VALUES (40, '1K');
INSERT INTO `tb_uf` VALUES (52, '1L');
INSERT INTO `tb_uf` VALUES (98, '1M');
INSERT INTO `tb_uf` VALUES (92, '1N');
INSERT INTO `tb_uf` VALUES (48, '1O');
INSERT INTO `tb_uf` VALUES (97, '');
INSERT INTO `tb_uf` VALUES (75, ' 0');
INSERT INTO `tb_uf` VALUES (3, ' 1');
INSERT INTO `tb_uf` VALUES (63, ' 2');
INSERT INTO `tb_uf` VALUES (7, ' 3');
INSERT INTO `tb_uf` VALUES (12, ' 4');
INSERT INTO `tb_uf` VALUES (35, ' 5');
INSERT INTO `tb_uf` VALUES (54, ' 6');

-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_unidade_saude`
-- 

CREATE TABLE `tb_unidade_saude` (
  `COD_UN_SAUDE` int(11) NOT NULL auto_increment,
  `COD_END` int(11) default NULL,
  `NOME_UN_SAUDE` varchar(30) NOT NULL,
  `NUM_UN_SAUDE` int(11) NOT NULL,
  PRIMARY KEY  (`COD_UN_SAUDE`),
  KEY `FK_UNIDADE_SAUDE_ENDERECO` (`COD_END`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_unidade_saude`
-- 


-- --------------------------------------------------------

-- 
-- Estrutura da tabela `tb_vacina`
-- 

CREATE TABLE `tb_vacina` (
  `COD_VAC` int(11) NOT NULL auto_increment,
  `COD_CALEND` int(11) default NULL,
  `COD_CARTAO_VAC` int(11) default NULL,
  `COD_CAMP` int(11) default NULL,
  `NOME_VAC` varchar(60) NOT NULL,
  PRIMARY KEY  (`COD_VAC`),
  KEY `FK_CALENDARIO_VACINA_VACINA` (`COD_CALEND`),
  KEY `FK_CARTAO_VACINA_VACINA` (`COD_CARTAO_VAC`),
  KEY `FK_VACINA_CAMPANHA` (`COD_CAMP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Extraindo dados da tabela `tb_vacina`
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

