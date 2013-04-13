<?php

class App_Model_Fabricante extends Simova_Mapper_ModelMapper
{
    
    protected $_name = 'tb_fabricante';
    protected $_primary = 'cod_fabric';

    public function save($data){
        
        $this->_primary = 'cod_fabric';
        
        return parent::save($data);
    }
    
}

