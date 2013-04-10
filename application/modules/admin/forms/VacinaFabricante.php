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
class Admin_Form_VacinaFabricante extends Zend_Form {

    public function init() {

        $this->addSubForm(new Admin_Form_Vacina(), 'Vacina');
        $this->addSubForm(new Admin_Form_Fabricante(), 'Fabricante');
        
        foreach($this->getElements() as $element){
            $element->removeDecorator('htmlTag')
                    ->removeDecorator('label');
        }
    }

}