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
class Admin_Form_Status extends Zend_Form {

    public function init() {

        $cod_status = new Zend_Form_Element_Radio('cod_status');
        $this->addElement($cod_status);
        
        $cod_status->addMultiOptions(array(
            1 => 'Ativo',
            0 => 'Inativo'))->setValue(1);

        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
    }

}
