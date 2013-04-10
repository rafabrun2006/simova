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

        $this->view->vacinas = $model->joinLoteVacina();

        //Zend_Debug::dump($this->view->vacinas);
    }

    public function cadastroVacinaAction() {
        $form = new Admin_Form_LoteVacina();

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            if ($form->isValid($post)) {
                $model = new App_Model_Vacina();
                $post['cod_vacina'] = $model->save($post);

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

        $this->view->form = $form;
    }

}

