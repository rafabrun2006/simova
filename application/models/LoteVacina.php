<?php

class App_Model_LoteVacina extends Simova_Mapper_ModelMapper
{
    
    protected $_name = 'tb_lote_vacina';
    protected $_primary = 'cod_lote_vacina';

    public function save($data){
        
        $this->_primary = 'cod_lote_vacina';
        
        return parent::save($data);
    }
    
}

