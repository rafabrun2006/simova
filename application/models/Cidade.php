<?php

class Model_Cidade extends Zend_Db_Table_Abstract
{
    
    protected $_name = 'tb_cidade';
    protected $_primary = 'Cod_Cid';

    public function listAll(){
        return $this->fetchAll();
    }

}

