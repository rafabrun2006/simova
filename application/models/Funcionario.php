<?php

/**
 * Description of Pessoa
 *

 */
class App_Model_Funcionario extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_funcionario';
    protected $_primary = 'cod_funcionario';
    protected $_integrityCheck = FALSE;
    
    //METODO QUE RETORNA UMA LISTA DE FUNCIONÁRIOS
    public function listFuncionarios($where = NULL) {
        $query = $this->select()
                ->from(array('f' => 'tb_funcionario'))
                ->joinInner(array('p' => 'tb_pessoa'), 'p.cod_pessoa = f.cod_pessoa', array('*'))
                ->joinInner(array('l' => 'tb_login'), 'p.cod_login = l.cod_login', array('*'))
                ->setIntegrityCheck(false)
        ;

        $where['tipoConsulta'] == 'cod_sit' ?
                        $query->where('cod_sit = ?', $where['search']) : $query->where('cod_sit = ?', TRUE);

        if ($where['tipoConsulta']) {
            $query->where($where['tipoConsulta'] . " like ?", "%{$where['search']}%");
        }
        
        return $this->fetchAll($query);
    }
    //METODO QUE RECUPERA OS DADOS DE UMA PESSOA COMO ARRAY
    public function getArrayById($cod_pessoa) {

        $query = $this->select()
                ->from(array('f' => 'tb_funcionario'), array('*'))
                ->join(array('p' => 'tb_pessoa'), 'f.cod_pessoa = p.cod_pessoa', array('*'))
                ->join(array('e' => 'tb_endereco'), 'p.cod_end = e.cod_end', array('*'))
                ->join(array('c' => 'tb_cidade'), 'e.cod_cid = c.cod_cid', array('*'))
                ->join(array('est' => 'tb_uf'), 'c.cod_uf = est.cod_uf', array('*'))
                ->joinLeft(array('l' => 'tb_login'), 'l.cod_login = p.cod_login', array('*'))
                ->where('p.cod_pessoa = ?', $cod_pessoa)
                ->setIntegrityCheck(false)
        ;
        // FETCHALL RETORNA OBJETOS E O TO ARRAY TRANSFORMA OS OBJETOS EM ARRAYS
        return $this->fetchAll($query)->toArray();
    }

}