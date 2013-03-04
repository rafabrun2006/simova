<?php

class Model_Cidade extends Zend_Db_Table_Abstract
{
    
    protected $_name = 'TB_CIDADE';
    protected $_primary = 'COD_CID';


    public function listAll(){
        return $this->fetchAll();
    }

}

