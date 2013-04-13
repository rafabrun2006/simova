<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Vacina
 *
 * @
 */
class Admin_Form_Vacina extends Zend_Form {

    const MESSAGE_REQUIRED = 'Preenchimento obrigatório';
    
    public function init() {

        $codVacina = new Zend_Form_Element_Hidden('cod_vacina');
        
        $nomeVacina = new Zend_Form_Element_Text('nome_vacina');
        $nomeVacina->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);
        
        $this->addSubForm(new Admin_Form_Fabricante(), 'Fabricante');
        
        $this->addElements(array($codVacina, $nomeVacina));
        
        foreach($this->getElements() as $element){
            $element->removeDecorator('htmlTag')
                    ->removeDecorator('label');
        }
    }

}