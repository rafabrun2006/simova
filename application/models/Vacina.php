<?php

class App_Model_Vacina extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_vacina';
    protected $_primary = 'cod_vac';

    public function joinAllRelations($where = array()) {
        $query = $this->select()
                ->from(array('v' => 'tb_vacina'), array('*'))
                ->join(array('lv' => 'tb_lote_vacina'), 'lv.cod_vacina = v.cod_vac', array('*'))
                ->join(array('l' => 'tb_lote'), 'l.cod_lote = lv.cod_lote', array('*'))
                ->join(array('vf' => 'tb_vacina_fabricante'), 'vf.cod_vac = v.cod_vac', array('*'))
                ->join(array('f' => 'tb_fabricante'), 'f.cod_fabric = vf.cod_fabric', array('*'))
                ->setIntegrityCheck(FALSE)
        ;

        foreach ($where as $key => $value) {
            $query->where($key . ' = ?', $value);
        }

        //echo $query;
        
        return $this->fetchAll($query);
    }

}

