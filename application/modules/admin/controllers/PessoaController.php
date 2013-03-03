<?php

class Admin_PessoaController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
    }
    
    public function cadastroAction(){
        $form = new Admin_Form_Pessoa();
        
        $this->view->form = $form;
    }


}

