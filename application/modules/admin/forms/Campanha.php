<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Cidade
 *
 * 
 */
class Cidade extends Zend_Form {

    public function init() {

        $codCampanha = new Zend_Form_Element_Hidden('cod_camp');
        $nomeCampanha = new Zend_Form_Element_Text('nome_camp');

        $this->addElements(array($cod_cargo, $nome_cargo));
        
        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
    }

}