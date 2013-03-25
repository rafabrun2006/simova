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
        $data['senha_login'] = $this->encodingMd5($data['senha_login']);
        return $this->save($data);
    }
    
    protected function encodingMd5($value){
        return md5($value);
    }
    
}