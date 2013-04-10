<?php

class App_Model_Vacina extends Simova_Mapper_ModelMapper
{
    
    protected $_name = 'tb_vacina';
    protected $_primary = 'cod_vac';

    public function joinLoteVacina(){
        $query = $this->select()
                ->from(array('v' => 'tb_vacina'), array('*'))
                ->join(array('lv' => 'tb_lote_vacina'), 'lv.cod_vacina = v.cod_vac', array('*'))
                ->join(array('l' => 'tb_lote'), 'l.cod_lote = lv.cod_lote', array('*'))
                ->setIntegrityCheck(FALSE)
                ;
                
        return $this->fetchAll($query);
    }
    
}

