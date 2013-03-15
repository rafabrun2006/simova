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
class Admin_Form_Endereco extends Zend_Form {

    public function init() {

        $codEnd = new Zend_Form_Element_Hidden('cod_end');

        $codCID = new Zend_Form_Element_Select('cod_cid');
        $codCID->setLabel('Cidade: ');

        $endereco = new Zend_Form_Element_Text('endereco');
        $endereco->setLabel('Endereço: ');

        $cep = new Zend_Form_Element_Text('cep');
        $cep->setLabel('CEP: ');

        $bairro = new Zend_Form_Element_Text('bairro');
        $bairro->setLabel('Bairro: ');

        $numero = new Zend_Form_Element_Text('numero');
        $numero->setLabel('Numero:');

        $complemento = new Zend_Form_Element_Text('complemento');
        $complemento->setLabel('Complemento:');

        $this->addElements(array(
            $codEnd,
            $codCID,
            $endereco,
            $cep,
            $bairro,
            $numero,
            $complemento
        ));

        $this->populaComboCidade();

//        foreach ($this->getElements() as $element) {
//            $element->setDecorators(array(
//                'ViewHelper',
//                array('HtmlTag', array('tag' => 'div', 'class' => 'controls')),
//                array('Label', array('tag' => 'div', 'class' => 'control-label'))
//            ));
//        }
        
        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
    }

    private function populaComboCidade() {

        $modelCidade = new Model_Cidade();

        foreach ($modelCidade->listAll() as $value) {
            $this->getElement('cod_cid')
                    ->addMultiOption($value->cod_cid, $value->nome_cid);
        }
    }

}