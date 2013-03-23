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
class Admin_Form_Telefone extends Zend_Form {
    
    public function init(){
        
        $cod = new Zend_Form_Element_Hidden('cod_telefone');
        $cod_pessoa = new Zend_Form_Element_Text('cod_pessoa');
        
        $num_tel1 = new Zend_Form_Element_Text('num_tel1');
        $num_tel1->setRequired(TRUE)
                ->removeDecorator('Errors');
        
        $num_tel2 = new Zend_Form_Element_Text('num_tel2');
        $num_tel2->setRequired(TRUE)
                ->removeDecorator('Errors');

        $this->addElements(array($cod, $cod_pessoa, $num_tel1, $num_tel2));
        
        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
        
    }
    
}
