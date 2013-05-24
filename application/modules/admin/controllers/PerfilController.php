<?php

class Admin_PerfilController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {
        // action body
    }

    public function editarAction() {
        $form = new Admin_Form_Pessoa();

        $modelPessoa = new App_Model_Pessoa();
        $modelLogin = new App_Model_Login();

        $result = $modelPessoa
                ->findByPersonByLogin(Zend_Auth::getInstance()->getIdentity()->cod_login)
                ->toArray();

        if ($result) {
            if ($this->_request->isPost()) {
                $post = $this->_request->getPost();

                $data = array_merge($result[0], $post);

                if (!empty($data['senha_login'])) {
                    $modelLogin->saveLogin($data);
                }

                if ($modelPessoa->save($data)) {
                    $this->_helper->flashMessenger(array('success' => Simova_Mensagens::ALTERAR_SUCESSO));
                }

                $result[0]['senha_login'] = App_Model_Login::decodingBase64($result[0]['senha_login']);
                $form->populate($data);
            } else {
                $result[0]['senha_login'] = App_Model_Login::decodingBase64($result[0]['senha_login']);
                $form->populate($result[0]);
            }
        } else {
            $this->_helper->flashMessenger(array('warning' => 'Perfil inexistente!'));
        }

        $this->view->form = $form;
    }

}

