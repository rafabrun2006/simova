<?php

class Admin_EnderecoController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function ajaxPopulaCidadeAction() {
        $this->_helper->layout()->disableLayout();
        $modelCidade = new App_Model_Cidade();
        
        foreach ($modelCidade->listAll() as $value) {

            if ($value->cod_uf == $this->_getParam('uf_id')) {
                $select[] = array('value' => $value->cod_cid, 'label' => $value->nome_cid);
            }
        }

        $this->view->select = $select;
    }

}

