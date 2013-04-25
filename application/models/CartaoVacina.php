<?php

class App_Model_CartaoVacina extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_cartao_vacina';
    protected $_primary = 'cod_cartao_vacina';

    public function save($data) {

        $data['dt_vacina'] = date('Y-m-d', strtotime($data['dt_vacina']));

        return parent::save($data);
    }

    public function vacAplicBetweenIdade($idadeMin, $idadeMax, $where = array()) {
        echo $query = $this->select()
                ->from(array('cv' => 'tb_cartao_vacina'), array('*'))
                ->joinLeft(array('va' => 'tb_vacina_aplicada'), 'cv.cod_cartao_vacina = va.cod_cartao_vacina', array('*'))
                ->joinRight(array('v' => 'tb_vacina'), 'v.cod_vacina = cv.cod_vacina', array('*'))
                ->setIntegrityCheck(false);

        if ($where) {
            foreach ($where as $key => $value) {
                $query->where($key . ' = ' . $value);
            }
        }

        return $this->fetchAll($query);
    }

}

