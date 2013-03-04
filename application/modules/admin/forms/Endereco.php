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

        $codEnd = new Zend_Form_Element_Hidden('COD_END');

        $codCID = new Zend_Form_Element_Select('COD_CID');
        $codCID->setLabel('Cidade: ');

        $endereco = new Zend_Form_Element_Text('ENDERECO');
        $endereco->setLabel('Endereço: ');

        $cep = new Zend_Form_Element_Text('CEP');
        $cep->setLabel('CEP: ');

        $bairro = new Zend_Form_Element_Text('BAIRRO');
        $bairro->setLabel('Bairro: ');

        $numero = new Zend_Form_Element_Text('NUMERO');
        $numero->setLabel('Numero:');

        $complemento = new Zend_Form_Element_Text('COMPLEMENTO');
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

        foreach ($this->getElements() as $element) {
            $element->setDecorators(array(
                'ViewHelper',
                array('HtmlTag', array('tag' => 'div', 'class' => 'controls')),
                array('Label', array('tag' => 'div', 'class' => 'control-label'))
            ));
        }
    }

    private function populaComboCidade() {

        $modelCidade = new Model_Cidade();

        foreach ($modelCidade->listAll() as $value) {
            $this->getElement('COD_CID')
                    ->addMultiOption($value->COD_CID, $value->NOME_CID);
        }
    }

}