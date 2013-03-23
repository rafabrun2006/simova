<?php

class App_Model_Perfil extends Zend_Db_Table_Abstract
{
    
    protected $_name = 'tb_perfil';
    protected $_primary = 'cod_perfil';

    public function listAll(){
        return $this->fetchAll();
    }

}

