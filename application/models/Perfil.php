<?php

class Model_Perfil extends Zend_Db_Table_Abstract
{
    
    protected $_name = 'TB_PERFIL';
    protected $_primary = 'COD_PERFIL';

    public function listAll(){
        return $this->fetchAll();
    }

}

