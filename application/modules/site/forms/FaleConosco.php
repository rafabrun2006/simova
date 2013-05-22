<?php

class Site_Form_FaleConosco extends Zend_Form
{

    public function init()
    {
       $nome= new Zend_Form_Element_Text("nome",array("label"=>"Nome: "));
       $this->addElement($nome);
       
       
       $email= new Zend_Form_Element_Text("email", array("label"=>"E-mail: "));
       $this->addElement($email);
       
       
       $conteudo= new Zend_Form_Element_Textarea("conteudo",array("label"=>"Conteudo: " ,"cols"=>"40", "rows"=>"2"));
       $this->addElement($conteudo);
       
       
    }


}

