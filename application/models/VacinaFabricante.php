<?php

class App_Model_VacinaFabricante extends Simova_Mapper_ModelMapper
{
    
    protected $_name = 'tb_vacina_fabricante';
    protected $_primary = 'cod_vacina_fabricante';

    public function save($data){
        
        $this->_primary = 'cod_vacina_fabricante';
        
        return parent::save($data);
    }
    
}

