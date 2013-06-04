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

        $where['tipoConsulta'] == 'cod_sit' ?
                        $query->where('cod_sit = ?', $where['search']) : $query->where('cod_sit = ?', TRUE);
        
        if ($where['tipoConsulta']) {
            $query->where($where['tipoConsulta'] . " like ?", "%{$where['search']}%");
        }

        return $this->fetchAll($query);
    }

    public function getArrayById($cod_pessoa){
        
        $query = $this->select()
                ->from(array('pc' => 'tb_paciente'), array('*'))
                ->join(array('p' => 'tb_pessoa'), 'pc.cod_pessoa = p.cod_pessoa', array('*'))
                ->join(array('e' => 'tb_endereco'), 'p.cod_end = e.cod_end', array('*'))
                ->join(array('c' => 'tb_cidade'), 'e.cod_cid = c.cod_cid', array('*'))
                ->join(array('est' => 'tb_uf'), 'c.cod_uf = est.cod_uf', array('*'))
                ->joinLeft(array('l' => 'tb_login'), 'l.cod_login = p.cod_login', array('*'))
                ->where('p.cod_pessoa = ?', $cod_pessoa)
                ->setIntegrityCheck(false)
                ;
        
        return $this->fetchAll($query)->toArray();
    }
}