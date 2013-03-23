<?php

/**
 * Description of Pessoa
 *
 * @author bruno
 */
class Model_Funcionario extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_funcionario';
    protected $_primary = 'cod_funcionario';
    
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
    
    public function delete($where) {
        parent::delete($where);
    }

}