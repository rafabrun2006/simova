<?php

/**
 * Description of Pessoa
 *
 * @author bruno
 */
class App_Model_Pessoa extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_pessoa';
    protected $_primary = 'cod_pessoa';

    public function save($data) {
        $this->_primary = 'cod_pessoa';
        //Convertendo data para padrao exigido pelo banco EUA
        $data['dt_nasc'] = date('Y-m-d', strtotime($data['dt_nasc']));
        
        return parent::save($data);
    }
    
    public function findByPersonByLogin($codLogin){
        $query = $this->select()
                ->from(array('l' => 'tb_login'), array('*'))
                ->join(array('p' => 'tb_pessoa'), 'l.cod_login = p.cod_login', array('*'))
                ->where('l.cod_login = ?', $codLogin)
                ->setIntegrityCheck(false)
                ;
        
        return $this->fetchAll($query);
    }
    
    public function findById($cod_pessoa){
        
        $query = $this->select()
                ->from(array('p' => 'tb_pessoa'), array('*'))
                ->joinleft(array('f' => 'tb_funcionario'), 'p.cod_pessoa = f.cod_pessoa', array('*'))
                ->joinleft(array('pc' => 'tb_paciente'), 'p.cod_pessoa = pc.cod_pessoa', array('*'))
                ->join(array('e' => 'tb_endereco'), 'p.cod_end = e.cod_end', array('*'))
                ->join(array('t' => 'tb_telefone'), 't.cod_pessoa = p.cod_pessoa', array('*'))
                ->joinLeft(array('l' => 'tb_login'), 'l.cod_login = p.cod_login', array('*'))
                ->where('p.cod_pessoa = ?', $cod_pessoa)
                ->setIntegrityCheck(false)
                ;
        
        return $this->fetchAll($query);
    }
}