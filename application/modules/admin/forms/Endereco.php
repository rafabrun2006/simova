<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Endereco
 *
 * @
 */
class Admin_Form_Endereco extends Zend_Form {

    const MESSAGE_REQUIRED = 'Preenchimento obrigatório';

    public function init() {

        $codEnd = new Zend_Form_Element_Hidden('cod_end');

        $codCID = new Zend_Form_Element_Select('cod_cid');
        $codCID->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $codUf = new Zend_Form_Element_Select('cod_uf');
        $codUf->setLabel('Estado: ');

        $endereco = new Zend_Form_Element_Text('endereco');
        $endereco->setLabel('Endereço: ');

        $cep = new Zend_Form_Element_Text('cep');
        $cep->setLabel('CEP: ');

        $bairro = new Zend_Form_Element_Text('bairro');
        $bairro->setLabel('Bairro: ');

        $numero = new Zend_Form_Element_Text('numero');
        $numero->setLabel('Numero:')
                ->addValidator(new Zend_Validate_Int())
                ->addErrorMessage("Informe um número");

        $complemento = new Zend_Form_Element_Text('complemento');
        $complemento->setLabel('Complemento:');

        $this->addElements(array(
            $codEnd,
            $codCID,
            $endereco,
            $cep,
            $bairro,
            $numero,
            $complemento,
            $codUf
        ));

        $this->populaComboCidade();
        $this->populaComboEstado();

        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
    }

    private function populaComboCidade() {
        $modelCidade = new App_Model_Cidade();
        
        $this->getElement('cod_cid')->addMultiOption('', '--Aguardando UF--');

        foreach ($modelCidade->listAll() as $value) {
            $this->getElement('cod_cid')
                    ->addMultiOption($value->cod_cid, $value->nome_cid);
        }
    }

    private function populaComboEstado() {

        $modelEstado = new App_Model_Estado();

        foreach ($modelEstado->fetchAll() as $value) {
            $this->getElement('cod_uf')
                    ->addMultiOption($value->cod_uf, $value->nome_uf);
        }
    }

}