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
class Admin_Form_Lote extends Zend_Form {

    public function init() {

        $codLote = new Zend_Form_Element_Hidden('cod_lote');
        
        $numLote = new Zend_Form_Element_Text('num_lote');
        $numLote->setRequired(TRUE);
        
        $dtVenc = new Zend_Form_Element_Text('dt_venc');
        $dtVenc->setRequired(TRUE)
                ->addValidator(new Zend_Validate_Date())
                ->addErrorMessage('Necessario uma data valida');
        
        $dtFabric = new Zend_Form_Element_Text('dt_fabric');
        $dtFabric->setRequired(TRUE)
                ->addValidator(new Zend_Validate_Date())
                ->addErrorMessage('Necessario uma data valida');
        
        $this->addElements(array($codLote, $numLote, $dtFabric, $dtVenc));
        
        foreach($this->getElements() as $element){
            $element->removeDecorator('htmlTag')
                    ->removeDecorator('label');
        }
    }

}