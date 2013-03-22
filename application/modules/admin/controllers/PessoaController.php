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

                //Cadastrando um endereço
                $endereco = new Model_Endereco();
                $post['cod_end'] = $endereco->save($post);

                if ($post['cod_end']) {
                    $this->view->mensagem = array(
                        'type' => 'alert-sucess', 'mensagem' => 'Endereço cadastrado com sucesso!'
                    );
                }

                //Inserção dos dados no banco
                $model = new Model_Pessoa();
                $codPessoa = $model->save($post);

                if ($codPessoa) {
                    $post['cod_pessoa'] = $codPessoa;

                    if ($form->getSubForm('Telefone')->isValid($post)) {
                        $telefone = new Model_Telefone();
                        $telefone->saveMultiple($post, 2);
                        $this->view->mensagem = array(
                            'type' => 'alert-sucess', 'mensagem' => 'Telefone(s) cadastrado com sucesso!'
                        );
                    }

                    if ($form->getSubForm('Funcionario')->isValid($post)) {
                        $funcionario = new Model_Funcionario();
                        $funcionario->save($post);
                        $this->view->mensagem = array(
                            'type' => 'alert-sucess', 'mensagem' => 'Funcionário cadastrado com sucesso!'
                        );
                    }

                    //Cadastrando login
                    if ($form->getSubForm('Login')->isValid($post)) {
                        $loginModel = new Model_Login();
                        $loginModel->save($post);
                        $this->view->mensagem = array(
                            'type' => 'alert-sucess', 'mensagem' => 'Login cadastrado com sucesso!'
                        );
                    }
                }
            } else {
                $this->view->mensagem = array(
                    'type' => 'alert-warning', 'mensagem' => 'Verifique seu formulário!'
                );
                print_r($form->getMessages());
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
        $model = new Model_Funcionario();
        
        $this->view->listFuncionarios = $model
                ->listFuncionarios($this->_request->getPost());
        
    }

    public function consultaPacienteAction() {
        // action body
    }

    public function excluirFuncionarioAction() {
        
    }

}

