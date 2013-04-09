<?php

class App_Model_UnidadeSaude extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_unidade_saude';
    protected $_primary = 'cod_un_saude';

    public function save($data){
        $this->_primary = 'cod_un_saude';
        
        return parent::save($data);
    }
}

