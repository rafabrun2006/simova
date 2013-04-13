<?php

class App_Model_Lote extends Simova_Mapper_ModelMapper
{
    
    protected $_name = 'tb_lote';
    protected $_primary = 'cod_lote';
    
    public function save($data){
        
        $data['dt_venc'] = date('Y/m/d', strtotime($data['dt_venc']));
        $data['dt_fabric'] = date('Y/m/d', strtotime($data['dt_fabric']));
        
        return parent::save($data);
    }

}

