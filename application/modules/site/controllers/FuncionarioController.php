<?php

class FuncionarioController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $model = new Application_Model_Funcionario();
        $this->view->funcionario = $model->listAll();
    }


}

