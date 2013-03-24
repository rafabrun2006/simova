<?php

/**
 * Description of Pessoa
 *
 * @author bruno
 */
class App_Model_Paciente extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_paciente';
    protected $_primary = 'cod_pac';

    public function listPaciente($where = NULL) {
        $query = $this->select()
                ->from(array('pc' => 'tb_paciente'))
                ->joinInner(array('p' => 'tb_pessoa'), 'p.cod_pessoa = pc.cod_pessoa', array('*'))
                ->setIntegrityCheck(false)
        ;

        if ($where['tipoConsulta']) {
            $query->where($where['tipoConsulta'] . " like ?", "%{$where['search']}%");
        }

        return $this->fetchAll($query);
    }

}