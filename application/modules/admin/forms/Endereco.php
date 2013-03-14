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

        $codEnd = new Zend_Form_Element_Hidden('Cod_End');

        $codCID = new Zend_Form_Element_Select('Cod_Cid');
        $codCID->setLabel('Cidade: ');

        $endereco = new Zend_Form_Element_Text('Endereco');
        $endereco->setLabel('Endereço: ');

        $cep = new Zend_Form_Element_Text('CEP');
        $cep->setLabel('CEP: ');

        $bairro = new Zend_Form_Element_Text('Bairro');
        $bairro->setLabel('Bairro: ');

        $numero = new Zend_Form_Element_Text('Numero');
        $numero->setLabel('Numero:');

        $complemento = new Zend_Form_Element_Text('Complemento');
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
            $this->getElement('Cod_Cid')
                    ->addMultiOption($value->cod_cid, $value->nome_cid);
        }
    }

}