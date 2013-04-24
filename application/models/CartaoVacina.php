<?php

class App_Model_CartaoVacina extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_cartao_vacina';
    protected $_primary = 'cod_cartao_vacina';

    public function save($data) {

        $data['dt_vacina'] = date('Y-m-d', strtotime($data['dt_vacina']));

        return parent::save($data);
    }
    
}

