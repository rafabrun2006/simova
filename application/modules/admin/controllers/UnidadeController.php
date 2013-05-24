<?php

class Admin_UnidadeController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function consultaUnidadeAction() {
        $model = new App_Model_UnidadeSaude();

        $paginator = $this->view->pagination(
                    $model->fetchAll(),
                    $this->_getParam('page'),
                    '/admin/unidade/consulta-unidade/page/');
        
        $this->view->unidades = $paginator->paginator;

        if ($paginator->count <= 0) {
            $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::NENHUM_RESULTADO));
        }

        $this->view->pagination = $paginator;
        $this->view->request = $this->_request->getPost();
        $this->view->modal = $this->view->render('/utils/modal.phtml');
    }

    public function cadastroUnidadeAction() {
        $form = new Admin_Form_Unidade();
        
        if ($this->_request->isPost()) {
            $post = $this->getRequest()->getPost();

           
            
            if ($form->isValid($post)) {
                $model = new App_Model_UnidadeSaude();
                $modelEndereco = new App_Model_Endereco();

                /*
                 * Insere os dados de endereço e retorna o codigo do registro
                 * inserido
                 */
                $post['cod_end'] = $modelEndereco->save($post);

                /*
                 * Salva os dados de uma nova unidade saude cadastrada
                 */
                if ($model->save($post)) {
                    $this->_helper->flashMessenger(array('success' => Simova_Mensagens::CADASTRO_SUCESSO));
                    $this->_redirect('/admin/unidade/consulta-unidade');
                }
            } else {
                $this->_helper->flashMessenger(array('error' => Simova_Mensagens::FORM_INVALIDO));
            }
        }

        $this->view->form = $form;
    }

    public function alterarUnidadeAction() {
        $form = new Admin_Form_Unidade();
        $modelEndereco = new App_Model_Endereco();
        $model = new App_Model_UnidadeSaude();

        $dataUnidade = $model->find($this->_getParam('cod_un_saude'))->toArray();
        $dataEndereco = $modelEndereco->find($dataUnidade[0]['cod_end'])->toArray();

        
        if ($this->_request->isPost()) {
            $post = $this->getRequest()->getPost();

            if ($form->isValid($post)) {
                /*
                 * Insere os dados de endereço e retorna o codigo do registro
                 * inserido
                 */
                $post['cod_end'] = $modelEndereco->save($post);

                /*
                 * Salva os dados de uma nova unidade saude cadastrada
                 */

                if ($model->save($post)) {
                    $this->_helper->flashMessenger(array('success' => Simova_Mensagens::ALTERAR_SUCESSO));
                    $this->_redirect('/admin/unidade/consulta-unidade');
                }
            } else {
                $form->populate($post);
            }
        } else {
           
                      
            $form->populate(array_merge($dataEndereco[0], $dataUnidade[0]));
        }

        $this->view->form = $form;
    }

    public function excluirUnidadeAction() {
        $model = new App_Model_UnidadeSaude();

        $model->delete('cod_un_saude = ' . $this->_getParam('cod_un_saude'));

        $this->_helper->flashMessenger(array('success' => Simova_Mensagens::DELETE_SUCESSO));
        $this->_redirect('/admin/unidade/consulta-unidade');
    }

}

