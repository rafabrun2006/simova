<?php

class App_Model_Vacina extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_vacina';
    protected $_primary = 'cod_vacina';

    public function joinAllRelations($where = array()) {
        $query = $this->select()
                ->from(array('v' => 'tb_vacina'), array('*'))
                ->join(array('lv' => 'tb_lote_vacina'), 'lv.cod_vacina = v.cod_vacina', array('cod_lote', 'cod_lote_vacina', 'qtd_vacina'))
                ->join(array('l' => 'tb_lote'), 'l.cod_lote = lv.cod_lote', array('num_lote', 'dt_venc', 'dt_fabric'))
                ->join(array('vf' => 'tb_vacina_fabricante'), 'vf.cod_vacina = v.cod_vacina', array('cod_fabric'))
                ->join(array('f' => 'tb_fabricante'), 'f.cod_fabric = vf.cod_fabric', array('nome_fabric'))
                ->setIntegrityCheck(FALSE)
        ;

        foreach ($where as $key => $value) {
            $query->where($key . ' = ?', $value);
        }

        //echo $query;
        
        return $this->fetchAll($query);
    }

    public function save($data){
        
        $this->_primary = 'cod_vacina';
        
        return parent::save($data);
    }
}

