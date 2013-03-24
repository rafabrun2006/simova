<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Cidade
 *
 * @author bruno
 */
class Unidade extends Zend_Form {

    public function init() {

        $cod_cargo = new Zend_Form_Element_Hidden('cod_cargo');
        $nome_cargo = new Zend_Form_Element_Text('nome_cargo');

        $this->addElements(array($cod_cargo, $nome_cargo));
        
        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
    }

}