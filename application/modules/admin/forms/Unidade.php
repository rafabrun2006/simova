<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Cidade
 *
 * @author bruno
 */
class Admin_Form_Unidade extends Zend_Form {

    public function init() {

        $cod_un_saude = new Zend_Form_Element_Hidden('cod_un_saude');

        $nome_un_saude = new Zend_Form_Element_Text('nome_un_saude');
        $nome_un_saude->setRequired(TRUE);

        $num_un_saude = new Zend_Form_Element_Text('num_un_saude');

        $this->addElements(array(
            $cod_un_saude,
            $nome_un_saude,
            $num_un_saude
        ));

        $this->addSubForm(new Admin_Form_Endereco(), 'Endereco');

        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
    }

}