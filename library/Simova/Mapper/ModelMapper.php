<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ModelMapper
 *
 * @author Administrador
 */
abstract class Simova_Mapper_ModelMapper extends Zend_Db_Table_Abstract {

    public function save($data) {

        foreach ($this->_getCols() as $cols) {
            $dataInsert[$cols] = isset($data[$cols]) ? $data[$cols] : NULL;
        }

        if ($data[$this->_primary]) {
            $this->update($dataInsert, $this->_primary . '=' . $data[$this->_primary]);

            //Zend_Debug::dump($dataInsert);

            return $data[$this->_primary];
        } else {

            //Zend_Debug::dump($dataInsert);

            return $this->insert($dataInsert);
        }
    }
    //METODO PARA DELETAR
    public function delete($where) {
        try{
            parent::delete($where);
            
            return true;
        }  catch (Zend_Exception $e){
            return false;
        }
    }
}