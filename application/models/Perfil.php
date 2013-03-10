<?php

class Model_Perfil extends Zend_Db_Table_Abstract
{
    
    protected $_name = 'tb_perfil';
    protected $_primary = 'Cod_Perfil';

    public function listAll(){
        return $this->fetchAll();
    }

}

