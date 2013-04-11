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
        $this->view->vacinas = $model->joinAllRelations();
    }

    public function cadastroVacinaAction() {
        $form = new Admin_Form_LoteVacina();

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();
            $this->saveVacina($form, $post);
        }
        
        $this->view->form = $form;
    }

    public function alterarVacinaAction() {
        $model = new App_Model_Vacina();
        $form = new Admin_Form_LoteVacina();

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            $this->saveVacina($form, $post);
            $this->_redirect('/admin/vacina/consulta-vacina');
        } else {
            $where = array('cod_vacina' => $this->_getParam('cod_vacina'));

            $result = $model->joinAllRelations($where)->toArray();
            $form->populate($result[0]);
            
            $this->view->form = $form;
        }
    }

    public function saveVacina($form, $post) {

        if ($form->isValid($post)) {
            
            $model = new App_Model_Vacina();
            $post['cod_vac'] = $model->save($post);
            
            $post['cod_vacina'] = $post['cod_vac'];
            
            $modelLote = new App_Model_Lote();
            $post['cod_lote'] = $modelLote->save($post);

            $modelLoteVacina = new App_Model_LoteVacina();
            $modelLoteVacina->save($post);

            $modelFabricante = new App_Model_Fabricante();
            $post['cod_fabric'] = $modelFabricante->save($post);

            $modelVacinaFabri = new App_Model_VacinaFabricante();
            $modelVacinaFabri->save($post);
            
        }
        
    }

}

