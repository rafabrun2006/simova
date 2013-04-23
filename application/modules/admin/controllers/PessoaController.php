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
        $form->addSubForm(new Admin_Form_Funcionario(), 'Funcionario');

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            //Validando formulario
            if ($form->isValid($post)) {

                if ($this->save('F', $post)) {
                    $this->_helper->flashMessenger(array('success' => Simova_Mensagens::CADASTRO_SUCESSO));
                    $this->_redirect('/admin/pessoa/consulta-funcionario');
                } else {
                    $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::CADASTRO_ERROR));
                    $this->_redirect('/admin/pessoa/consulta-funcionario');
                }
            } else {
                $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::FORM_INVALIDO));
                $this->_redirect('/admin/pessoa/consulta-funcionario');
            }
        }
        $this->view->form = $form;
    }

    public function cadastroPacienteAction() {
        $form = new Admin_Form_Pessoa();
        $form->addSubForm(new Admin_Form_Paciente(), 'Paciente');

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            //Validando formulario
            if ($form->isValid($post)) {

                if ($this->save('P', $post)) {

                    $this->_helper->flashMessenger(array('success' => Simova_Mensagens::CADASTRO_SUCESSO));
                    $this->_redirect('/admin/pessoa/consulta-paciente');
                } else {
                    $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::CADASTRO_ERROR));
                }
            } else {
                $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::FORM_INVALIDO));
            }
        }
        $this->view->form = $form;
    }

    public function consultaFuncionarioAction() {
        $model = new App_Model_Funcionario();

        $paginator = $this->view->pagination(
                $model->listFuncionarios($this->_request->getPost()), $this->_getParam('page'), '/admin/pessoa/consulta-funcionario/page/');

        $this->view->listFuncionarios = $paginator->paginator;

        if ($paginator->count <= 0) {
            $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::NENHUM_RESULTADO));
        }

        $this->view->pagination = $paginator;
        $this->view->request = $this->_request->getPost();
        $this->view->modal = $this->view->render('utils/modal.phtml');
    }

    public function consultaPacienteAction() {
        $model = new App_Model_Paciente();

        $paginator = $this->view->pagination(
                $model->listPaciente($this->_request->getPost()), $this->_getParam('page'), '/admin/pessoa/consulta-paciente/page/');

        $this->view->listPacientes = $paginator->paginator;

        if ($paginator->count <= 0) {
            $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::NENHUM_RESULTADO));
        }

        $this->view->pagination = $paginator;
        $this->view->request = $this->_request->getPost();
        $this->view->modal = $this->view->render('utils/modal.phtml');
    }

    public function visualisarCadastroAction(){
        $model = new App_Model_Pessoa();
        
        if($this->_getParam('cod_pessoa')){
            $this->view->pessoa = $model->find($this->_getParam('cod_pessoa'));
        }
    }
    
    /*
     * Isto e um falso link que utiliza a URL para acionar uma função principal
     */

    public function excluirFuncionarioAction() {
        $this->excluir('consulta-funcionario');
    }

    /*
     * Isto e um falso link que utiliza a URL para acionar uma função principal
     */

    public function excluirPacienteAction() {
        $this->excluir('consulta-paciente');
    }

    public function editarFuncionarioAction() {
        $form = new Admin_Form_Pessoa();
        $form->addSubForm(new Admin_Form_Funcionario(), 'Funcionario');

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            if ($form->isValid($post)) {
                if ($this->save('F', $post)) {
                    $this->_helper->flashMessenger(array('success' => Simova_Mensagens::ALTERAR_SUCESSO));
                    $this->_redirect('/admin/pessoa/consulta-funcionario');
                } else {
                    $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::ALTERAR_ERROR));
                }
            } else {
                $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::FORM_INVALIDO));
                $this->_redirect('/admin/pessoa/consulta-funcionario');
            }
        }

        $this->populaFormEditar('F', $form, $this->_getParam('cod_pessoa'));
    }

    public function editarPacienteAction() {
        $form = new Admin_Form_Pessoa();
        $form->addSubForm(new Admin_Form_Paciente(), 'Paciente');

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            if ($form->isValid($post)) {

                if ($this->save('P', $post)) {
                    $this->_helper->flashMessenger(array('success' => Simova_Mensagens::ALTERAR_SUCESSO));
                    $this->_redirect('/admin/pessoa/consulta-paciente');
                } else {
                    $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::ALTERAR_ERROR));
                }
            } else {
                $this->_helper->flashMessenger(array('error' => Simova_Mensagens::FORM_INVALIDO));
            }
        }

        $this->populaFormEditar('P', $form, $this->_getParam('cod_pessoa'));
    }

    /*
     * Metodos internos privados não acessados pela URL
     */

    private function excluir($actionRedirect) {
        $model = new App_Model_Pessoa();

        if ($this->_getParam('cod_pessoa')) {
            $model->delete('cod_pessoa = ' . $this->_getParam('cod_pessoa'));

            $this->_helper->flashMessenger(array('success' => Simova_Mensagens::DELETE_SUCESSO));
        }

        $this->_redirect('/admin/pessoa/' . $actionRedirect);
    }

    private function populaFormEditar($tipoPessoa, $form, $codPessoa) {

        if ($tipoPessoa == 'F') {
            $model = new App_Model_Funcionario();
            $pessoa = $model->getArrayById($codPessoa);

            //Adicionando subform para funcionario no formulario de pessoa
            $form->getSubForm('Funcionario')->populate($pessoa[0]);
        } else if ($tipoPessoa == 'P') {
            $model = new App_Model_Paciente();
            $pessoa = $model->getArrayById($codPessoa);

            //Adicionando subform para paciente no formulario de pessoa
            $form->getSubForm('Paciente')->populate($pessoa[0]);
        }

        //Populando formulario pessoa
        $form->populate($pessoa[0]);

        //Populando formulario endereço
        $form->getSubForm('Endereco')->populate($pessoa[0]);

        //Populando formulario telefone
        $form->getSubForm('Telefone')->populate(
                array(
                    'cod_tel' => $pessoa[0]['cod_tel'],
                    'num_tel1' => $pessoa[0]['num_tel'],
        ));

        //Populando formulario login
        $form->getSubForm('Login')->populate($pessoa[0]);

        //Zend_Debug::dump($model->getArrayById($this->getParam('cod_pessoa')));

        $this->view->form = $form;
    }

    private function save($tipoPessoa, $post) {

        //Cadastrando um endereço
        $endereco = new App_Model_Endereco();
        $post['cod_end'] = $endereco->save($post);

        //Cadastrando login
        if (!empty($post['nome_login']) && !empty($post['senha_login'])) {
            $loginModel = new App_Model_Login();
            $post['cod_login'] = $loginModel->saveLogin($post);
        }

        //Inserção dos dados no banco
        $model = new App_Model_Pessoa();
        $codPessoa = $model->save($post);

        if ($codPessoa) {
            $post['cod_pessoa'] = $codPessoa;

            //Cadastrando telefones
            $telefone = new App_Model_Telefone();
            $telefone->saveMultiple($post, 2);

            //Salvando pessoa pelo tipo, funcionario ou paciente
            if ($tipoPessoa == 'F') {

                //Se tipoPessoa F, cadastra funcionario
                $funcionario = new App_Model_Funcionario();
                $funcionario->save($post);
            } else if ($tipoPessoa == 'P') {

                //Se tipoPessoa P, cadastra paciente
                $paciente = new App_Model_Paciente();
                $paciente->save($post);
            }

            return TRUE;
        }
    }

}

