<?php

class App_Model_CartaoVacina extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_cartao_vacina';
    protected $_primary = 'cod_cartao_vac';

    public function save($data) {

        $data['dt_vac_aplicada'] = date('Y-m-d', strtotime($data['dt_vac_aplicada']));
        $data['dt_aprazada'] = date('Y-m-d', strtotime($data['dt_aprazada']));

        return parent::save($data);
    }
    
}

