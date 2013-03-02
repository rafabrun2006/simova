<?php

class Model_Funcionario extends Zend_Db_Table_Abstract
{

    protected $_name = 'funcionario';
    protected $id;
    protected $nome;
    
    public function getId ()
    {
        return $this->id;
    }

    public function setId ($id)
    {
        $this->id = $id;
    }

    public function getNome ()
    {
        return $this->nome;
    }

    public function setNome ($nome)
    {
        $this->nome = $nome;
    }

    public function listAll ()
    {
        foreach($this->fetchAll() as $value){
            $model = new Application_Model_Funcionario(); 
            $model->setId($value->id);
            $model->setNome($value->nome);
            
            $fetch[] = $model;
        }

        return $fetch;
    }

}

