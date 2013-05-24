<?php

class App_Model_Lote extends Simova_Mapper_ModelMapper
{
    
    protected $_name = 'tb_lote';
    protected $_primary = 'cod_lote';
    
    public function save($data){
        
        $this->_primary = 'cod_lote';
        
        $data['dt_venc'] = Simova_Date::dateToBanco($data['dt_venc']);
        $data['dt_fabric'] = Simova_Date::dateToBanco($data['dt_fabric']);
        
        return parent::save($data);
    }

}

