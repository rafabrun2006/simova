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

        if ($this->_request->isPost()) {
            $where = array($this->_request->getPost());
        }

        $paginator = $this->view->pagination(
                $model->joinAllRelations($where), $this->_getParam('page'), '/admin/vacina/consulta-vacina/page/');

        $this->view->pagination = $paginator;
        $this->view->vacinas = $paginator->paginator;
        $this->view->request = $this->_request->getPost();
        $this->view->modal = $this->view->render('utils/modal.phtml');

        if ($paginator->count <= 0) {
            $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::NENHUM_RESULTADO));
        }
    }

    public function cadastroVacinaAction() {
        $form = new Admin_Form_LoteVacina();

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();
            if ($this->saveVacina($form, $post)) {
                $this->_helper->flashMessenger(array('success' => Simova_Mensagens::CADASTRO_SUCESSO));
                $this->_redirect('/admin/vacina/consulta-vacina');
            }else{
                $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::FORM_INVALIDO));
            }
        }

        $this->view->form = $form;
    }

    public function alterarVacinaAction() {
        $model = new App_Model_Vacina();
        $form = new Admin_Form_LoteVacina();

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            $this->saveVacina($form, $post);

            $this->_helper->flashMessenger(array('success' => Simova_Mensagens::ALTERAR_SUCESSO));
            $this->_redirect('/admin/vacina/consulta-vacina');
        } else {
            $where = array('v.cod_vacina' => $this->_getParam('cod_vacina'));

            $result = $model->joinAllRelations($where)->toArray();

            $result[0]['dt_venc'] = Simova_Date::dateToView($result[0]['dt_venc']);
            $result[0]['dt_fabric'] = Simova_Date::dateToView($result[0]['dt_fabric']);
            
            $form->populate($result[0]);

            $form->getSubForm('Vacina')->populate($result[0]);
        }

        $this->view->form = $form;
    }

    public function saveVacina($form, $post) {

        if ($form->isValid($post)) {

            $model = new App_Model_Vacina();
            $post['cod_vacina'] = $model->save($post);

            $modelLote = new App_Model_Lote();
            $post['cod_lote'] = $modelLote->save($post);

            $modelLoteVacina = new App_Model_LoteVacina();
            $modelLoteVacina->save($post);

            $modelVacinaFabri = new App_Model_VacinaFabricante();
            $modelVacinaFabri->save($post);

            return true;
        } else {
            return false;
        }
    }

    public function excluirVacinaAction() {
        $model = new App_Model_LoteVacina();

        $model->delete(
                'cod_vacina = ' . $this->_getParam('cod_vacina') . ' and ' .
                'cod_lote = ' . $this->_getParam('cod_lote')
        );

        $this->_helper->flashMessenger(array('success' => Simova_Mensagens::DELETE_SUCESSO));
        $this->_redirect('/admin/vacina/consulta-vacina');
    }

}

