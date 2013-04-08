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
        $form->removeSubForm('Endereco');
        $form->removeSubForm('Status');

        $modelPessoa = new App_Model_Pessoa();
        $modelTelefone = new App_Model_Telefone();
        $modelLogin = new App_Model_Login();

        $result = $modelPessoa
                ->findByPersonByLogin(Zend_Auth::getInstance()->getIdentity()->cod_login)
                ->toArray();

        $telefone = $modelTelefone->findByPerson($result[0]['cod_pessoa']);

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();
            
            echo $senhaLogin = (md5($result[0]['senha_login']) == $post['senha_login'] ? TRUE : FALSE);
            
            $data = array_merge($result[0], $post);

            if ($form->isValid($data)) {

                $data['num_tel'] = $data['num_tel1'];
                $modelTelefone->saveMultiple($data, 1);

                if (!empty($data['senha_login']) and $senhaLogin) {
                    $modelLogin->saveLogin($data);
                }

                if ($modelPessoa->save($data)) {
                    $this->view->mensagem = array(
                        'type' => 'alert-success', 'mensagem' => 'Alteração efetuado com sucesso!'
                    );
                }
            }
            
            $form->populate($data);
            
        } else {
            $result[0]['num_tel1'] = $telefone[0]->num_tel;
            $form->populate($result[0]);
        }
        $this->view->form = $form;
    }

}

