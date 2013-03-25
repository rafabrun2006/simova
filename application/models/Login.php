<?php

/**
 * Description of Pessoa
 *
 * @author bruno
 */
class App_Model_Login extends Simova_Mapper_ModelMapper {
    
    protected $_name = 'tb_login';
    protected $_primary = 'cod_login';

    public function saveLogin($data){
        $this->_primary = 'cod_login';
        
        $data['senha_login'] = $this->encodingMd5($data['senha_login']);
        return $this->save($data);
    }
    
    protected function encodingMd5($value){
        return md5($value);
    }
    
    public function findArrayByName($nomeLogin){
        $query = $this->select()
                ->from(array('l'=>'tb_login'), array('*'))
                ->where('nome_login = ?', $nomeLogin)
                ->setIntegrityCheck(false);
        
        return $this->fetchAll($query)->toArray();
    }
    
}