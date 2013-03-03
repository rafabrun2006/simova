<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Endereco
 *
 * @author bruno
 */
class Admin_Form_Endereco extends Zend_Form{
    
    public function init(){
        
        $codEnd = new Zend_Form_Element_Hidden('COD_END');
        $codCID = new Zend_Form_Element_Text('COD_CID');
        $endereco = new Zend_Form_Element_Text('ENDERECO');
        $cep = new Zend_Form_Element_Text('CEP');
        $bairro = new Zend_Form_Element_Text('BAIRRO');
        $numero = new Zend_Form_Element_Text('NUMERO');
        $complemento = new Zend_Form_Element_Text('COMPLEMENTO');
        
        $this->addElements(array(
            $codEnd,
            $codCID,
            $endereco,
            $cep,
            $bairro,
            $numero,
            $complemento
        ));
        
        $elements = $this->getElements();
        foreach($elements as $element) {
            $element->removeDecorator('DtDdWrapper')
                    ->removeDecorator('htmlTag')
                    ->removeDecorator('label');
        }
        
    }
    
}