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
}