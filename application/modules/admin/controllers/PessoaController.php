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
            
            @$post['Perfil'] = array('Perfil'=>$post['Perfil']);
            @$post['Endereco'] = array('Endereco'=>$post['Endereco']);
                    
            if ($form->isValid($post)) {
                
                //Inserção dos dados no banco
                $model = new Model_Pessoa();
                    
                if($model->insert($post)){
                    echo 'inserido';
                }
            }else{
                $form->populate($post);
            }
        }
        $this->view->form = $form;
    }

    public function cadastroPacienteAction() {
        $form = new Admin_Form_Pessoa();

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();
            
            @$post['Perfil'] = array('Perfil'=>$post['Perfil']);
            @$post['Endereco'] = array('Endereco'=>$post['Endereco']);
                    
            if ($form->isValid($post)) {
                $model = new Model_Pessoa();
                    
                if($model->insert($post)){
                    echo 'inserido';
                }
            }else{
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

