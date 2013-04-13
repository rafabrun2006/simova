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
class Admin_Form_Lote extends Zend_Form {

    const MESSAGE_REQUIRED = 'Preenchimento obrigatório';
    
    public function init() {

        $codLote = new Zend_Form_Element_Hidden('cod_lote');
        
        $numLote = new Zend_Form_Element_Text('num_lote');
        $numLote->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);
        
        $dtVenc = new Zend_Form_Element_Text('dt_venc', array('class' => 'date-utils', 'readonly' => TRUE));
        $dtVenc->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);
        
        $dtFabric = new Zend_Form_Element_Text('dt_fabric', array('class' => 'date-utils', 'readonly' => TRUE));
        $dtFabric->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);
        
        $this->addElements(array($codLote, $numLote, $dtFabric, $dtVenc));
        
        foreach($this->getElements() as $element){
            $element->removeDecorator('htmlTag')
                    ->removeDecorator('label');
        }
    }

}