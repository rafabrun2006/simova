<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Perfil
 *
 * @author bruno
 */
class Admin_Form_Login extends Zend_Form {

    public function init() {

        $cod_login = new Zend_Form_Element_Hidden('cod_login');
        
        $nome_login = new Zend_Form_Element_Text('nome_login');
        $nome_login->setRequired(TRUE);
        
        $senha_login = new Zend_Form_Element_Text('senha_login');
        $senha_login->setRequired(TRUE);

        $this->addElements(array(
            $cod_login, $nome_login, $senha_login)
        );

        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
    }

}
