<?php

class App_Model_Doenca extends Zend_Db_Table {

    protected $_name = 'tb_doenca';
    protected $_primary = 'cod_doenca';

    public function importCalendarioVacinas($sqlCarga) {
        try {
            $this->fetchAll($sqlCarga);
            return TRUE;
        } catch (Zend_Db_Exception $e) {
            return $e;
        }
    }

}

