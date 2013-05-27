<?php

class App_Model_Cidade extends Zend_Db_Table_Abstract
{
    
    protected $_name = 'tb_cidade';
    protected $_primary = 'cod_cid';

    public function listAll($where = array()){
        
        if($where){
            foreach($where as $key=>$value){
                $query .= $key . ' = ' .$value;
            }
            
            return $this->fetchAll($query);
        }else{
            return $this->fetchAll();
        }
        
    }

}

