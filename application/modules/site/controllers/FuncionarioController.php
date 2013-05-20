<?php

class Site_FuncionarioController extends Zend_Controller_Action
{
	
	public $arrays = array();
	
    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $model = new Application_Model_Funcionario();
        $this->view->funcionario = $model->listAll();
    }
	
	public function funcionarioAction(){
	
		$f1 = new App_Model_Funcionarios();
		
		$f1->nome = 'Joao Pedro';
		$f1->salario = 222;
		$f1->cargo = 'Programador';
		
		$this->adicionar($f1);
		
		$f2 = new App_Model_Funcionarios();
		$f2->nome = 'Pedro Maria';
		$f2->salario = 999;
		$f2->cargo = 'Pedreiro';		
		
		$this->adicionar($f2);
		
		$f3 = new App_Model_Funcionarios();
		$f3->nome = 'João Gadelha';
		$f3->salario = 9754;
		$f3->cargo = array(1=>'Pedreiro', 2=>'Programador');		
		
		$this->adicionar($f3);
		
		echo '<pre>';
		print_r($this->arrays);

		
		die;
	}
	
	public function adicionar($funcionario){
		return $this->arrays[] = $funcionario;
	}

}

