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

        $codVacinaFabric = new Zend_Form_Element_Hidden('cod_vacina_fabricante');
        $this->addElement($codVacinaFabric);
        
        foreach($this->getElements() as $element){
            $element->removeDecorator('htmlTag')
                    ->removeDecorator('label');
        }
    }

}