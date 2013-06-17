<?php

class Admin_PessoaController extends Zend_Controller_Action {

    public $_form;

    public function init() {
        $this->view->modal = $this->view->render('/utils/modal.phtml');
    }

    public function indexAction() {
        // action body
    }
//Metodo que realiza o cadastro do funcionario
    public function cadastroFuncionarioAction() {
        $this->_form = new Admin_Form_Pessoa();
        $this->_form->addSubForm(new Admin_Form_Funcionario(), 'Funcionario');

        //Populando combo de perfil com perfil de funcionario e administrador
        $this->populatePerfil(array(Simova_Constantes::FUNCIONARIO, Simova_Constantes::ADMINISTRADOR));

        //Verificando se a requisição e um POST
        if ($this->_request->isPost()) {
            $post = $this->_request->getPost(); // recebe os dados do post
            //Validando formulario
            if ($this->_form->isValid($post)) {

                if ($this->save('F', $post)) {
                    $this->_helper->flashMessenger(array('success' => Simova_Mensagens::CADASTRO_SUCESSO));
                    $this->_redirect('/admin/pessoa/consulta-funcionario');
                } else {
                    $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::CADASTRO_ERROR));
                }
            } else {
                $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::FORM_INVALIDO));
            }
        }
        $this->view->form = $this->_form;
    }

    public function cadastroPacienteAction() {
        $this->_form = new Admin_Form_Pessoa();
        $this->_form->addSubForm(new Admin_Form_Paciente(), 'Paciente');

        //Modificado por força de correção
        //
        $this->populatePerfil(array(Simova_Constantes::PACIENTE));
        $this->_form->getElement('cod_perfil')->setValue(Simova_Constantes::PACIENTE);
        //Fim
        
        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            //Validando formulario
            if ($this->_form->isValid($post)) {

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
        $this->view->form = $this->_form;
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

    public function visualisarCadastroAction() {
        $model = new App_Model_Pessoa();

        if ($this->_getParam('cod_pessoa')) {
            $pessoa = $model->findById($this->_getParam('cod_pessoa'));
            $this->view->pessoa = $pessoa[0];
        }
    }

    public function visualisarCadastroPacienteAction() {
        $model = new App_Model_Pessoa();

        if ($this->_getParam('cod_pessoa')) {
            $pessoa = $model->findById($this->_getParam('cod_pessoa'));
            $this->view->pessoa = $pessoa[0];
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
        $this->_form = new Admin_Form_Pessoa();
        $this->_form->addSubForm(new Admin_Form_Funcionario(), 'Funcionario');

        //Populando o form de pessoa
        $this->populatePerfil(array(Simova_Constantes::FUNCIONARIO, Simova_Constantes::ADMINISTRADOR));

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            if ($this->_form->isValid($post)) {
                if ($this->save('F', $post)) {
                    $this->_helper->flashMessenger(array('success' => Simova_Mensagens::ALTERAR_SUCESSO));
                    $this->_redirect('/admin/pessoa/consulta-funcionario');
                } else {
                    $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::ALTERAR_ERROR));
                }
            } else {
                $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::FORM_INVALIDO));
            }
        }

        $this->populaFormEditar('F', $this->_form, $this->_getParam('cod_pessoa'));
    }

    public function editarPacienteAction() {
        $this->_form = new Admin_Form_Pessoa();
        $this->_form->addSubForm(new Admin_Form_Paciente(), 'Paciente');

        //Populando o form de pessoa
        $this->populatePerfil(array(Simova_Constantes::PACIENTE));

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            if ($this->_form->isValid($post)) {

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

        $this->populaFormEditar('P', $this->_form, $this->_getParam('cod_pessoa'));
    }

    /*
     * Metodos internos privados não acessados pela URL
     */

    private function excluir($actionRedirect) {

        if ($this->_getParam('cod_pessoa')) {
            $model = new App_Model_Pessoa();
            $data = $model->find($this->_getParam('cod_pessoa'))->toArray();
            $data[0]['cod_sit'] = 0;

            $model->save($data[0], 'cod_pessoa = ' . $data['cod_pessoa']);

            $this->_helper->flashMessenger(array('success' => Simova_Mensagens::DELETE_SUCESSO));
        }

        $this->_redirect('/admin/pessoa/' . $actionRedirect);
    }

    private function populaFormEditar($tipoPessoa, $form, $codPessoa) {

        if ($tipoPessoa == 'F') {
            $model = new App_Model_Funcionario();
            $pessoa = $model->getArrayById($codPessoa);
            $pessoa[0]['dt_nasc'] = Simova_Date::dateToView($pessoa[0]['dt_nasc']);

            //Adicionando subform para funcionario no formulario de pessoa
            $form->getSubForm('Funcionario')->populate($pessoa[0]);
        } else if ($tipoPessoa == 'P') {
            $model = new App_Model_Paciente();
            $pessoa = $model->getArrayById($codPessoa);
            $pessoa[0]['dt_nasc'] = Simova_Date::dateToView($pessoa[0]['dt_nasc']);

            //Adicionando subform para paciente no formulario de pessoa
            $form->getSubForm('Paciente')->populate($pessoa[0]);
        }

        //Populando formulario pessoa
        $form->populate($pessoa[0]);

        //Populando formulario endereço
        $form->getSubForm('Endereco')->populate($pessoa[0]);

        //Decodificando a senha do usuario
        $pessoa[0]['senha_login'] = App_Model_Login::decodingBase64($pessoa[0]['senha_login']);
        //Populando formulario login
        $form->getSubForm('Login')->populate($pessoa[0]);

        //Zend_Debug::dump($model->getArrayById($this->getParam('cod_pessoa')));

        $this->view->form = $form;
    }

    private function save($tipoPessoa, $post) {

        //Add valor a variavel para tipo de registro ativo
        $post['cod_sit'] = 1;

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
            //$telefone = new App_Model_Telefone();
            //$telefone->saveMultiple($post, 2);
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

            return true;
        }
    }

    private function restaurar($actionRedirect) {

        if ($this->_getParam('cod_pessoa')) {
            $model = new App_Model_Pessoa();
            $data = $model->find($this->_getParam('cod_pessoa'))->toArray();
            $data[0]['cod_sit'] = 1;

            $model->save($data[0], 'cod_pessoa = ' . $data['cod_pessoa']);

            $this->_helper->flashMessenger(array('success' => Simova_Mensagens::RESTAURAR_SUCESSO));
        }

        $this->_redirect('/admin/pessoa/' . $actionRedirect);
    }

    public function restaurarFuncionarioAction() {
        $this->restaurar('consulta-funcionario');
    }

    public function restaurarPacienteAction() {
        $this->restaurar('consulta-paciente');
    }

    private function populatePerfil(array $perfil) {
        $modelPerfil = new App_Model_Perfil();

        foreach ($modelPerfil->listAll() as $value) {
            if (in_array($value->cod_perfil, $perfil)) {
                $this->_form->getElement('cod_perfil')
                        ->addMultiOption($value->cod_perfil, $value->nome_perfil);
            }
        }
    }

    public function buscaPorCpfAction() {
        if ($this->buscaPorCpf($this->_getParam('cpf'), $this->_getParam('cod_pessoa'))) {
            return $this->_helper->json(array('retorno' => true));
        } else {
            return $this->_helper->json(array('retorno' => false));
        }
    }

    /**
     * Metodo que faz verificação da existencia do CPF e a validação do mesmo
     * @param type $cpf
     * @param type $codPessoa
     * @return boolean
     */
    private function buscaPorCpf($cpf, $codPessoa = null) {
        try {
            //busca da existencia do CPF, dependendo do codigo da pessoa
            //o CPF será validado como existente ou não existente
            
            /*
             * Funcionamento
             * Usuario digitou CPF e acionou evento (focusout) ->
             * Jquery ->
             * PessoaController::buscaPorCpfAction -> 
             * PessoaController::buscaPorCpf -> App_Model_Pessoa::findByCpf();
             */
            
            $model = new App_Model_Pessoa();

            $codPessoa = !empty($codPessoa) ? $codPessoa : null;

            $model->findByCpf($cpf, $codPessoa);
            
            return true;
        } catch (Zend_Exception $e) {
            $validate = new Simova_Validates();

            if($validate->isValid($cpf)){
                return false;
            }else{
                return true;
            }
        }
    }

}

