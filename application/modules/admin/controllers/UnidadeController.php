<?php

class Admin_UnidadeController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function consultaUnidadeAction(){
        ;
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
                    $this->_redirect('/unidade/consulta-unidade');
                }
            }else{
                $this->_helper->flashMessenger('error', 'Verifique seu formulario');
            }
        }

        $this->view->form = $form;
    }

    public function editarUnidadeAction() {
        $form = new Admin_Form_Unidade();
        $modelEndereco = new App_Model_Endereco();
        $model = new App_Model_UnidadeSaude();

        $post = $model->find($this->_getParam('cod_un_saude'))->toArray();
        
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
                    $this->mensagem = 'Parabens voce cadastrou com sucesso';
                }
            }
        }

        $form->populate($post);
        $this->view->form = $form;
    }

}

