<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Perfil
 *
 
 */
class Admin_Form_Perfil extends Zend_Form {

    const MESSAGE_REQUIRED = 'Preenchimento obrigatório';

    public function init() {

        $cod = new Zend_Form_Element_Hidden('cod_perfil');
        $cod->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $nome = new Zend_Form_Element_Text('nome_perfil');

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
