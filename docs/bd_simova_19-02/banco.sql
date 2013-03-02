drop table if exists LOTE_VACINA;

drop table if exists PACIENTE_MENSAGEM;

drop table if exists TB_BANNER;

drop table if exists TB_CALENDARIO_VACINA;

drop table if exists TB_CAMPANHA;

drop table if exists TB_CARGO;

drop table if exists TB_CARTAO_VACINA;

drop table if exists TB_CIDADE;

drop table if exists TB_CONTROLE_FUNCIONALIDADE;

drop table if exists TB_DOENCA;

drop table if exists TB_DOSE_VACINA;

drop table if exists TB_EMAIL;

drop table if exists TB_ENDERECO;

drop table if exists TB_FABRICANTE;

drop table if exists TB_FUNCAO;

drop table if exists TB_FUNCIONARIO;

drop table if exists TB_HISTORICO_MENSAGEM;

drop table if exists TB_LOGIN;

drop table if exists TB_LOTE;

drop table if exists TB_MENSAGEM;

drop table if exists TB_PACIENTE;

drop table if exists TB_PERF_LOGIN;

drop table if exists TB_PESSOA;

drop table if exists TB_STATUS;

drop table if exists TB_TELEFONE;

drop table if exists TB_TIPO_CALENDARIO;

drop table if exists TB_TIPO_MENSAGEM;

drop table if exists TB_TIPO_PACIENTE;

drop table if exists TB_TIPO_TELEFONE;

drop table if exists TB_UF;

drop table if exists TB_UNIDADE_SAUDE;

drop table if exists TB_VACINA;

drop table if exists VACINA_FABRICANTE;

/*==============================================================*/
/* Table: LOTE_VACINA                                           */
/*==============================================================*/
create table LOTE_VACINA
(
   COD_LOTE             int not null,
   COD_VAC              int not null,
   primary key (COD_LOTE, COD_VAC)
);

/*==============================================================*/
/* Table: PACIENTE_MENSAGEM                                     */
/*==============================================================*/
create table PACIENTE_MENSAGEM
(
   COD_PAC              int not null,
   COD_MENS             int not null,
   primary key (COD_PAC, COD_MENS)
);

/*==============================================================*/
/* Table: TB_BANNER                                             */
/*==============================================================*/
create table TB_BANNER
(
   COD_BANNER           int not null,
   COD_FUNCIONARIO      int,
   ATIVO                int not null,
   FOTO                 varchar(45) not null,
   primary key (COD_BANNER)
);

/*==============================================================*/
/* Table: TB_CALENDARIO_VACINA                                  */
/*==============================================================*/
create table TB_CALENDARIO_VACINA
(
   COD_CALEND           int not null,
   COD_TIPO_CALEND      int,
   DT_PUBLIC_CALEND     date not null,
   NOME_CALEND          varchar(45) not null,
   primary key (COD_CALEND)
);

/*==============================================================*/
/* Table: TB_CAMPANHA                                           */
/*==============================================================*/
create table TB_CAMPANHA
(
   COD_CAMP             int not null,
   NOME_CAMP            varchar(100) not null,
   DT_INICIAL_CAMP      date not null,
   DT_FINAL_CAMP        date not null,
   VAL_CAMP_CAMP        date not null,
   DT_PUBLIC_CAMP       date not null,
   primary key (COD_CAMP)
);

/*==============================================================*/
/* Table: TB_CARGO                                              */
/*==============================================================*/
create table TB_CARGO
(
   COD_CARGO            int not null,
   NOME_CARGO           varchar(20) not null,
   primary key (COD_CARGO)
);

/*==============================================================*/
/* Table: TB_CARTAO_VACINA                                      */
/*==============================================================*/
create table TB_CARTAO_VACINA
(
   COD_CARTAO_VAC       int not null,
   COD_PAC              int,
   COD_UN_SAUDE         int,
   DT_VAC_APLICADA      date not null,
   DT_APRAZADA          date not null,
   primary key (COD_CARTAO_VAC)
);

/*==============================================================*/
/* Table: TB_CIDADE                                             */
/*==============================================================*/
create table TB_CIDADE
(
   COD_CID              int not null,
   COD_UF               int not null,
   NOME_CID             varchar(35) not null,
   primary key (COD_CID)
);

/*==============================================================*/
/* Table: TB_CONTROLE_FUNCIONALIDADE                            */
/*==============================================================*/
create table TB_CONTROLE_FUNCIONALIDADE
(
   COD_CONTR_FUNC       int not null,
   COD_FUNCIONARIO      int,
   NOME_CONTR_FUNC      varchar(20) not null,
   primary key (COD_CONTR_FUNC)
);

/*==============================================================*/
/* Table: TB_DOENCA                                             */
/*==============================================================*/
create table TB_DOENCA
(
   COD_DOENCA           int not null,
   COD_VAC              int,
   COD_CALEND           int,
   NOME_DOENCA          varchar(20) not null,
   DESCRICAO_DOENCA     text not null,
   DOENCA_EVITADA       text not null,
   primary key (COD_DOENCA)
);

/*==============================================================*/
/* Table: TB_DOSE_VACINA                                        */
/*==============================================================*/
create table TB_DOSE_VACINA
(
   COD_DOSE             int not null,
   COD_VAC              int,
   DOSE                 varchar(10),
   primary key (COD_DOSE)
);

/*==============================================================*/
/* Table: TB_EMAIL                                              */
/*==============================================================*/
create table TB_EMAIL
(
   COD_EMAIL            int not null,
   COD_FUNCIONARIO      int,
   COD_PAC              int,
   NOME_EMAIL           varchar(60) not null,
   primary key (COD_EMAIL)
);

/*==============================================================*/
/* Table: TB_ENDERECO                                           */
/*==============================================================*/
create table TB_ENDERECO
(
   COD_END              int not null,
   COD_CID              int,
   COD_UN_SAUDE         int,
   ENDERECO             varchar(100) not null,
   CEP                  int not null,
   BAIRRO               varchar(45) not null,
   NUMERO               int,
   COMPLEMENTO          varchar(60),
   primary key (COD_END)
);

/*==============================================================*/
/* Table: TB_FABRICANTE                                         */
/*==============================================================*/
create table TB_FABRICANTE
(
   COD_FABRIC           int not null,
   NOME_FABRIC          varchar(30) not null,
   primary key (COD_FABRIC)
);

/*==============================================================*/
/* Table: TB_FUNCAO                                             */
/*==============================================================*/
create table TB_FUNCAO
(
   COD_FUNCAO           int not null,
   NOME_FUNCAO          varchar(20) not null,
   primary key (COD_FUNCAO)
);

/*==============================================================*/
/* Table: TB_FUNCIONARIO                                        */
/*==============================================================*/
create table TB_FUNCIONARIO
(
   COD_FUNCIONARIO      int not null,
   COD_FUNCAO           int,
   COD_EMAIL            int,
   COD_CARGO            int,
   COD_PESSOA           int,
   MATRICULA            int,
   primary key (COD_FUNCIONARIO)
);

/*==============================================================*/
/* Table: TB_HISTORICO_MENSAGEM                                 */
/*==============================================================*/
create table TB_HISTORICO_MENSAGEM
(
   COD_HIST_MENS        int not null,
   DT_MENS              datetime not null,
   TEXTO_MENS           varchar(500) not null,
   primary key (COD_HIST_MENS)
);

/*==============================================================*/
/* Table: TB_LOGIN                                              */
/*==============================================================*/
create table TB_LOGIN
(
   COD_LOG              int not null,
   COD_PAC              int,
   NOME_LOG             varchar(20) not null,
   SENHA_LOG            varchar(10) not null,
   primary key (COD_LOG)
);

/*==============================================================*/
/* Table: TB_LOTE                                               */
/*==============================================================*/
create table TB_LOTE
(
   COD_LOTE             int not null,
   NUM_LOTE             int not null,
   DT_VENC              date not null,
   DT_FABRIC            date not null,
   primary key (COD_LOTE)
);

/*==============================================================*/
/* Table: TB_MENSAGEM                                           */
/*==============================================================*/
create table TB_MENSAGEM
(
   COD_MENS             int not null,
   COD_TIPO_MENS        int,
   TEXTO_MENS           text not null,
   primary key (COD_MENS)
);

/*==============================================================*/
/* Table: TB_PACIENTE                                           */
/*==============================================================*/
create table TB_PACIENTE
(
   COD_PAC              int not null,
   COD_LOG              int,
   COD_PESSOA           int,
   COD_STATUS           int,
   COD_EMAIL            int,
   COD_TIPO_PAC         int,
   COD_END              int not null,
   primary key (COD_PAC)
);

/*==============================================================*/
/* Table: TB_PERF_LOGIN                                         */
/*==============================================================*/
create table TB_PERF_LOGIN
(
   COD_LOGIN            int not null,
   COD_LOG              int,
   TIPO_PERFIL          varchar(15) not null,
   primary key (COD_LOGIN)
);

/*==============================================================*/
/* Table: TB_PESSOA                                             */
/*==============================================================*/
create table TB_PESSOA
(
   COD_PESSOA           int not null,
   COD_PAC              int,
   COD_FUNCIONARIO      int,
   NOME                 varchar(100) not null,
   CPF                  varchar(14) not null,
   NOME_MAE             varchar(100) not null,
   NOME_PAI             varchar(100),
   SEXO                 char(1),
   RG                   varchar(20) not null,
   ESTADO_CIVIL         varchar(10),
   DT_NASC              date,
   primary key (COD_PESSOA)
);

/*==============================================================*/
/* Table: TB_STATUS                                             */
/*==============================================================*/
create table TB_STATUS
(
   COD_STATUS           int not null,
   COD_PAC              int,
   NOME_STATUS          varchar(10) not null,
   primary key (COD_STATUS)
);

/*==============================================================*/
/* Table: TB_TELEFONE                                           */
/*==============================================================*/
create table TB_TELEFONE
(
   COD_TEL              int not null,
   COD_TIPO_TEL         int,
   COD_PAC              int,
   NUM_TEL              int not null,
   primary key (COD_TEL)
);

/*==============================================================*/
/* Table: TB_TIPO_CALENDARIO                                    */
/*==============================================================*/
create table TB_TIPO_CALENDARIO
(
   COD_TIPO_CALEND      int not null,
   FAIXA_ETARIA         int not null,
   NOME_CALEND          varchar(45) not null,
   primary key (COD_TIPO_CALEND)
);

/*==============================================================*/
/* Table: TB_TIPO_MENSAGEM                                      */
/*==============================================================*/
create table TB_TIPO_MENSAGEM
(
   COD_TIPO_MENS        int not null,
   TIPO_MENS            varchar(15) not null,
   primary key (COD_TIPO_MENS)
);

/*==============================================================*/
/* Table: TB_TIPO_PACIENTE                                      */
/*==============================================================*/
create table TB_TIPO_PACIENTE
(
   COD_TIPO_PAC         int not null,
   TIPO_PAC             varchar(30) not null,
   primary key (COD_TIPO_PAC)
);

/*==============================================================*/
/* Table: TB_TIPO_TELEFONE                                      */
/*==============================================================*/
create table TB_TIPO_TELEFONE
(
   COD_TIPO_TEL         int not null,
   TIPO_TEL             varchar(15) not null,
   primary key (COD_TIPO_TEL)
);

/*==============================================================*/
/* Table: TB_UF                                                 */
/*==============================================================*/
create table TB_UF
(
   COD_UF               int not null,
   SIGLA_UF             char(2) not null,
   primary key (COD_UF)
);

/*==============================================================*/
/* Table: TB_UNIDADE_SAUDE                                      */
/*==============================================================*/
create table TB_UNIDADE_SAUDE
(
   COD_UN_SAUDE         int not null,
   COD_END              int,
   NOME_UN_SAUDE        varchar(30) not null,
   NUM_UN_SAUDE         int not null,
   primary key (COD_UN_SAUDE)
);

/*==============================================================*/
/* Table: TB_VACINA                                             */
/*==============================================================*/
create table TB_VACINA
(
   COD_VAC              int not null,
   COD_CALEND           int,
   COD_CARTAO_VAC       int,
   COD_CAMP             int,
   NOME_VAC             varchar(60) not null,
   primary key (COD_VAC)
);

/*==============================================================*/
/* Table: VACINA_FABRICANTE                                     */
/*==============================================================*/
create table VACINA_FABRICANTE
(
   COD_VAC              int not null,
   COD_FABRIC           int not null,
   primary key (COD_VAC, COD_FABRIC)
);

alter table LOTE_VACINA add constraint FK_LOTE_VACINA foreign key (COD_LOTE)
      references TB_LOTE (COD_LOTE) on delete restrict on update restrict;

alter table LOTE_VACINA add constraint FK_LOTE_VACINA2 foreign key (COD_VAC)
      references TB_VACINA (COD_VAC) on delete restrict on update restrict;

alter table PACIENTE_MENSAGEM add constraint FK_PACIENTE_MENSAGEM foreign key (COD_PAC)
      references TB_PACIENTE (COD_PAC) on delete restrict on update restrict;

alter table PACIENTE_MENSAGEM add constraint FK_PACIENTE_MENSAGEM2 foreign key (COD_MENS)
      references TB_MENSAGEM (COD_MENS) on delete restrict on update restrict;

alter table TB_BANNER add constraint FK_BANNER_FUNCIONARIO foreign key (COD_FUNCIONARIO)
      references TB_FUNCIONARIO (COD_FUNCIONARIO) on delete restrict on update restrict;

alter table TB_CALENDARIO_VACINA add constraint FK_CALENDARIO_VACINA_TIPO_CALENDARIO foreign key (COD_TIPO_CALEND)
      references TB_TIPO_CALENDARIO (COD_TIPO_CALEND) on delete restrict on update restrict;

alter table TB_CARTAO_VACINA add constraint FK_PACIENTE_CARTAO_VACINA foreign key (COD_PAC)
      references TB_PACIENTE (COD_PAC) on delete restrict on update restrict;

alter table TB_CARTAO_VACINA add constraint FK_UNIDADE_SAUDE_CARTAO_VACINA foreign key (COD_UN_SAUDE)
      references TB_UNIDADE_SAUDE (COD_UN_SAUDE) on delete restrict on update restrict;

alter table TB_CIDADE add constraint FK_UF_CIDADE foreign key (COD_UF)
      references TB_UF (COD_UF) on delete restrict on update restrict;

alter table TB_CONTROLE_FUNCIONALIDADE add constraint FK_FUNCIONARIO_CONTROLE_FUNCIONALIDADE foreign key (COD_FUNCIONARIO)
      references TB_FUNCIONARIO (COD_FUNCIONARIO) on delete restrict on update restrict;

alter table TB_DOENCA add constraint FK_CALENDARIO_VACINA_DOENCA foreign key (COD_CALEND)
      references TB_CALENDARIO_VACINA (COD_CALEND) on delete restrict on update restrict;

alter table TB_DOENCA add constraint FK_VACINA_DOENCA foreign key (COD_VAC)
      references TB_VACINA (COD_VAC) on delete restrict on update restrict;

alter table TB_DOSE_VACINA add constraint FK_VACINA_DOSE_VACINA foreign key (COD_VAC)
      references TB_VACINA (COD_VAC) on delete restrict on update restrict;

alter table TB_EMAIL add constraint FK_FUNCIONARIO_EMAIL foreign key (COD_FUNCIONARIO)
      references TB_FUNCIONARIO (COD_FUNCIONARIO) on delete restrict on update restrict;

alter table TB_EMAIL add constraint FK_PACIENTE_EMAIL foreign key (COD_PAC)
      references TB_PACIENTE (COD_PAC) on delete restrict on update restrict;

alter table TB_ENDERECO add constraint FK_ENDERECO_CIDADE foreign key (COD_CID)
      references TB_CIDADE (COD_CID) on delete restrict on update restrict;

alter table TB_ENDERECO add constraint FK_RELATIONSHIP_29 foreign key (COD_UN_SAUDE)
      references TB_UNIDADE_SAUDE (COD_UN_SAUDE) on delete restrict on update restrict;

alter table TB_FUNCIONARIO add constraint FK_CARGO_FUNCIONARIO foreign key (COD_CARGO)
      references TB_CARGO (COD_CARGO) on delete restrict on update restrict;

alter table TB_FUNCIONARIO add constraint FK_FUNCAO_FUNCIONARIO foreign key (COD_FUNCAO)
      references TB_FUNCAO (COD_FUNCAO) on delete restrict on update restrict;

alter table TB_FUNCIONARIO add constraint FK_FUNCIONARIO_EMAIL2 foreign key (COD_EMAIL)
      references TB_EMAIL (COD_EMAIL) on delete restrict on update restrict;

alter table TB_FUNCIONARIO add constraint FK_FUNCIONARIO_PESSOA2 foreign key (COD_PESSOA)
      references TB_PESSOA (COD_PESSOA) on delete restrict on update restrict;

alter table TB_LOGIN add constraint FK_LOGIN_PACIENTE2 foreign key (COD_PAC)
      references TB_PACIENTE (COD_PAC) on delete restrict on update restrict;

alter table TB_MENSAGEM add constraint FK_MENSAGEM_TIPO_MENSAGEM foreign key (COD_TIPO_MENS)
      references TB_TIPO_MENSAGEM (COD_TIPO_MENS) on delete restrict on update restrict;

alter table TB_PACIENTE add constraint FK_ENDERECO_PACIENTE foreign key (COD_END)
      references TB_ENDERECO (COD_END) on delete restrict on update restrict;

alter table TB_PACIENTE add constraint FK_LOGIN_PACIENTE foreign key (COD_LOG)
      references TB_LOGIN (COD_LOG) on delete restrict on update restrict;

alter table TB_PACIENTE add constraint FK_PACIENTE_EMAIL2 foreign key (COD_EMAIL)
      references TB_EMAIL (COD_EMAIL) on delete restrict on update restrict;

alter table TB_PACIENTE add constraint FK_PACIENTE_PESSOA2 foreign key (COD_PESSOA)
      references TB_PESSOA (COD_PESSOA) on delete restrict on update restrict;

alter table TB_PACIENTE add constraint FK_STATUS_PACIENTE foreign key (COD_STATUS)
      references TB_STATUS (COD_STATUS) on delete restrict on update restrict;

alter table TB_PACIENTE add constraint FK_TIPO_PAC_PACIENTE foreign key (COD_TIPO_PAC)
      references TB_TIPO_PACIENTE (COD_TIPO_PAC) on delete restrict on update restrict;

alter table TB_PERF_LOGIN add constraint FK_LOGIN_PERF_LOGIN foreign key (COD_LOG)
      references TB_LOGIN (COD_LOG) on delete restrict on update restrict;

alter table TB_PESSOA add constraint FK_FUNCIONARIO_PESSOA foreign key (COD_FUNCIONARIO)
      references TB_FUNCIONARIO (COD_FUNCIONARIO) on delete restrict on update restrict;

alter table TB_PESSOA add constraint FK_PACIENTE_PESSOA foreign key (COD_PAC)
      references TB_PACIENTE (COD_PAC) on delete restrict on update restrict;

alter table TB_STATUS add constraint FK_STATUS_PACIENTE2 foreign key (COD_PAC)
      references TB_PACIENTE (COD_PAC) on delete restrict on update restrict;

alter table TB_TELEFONE add constraint FK_PACIENTE_TELEFONE foreign key (COD_PAC)
      references TB_PACIENTE (COD_PAC) on delete restrict on update restrict;

alter table TB_TELEFONE add constraint FK_TELEFONE_TIPO_TELEFONE foreign key (COD_TIPO_TEL)
      references TB_TIPO_TELEFONE (COD_TIPO_TEL) on delete restrict on update restrict;

alter table TB_UNIDADE_SAUDE add constraint FK_RELATIONSHIP_28 foreign key (COD_END)
      references TB_ENDERECO (COD_END) on delete restrict on update restrict;

alter table TB_VACINA add constraint FK_CALENDARIO_VACINA_VACINA foreign key (COD_CALEND)
      references TB_CALENDARIO_VACINA (COD_CALEND) on delete restrict on update restrict;

alter table TB_VACINA add constraint FK_CARTAO_VACINA_VACINA foreign key (COD_CARTAO_VAC)
      references TB_CARTAO_VACINA (COD_CARTAO_VAC) on delete restrict on update restrict;

alter table TB_VACINA add constraint FK_VACINA_CAMPANHA foreign key (COD_CAMP)
      references TB_CAMPANHA (COD_CAMP) on delete restrict on update restrict;

alter table VACINA_FABRICANTE add constraint FK_VACINA_FABRICANTE foreign key (COD_VAC)
      references TB_VACINA (COD_VAC) on delete restrict on update restrict;

alter table VACINA_FABRICANTE add constraint FK_VACINA_FABRICANTE2 foreign key (COD_FABRIC)
      references TB_FABRICANTE (COD_FABRIC) on delete restrict on update restrict;
