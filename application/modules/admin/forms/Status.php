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
class Admin_Form_Status extends Zend_Form {
    
    public function init(){
        
        $cod = new Zend_Form_Element_Hidden('cod_status');
        $nome = new Zend_Form_Element_Text('nome_status');

        $this->addElements(array($cod, $nome));
        
        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
        
    }
    
}
