INSERT INTO `tb_calendario_vacina` (`cod_calend`, `dt_public_calend`) VALUES
(NULL, '2013-04-02');

INSERT INTO `tb_cartao_vacina` (`cod_cartao_vac`, `cod_un_saude`, `dt_vac_aplicada`, `dt_aprazada`) VALUES
(NULL, 1, '2013-04-02', '2013-04-02');

INSERT INTO `db_simova`.`tb_campanha` (`cod_camp`, `nome_camp`, `dt_inicial_camp`, `dt_final_camp`, `dt_public_camp`) VALUES 
(NULL, 'Contra HPV', '2013-04-01', '2013-04-06', '2013-04-01');

INSERT INTO `db_simova`.`tb_vacina` (`cod_vac`, `cod_calend`, `cod_camp`, `cod_cartao_vac`, `nome_vac`) VALUES 
(NULL, '1', '1', '1', 'BCG');

INSERT INTO `db_simova`.`tb_doenca` (`cod_doenca`, `cod_vac`, `cod_calend`, `nome_doenca`, `descricao_doenca`, `doenca_evitada`) VALUES 
(NULL, '3', '1', 'Hepatite', 'Evita a doença', 'HPV');