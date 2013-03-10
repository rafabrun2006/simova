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
        
        foreach ($this->getElements() as $element) {
            $element->setDecorators(array(
                'ViewHelper',
                array('HtmlTag', array('tag' => 'div', 'class' => 'controls')),
                array('Label', array('tag' => 'div', 'class' => 'control-label'))
            ));
        }
        
    }
    
}
