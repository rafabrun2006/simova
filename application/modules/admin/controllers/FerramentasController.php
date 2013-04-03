<?php

class Admin_FerramentasController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {
        // action body
    }

    public function importarCalendarioAction() {
        $files = $_FILES['import'];

        if ($this->_request->isPost()) {
            if ($files['type'] == 'text/x-sql') {
                $file = fopen($files['tmp_name'], 'r');

                while (!feof($file)) {
                    $buffer = fgets($file);
                }

                $model = new App_Model_Doenca();
                $this->view->retorno = $model->importCalendarioVacinas($buffer);
            }
        }

        $this->view->modal = $this->view->render('utils/modal.phtml');
    }

    public function limparCalendarioAction() {
        
        $file = APPLICATION_PATH.'../docs';
        
        if (filetype($files) == 'text/x-sql') {
            $file = fopen($files['tmp_name'], 'r');

            while (!feof($file)) {
                $buffer = fgets($file);
            }

            $model = new App_Model_Doenca();
            $this->view->retorno = $model->importCalendarioVacinas($buffer);
        }
    }

}

