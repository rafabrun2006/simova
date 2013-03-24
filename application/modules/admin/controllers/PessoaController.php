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
                $endereco = new App_Model_Endereco();
                $post['cod_end'] = $endereco->save($post);

                if ($post['cod_end']) {
                    $this->view->mensagem = array(
                        'type' => 'alert-sucess', 'mensagem' => 'Endereço cadastrado com sucesso!'
                    );
                }

                //Inserção dos dados no banco
                $model = new App_Model_Pessoa();
                $codPessoa = $model->save($post);

                if ($codPessoa) {
                    $post['cod_pessoa'] = $codPessoa;

                    if ($form->getSubForm('Telefone')->isValid($post)) {
                        $telefone = new App_Model_Telefone();
                        $telefone->saveMultiple($post, 2);
                        $this->view->mensagem = array(
                            'type' => 'alert-sucess', 'mensagem' => 'Telefone(s) cadastrado com sucesso!'
                        );
                    }

                    if ($form->getSubForm('Funcionario')->isValid($post)) {
                        $funcionario = new App_Model_Funcionario();
                        $funcionario->save($post);
                        $this->view->mensagem = array(
                            'type' => 'alert-sucess', 'mensagem' => 'Funcionário cadastrado com sucesso!'
                        );
                    }

                    //Cadastrando login
                    if ($form->getSubForm('Login')->isValid($post)) {
                        $loginModel = new App_Model_Login();
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
        $model = new App_Model_Funcionario();

        $this->view->listFuncionarios = $model
                ->listFuncionarios($this->_request->getPost());

        $this->view->modal = $this->view->render('utils/modal.phtml');
    }

    public function consultaPacienteAction() {
        $model = new App_Model_Paciente();

        $this->view->request = $this->_request->getPost();
        
        $this->view->listPacientes = $model
                ->listPaciente($this->_request->getPost());

        $this->view->modal = $this->view->render('utils/modal.phtml');
    }

    public function excluirFuncionarioAction() {
        $model = new App_Model_Pessoa();

        if ($this->getParam('cod_pessoa')) {
            $model->delete('cod_pessoa = ' . $this->getParam('cod_pessoa'));

            $this->view->mensagem = array(
                'type' => 'alert-warning', 'mensagem' => 'Funcionário apagado com sucesso!'
            );
        }

        $this->_redirect('/admin/pessoa/consulta-funcionario');
    }

    public function editarFuncionarioAction() {
        $form = new Admin_Form_Pessoa();

        $model = new App_Model_Funcionario();
        $funcionario = $model->getArrayById($this->getParam('cod_pessoa'));
        
        $form->populate($funcionario[0]);
        $form->getSubForm('Endereco')->populate($funcionario[0]);
        $form->getSubForm('Telefone')->populate(
                array('num_tel1' => $funcionario[0]['num_tel']));
        $form->getSubForm('Login')->populate($funcionario[0]);

        //Zend_Debug::dump($model->getArrayById($this->getParam('cod_pessoa')));
        
        $this->view->form = $form;
        $this->renderScript('/pessoa/cadastro-funcionario.phtml');
    }

}

