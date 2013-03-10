<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Email
 *
 * @author bruno
 */
class Admin_Form_Email extends Zend_Form {

    public function init() {

        $codEmail = new Zend_Form_Element_Hidden('COD_EMAIL');
        $nomeEmail = new Zend_Form_Element_Text('NOME_EMAIL');

        $this->addElements(array($codEmail, $nomeEmail));
        
        foreach ($this->getElements() as $element) {
            $element->setDecorators(array(
                'ViewHelper',
                array('HtmlTag', array('tag' => 'div', 'class' => 'controls')),
                array('Label', array('tag' => 'div', 'class' => 'control-label'))
            ));
        }
    }

}