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

            //@$post['Perfil'] = array('Perfil' => $post['Perfil']);

            if ($form->isValid($post)) {

                //Cadastrando um endereço
                $endereco = new Model_Endereco();
                $cod_end = $endereco->insert(
                        array(
                            'endereco' => $post['endereco'],
                            'complemento' => $post['complemento']
                ));

                unset($post['Endereco']);
                unset($post['endereco']);
                unset($post['complemento']);
                unset($post['bairro']);
                unset($post['cep']);
                unset($post['Perfil']);

                //Cadastrando login
                if (!empty($post['usuario']) and !empty($post['senha'])) {
                    $loginModel = new Model_Login();
                    $cod_login = $loginModel->insert(
                            array(
                                'nome_login' => $post['usuario'],
                                'senha_login' => $post['senha']
                    ));
                    
                    $post['cod_login'] = $cod_login;
                }

                unset($post['usuario']);
                unset($post['senha']);

                //Inserção dos dados no banco

                $post['cod_end'] = $cod_end;

                $model = new Model_Pessoa();

                if ($model->insert($post)) {
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

