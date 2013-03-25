<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ModelMapper
 *
 * @author bruno
 */
abstract class Simova_Mapper_ModelMapper extends Zend_Db_Table_Abstract {

    public function save($data) {

        foreach ($this->_getCols() as $cols) {
            $dataInsert[$cols] = isset($data[$cols]) ? $data[$cols] : NULL;
        }

        if ($data[$this->_primary]) {
            
            $this->update($dataInsert, 
                    $this->_primary . '=' . $data[$this->_primary]);
            return $data[$this->_primary];
        } else {
            return $this->insert($dataInsert);
        }
    }

}