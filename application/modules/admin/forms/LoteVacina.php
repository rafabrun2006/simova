<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Vacina
 *
 * 
 */
class Admin_Form_LoteVacina extends Zend_Form {

    public function init() {

        $codLoteVacina = new Zend_Form_Element_Hidden('cod_lote_vacina');
        $qtdVacina = new Zend_Form_Element_Text('qtd_vacina');

        $this->addElements(array($codLoteVacina, $qtdVacina));
        
        $this->addSubForm(new Admin_Form_Vacina(), 'Vacina');
        $this->addSubForm(new Admin_Form_Lote(), 'Lote');
        
        foreach($this->getElements() as $element){
            $element->removeDecorator('htmlTag')
                    ->removeDecorator('label');
        }
    }

}