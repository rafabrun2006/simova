<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Vacina
 *
 * @author bruno
 */
class Admin_Form_Fabricante extends Zend_Form {

    public function init() {

        $codFabric = new Zend_Form_Element_Hidden('cod_fabric');
        $nomeFabric = new Zend_Form_Element_Text('nome_fabric');

        $this->addElements(array($codFabric, $nomeFabric));
        
        foreach($this->getElements() as $element){
            $element->removeDecorator('htmlTag')
                    ->removeDecorator('label');
        }
    }

}