<?php

class Admin_VacinaController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {
        // action body
    }

    public function consultaVacinaAction() {
        $model = new App_Model_Vacina();
    }

    public function cadastroVacinaAction() {
        $form = new Admin_Form_LoteVacina();
        
        $model = new App_Model_Vacina();
        $modelLote = new App_Model_Lote();

        $this->view->form = $form;
    }

}

