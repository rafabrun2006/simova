<?php

class Admin_EnderecoController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function ajaxPopulaCidadeAction() {
        $this->_helper->layout()->disableLayout();
        $modelCidade = new App_Model_Cidade();
        
        foreach ($modelCidade->listAll($this->_request->getPost()) as $value) {
            $this->view->select .= '<option value="'. $value->cod_cid . '">' . $value->nome_cid . '</option>';
        }
    }

}

