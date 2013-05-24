<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Perfil
 *
 * 
 */
class Admin_Form_Login extends Zend_Form {

    const MESSAGE_REQUIRED = 'Preenchimento obrigatório';
    
    public function init() {

        $cod_login = new Zend_Form_Element_Hidden('cod_login');
        
        $nome_login = new Zend_Form_Element_Text('nome_login');
        $nome_login->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);
        
        $senha_login = new Zend_Form_Element_Text('senha_login', array('placeholder'=>'Minimo 3 máximo 12', 'maxlength'=>12));
        $senha_login->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $this->addElements(array(
            $cod_login, $nome_login, $senha_login)
        );

        $this->passwordRand();
        
        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
    }

    public function passwordRand(){
        
        for($i=0;$i<11;$i++){
            $passwordRand .= rand(1, 9); 
        }

        $this->getElement('senha_login')->setValue($passwordRand);
    }
}
