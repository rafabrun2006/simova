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
            $dadosEndereco = array('endereco'=>$post['endereco']);
            @$post['Endereco'] = array('complemento'=>$post['complemento']);
                    
            if ($form->isValid($post)) {
                
                print_r($post);
                
                $endereco = new Model_Endereco();
                $cod_end = $endereco->insert($dadosEndereco);
                
                unset($post['Endereco']);
                unset($post['endereco']);
                unset($post['complemento']);
                unset($post['bairro']);
                unset($post['cep']);
                unset($post['Perfil']);
                
                //Inserção dos dados no banco
                
                $post['cod_end'] = $cod_end;
                
                $model = new Model_Pessoa();
                    
                if($model->insert($post)){
                    $this->view->mensagem = array(
                        'type'=>'alert-sucess', 'mensagem'=>'Cadastrado com sucesso!'
                        );
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

