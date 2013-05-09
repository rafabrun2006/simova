<?php

class App_Model_CartaoVacina extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_cartao_vacina';
    protected $_primary = 'cod_cartao_vacina';

    public function save($data) {

        $data['dt_vacina'] = date('Y-m-d', strtotime($data['dt_vacina']));

        return parent::save($data);
    }

    public function vacAplicBetweenIdade(array $where = null, array $whereLike = null) {
        echo $query = $this->select()
                ->from(array('cv' => 'tb_cartao_vacina'), array('*'))
                ->joinLeft(array('va' => 'tb_vacina_aplicada'), 'cv.cod_cartao_vacina = va.cod_cartao_vacina', array('matricula', 'lote'))
                ->joinRight(array('v' => 'tb_vacina'), 'v.cod_vacina = cv.cod_vacina', array('*'))
                ->join(array('u' => 'tb_unidade_saude'), 'u.cod_un_saude = cv.cod_un_saude', array('*'))
                ->order('cv.cod_vacina')
                ->setIntegrityCheck(false);

        if ($where) {
            foreach ($where as $key => $value) {
                $query->where($key . ' = ' . $value);
            }
        }

        if ($whereLike) {
            foreach ($whereLike as $key => $value) {
                if (!empty($key)) {
                    $query->where($key . ' like ' . "'%{$value}%'");
                }
            }
        }

        //echo $query;
        return $this->fetchAll($query);
    }

}

