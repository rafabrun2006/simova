<?php

class Admin_PessoaController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {
        // action body
    }

    public function cadastroFuncionarioAction() {
        $form = new Admin_Form_Pessoa();

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            if ($form->isValid($post) and $form->getSubForm('Endereco')->isValid($post)) {

                //Cadastrando login
                if ($form->getSubForm('Login')->isValid($post)) {
                    $loginModel = new Model_Login();
                    $cod_login = $loginModel->save($post);

                    $post['cod_login'] = $cod_login;
                }

                //Cadastrando um endereço
                $endereco = new Model_Endereco();
                $post['cod_end'] = $endereco->save($post);

                //Inserção dos dados no banco
                $model = new Model_Pessoa();
                if ($model->save($post)) {
                    
                    if($form->getSubForm('Telefone')->isValid($post)){
                        $telefone = new Model_Telefone();
                        $telefone->save($post, 2);
                    }
                    
                    $this->view->mensagem = array(
                        'type' => 'alert-sucess', 'mensagem' => 'Cadastrado com sucesso!'
                    );
                }
                
            } else {
                $this->view->mensagem = array(
                    'type' => 'alert-warning', 'mensagem' => 'Verifique seu formulário!'
                );
                $form->populate($post);
            }
        }
        $this->view->form = $form;
    }

    public function cadastroPacienteAction() {
        $form = new Admin_Form_Pessoa();

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            @$post['Perfil'] = array('Perfil' => $post['Perfil']);
            @$post['Endereco'] = array('Endereco' => $post['Endereco']);

            if ($form->isValid($post)) {
                $model = new Model_Pessoa();

                if ($model->insert($post)) {
                    echo 'inserido';
                }
            } else {
                $form->populate($post);
            }
        }
        $this->view->form = $form;
    }

    public function consultaFuncionarioAction() {
        // action body
    }

    public function consultaPacienteAction() {
        // action body
    }

}

