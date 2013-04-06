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
        $form->addSubForm(new Admin_Form_Funcionario(), 'Funcionario');

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();
            
            if ($form->isValid($post)) {
                if ($this->save('F', $post)) {
                    $this->view->mensagem = array(
                        'type' => 'alert-success', 'mensagem' => 'Alteração efetuado com sucesso!'
                    );

                    $this->_redirect('/admin/perfil/editar');
                }
            }else{
                Zend_Debug::dump($form->getErrors());
            }
        }

        $this->populaFormEditar('F', $form, 28);

        $this->view->form = $form;
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

        //Zend_Debug::dump($pessoa[0]);

        $this->view->form = $form;
    }

    private function save($tipoPessoa, $post) {

        //Cadastrando um endereço
        $endereco = new App_Model_Endereco();
        $post['cod_end'] = $endereco->save($post);

        //Cadastrando login
        if (!empty($post['nome_login']) && !empty($post['senha_login'])) {
            $loginModel = new App_Model_Login();
            die('login');
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

