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
class Admin_Form_Perfil extends Zend_Form {
    
    public function init(){
        
        $cod = new Zend_Form_Element_Hidden('COD_PERFIL');
        $nome = new Zend_Form_Element_Text('NOME_PERFIL');

        $this->addElements(array($cod, $nome));
        
        $elements = $this->getElements();
        foreach($elements as $element) {
            $element->removeDecorator('DtDdWrapper')
                    ->removeDecorator('htmlTag')
                    ->removeDecorator('label');
        }
        
    }
    
}
