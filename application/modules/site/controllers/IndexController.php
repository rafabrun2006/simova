<?php

class Site_IndexController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
        
        $this->view->hasIdentity = Zend_Auth::getInstance()->hasIdentity();
        $this->view->user = Zend_Auth::getInstance()->getIdentity();
    }

    public function indexAction() {
        
    }

    public function institucionalAction() {
        
    }

    public function consultarVacinasAction() {
        
    }

    public function consultarCalendarioAction() {
        
    }

    public function centroSaudeAction() {
        
    }

    public function consultarLegislacaoAction() {
        
    }

    public function campanhasAction() {
        
    }

    public function faleConoscoAction() {

        require APPLICATION_PATH . '/modules/site/forms/FaleConosco.php';

        $form = new Site_Form_FaleConosco();


        if ($this->_request->isPost()) {
            # RECEBENDO OS DADOS DO FORMULÁRIO

            $post = $this->_request->getPost();
            $nome = $post["nome"];
            $email = $post["email"];
            $conteudo = $post["conteudo"];
            
            global $email;



        mail("itgills@gmail.com", "$assunto", "Nome: $nome\nData: $data\nIp: $ip\nNavegador: $navegador\nHora: $hora\nSite: $site\nE-mail: $email\nTelefone: $fone\n\nMensagem: $mensagem", "From: $email"
        );

        $site = "itgills@gmail.com";
        $titulo = "Resposta automatica";
        $msg = "$nome, obrigado por entrar em contato conosco, em breve entraremos em contato";

        mail("$email", "$titulo", "$msg", "From: $site");
        
        }
        
        $this->view->form = $form;
       
    }
    
    public function duvidasAction() {
        
    }
    
    public function linksUteisAction() {
        
    }

}

