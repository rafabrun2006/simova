<?php

class Admin_UnidadeController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function consultaUnidadeAction() {
        $model = new App_Model_UnidadeSaude();

        $this->view->unidades = $model->fetchAll();
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
                    $this->_helper->flashMessenger('success', 'Unidade de Saúde cadastrada com sucesso');
                    $this->_redirect('/admin/unidade/consulta-unidade');
                }
            } else {
                $this->_helper->flashMessenger('error', 'Verifique seu formulario');
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
                    $this->view->mensagem = array(
                        'type' => 'alert-success',
                        'mensagem' => 'Dados alterados com sucesso!');
                }
            } else {
                $form->populate($post);
            }
        } else {
            $form->populate(array_merge($dataEndereco[0], $dataUnidade[0]));
        }

        $this->view->form = $form;
    }
    
    public function excluirUnidadeAction(){
        $model = new App_Model_UnidadeSaude();
        
        $model->delete('cod_un_saude = '.$this->_getParam('cod_un_saude'));
        
        $this->_redirect('/admin/unidade/consulta-unidade');
    }

}

