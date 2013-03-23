<?php

/**
 * Description of Pessoa
 *
 * @author bruno
 */
class Model_Funcionario extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_funcionario';
    protected $_primary = 'cod_funcionario';
    protected $_integrityCheck = FALSE;


    public function listFuncionarios($where = NULL){
        $query = $this->select()
                ->from(array('f' => 'tb_funcionario'))
                ->joinInner(array('p' => 'tb_pessoa'), 'p.cod_pessoa = f.cod_pessoa', array('*'))
                ->setIntegrityCheck(false) 
                ;
        
        if($where['tipoConsulta']){
            $query->where($where['tipoConsulta']." like ?", "%{$where['search']}%");
        }
        
        return $this->fetchAll($query);
    }

    public function getArrayById($cod_pessoa){
        
        echo $query = $this->select()
                ->from(array('f' => 'tb_funcionario'), array('*'))
                ->join(array('p' => 'tb_pessoa'), 'f.cod_pessoa = p.cod_pessoa', array('*'))
                ->join(array('e' => 'tb_endereco'), 'p.cod_end = e.cod_end', array('*'))
                ->join(array('t' => 'tb_telefone'), 't.cod_pessoa = p.cod_pessoa', array('*'))
                ->joinLeft(array('l' => 'tb_login'), 'l.cod_login = p.cod_login', array('*'))
                ->where('p.cod_pessoa = ?', $cod_pessoa)
                ->setIntegrityCheck(false)
                ;
        
        return $this->fetchAll($query)->toArray();
    }
    
}