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
class Cidade extends Zend_Form {

    public function init() {

        $codCidade = new Zend_Form_Element_Hidden('COD_CID');
        $nomeCidade = new Zend_Form_Element_Text('NOME_CID');
        $codUf = new Zend_Form_Element_Select('COD_UF');

        $this->addElements(array($codCidade, $nomeCidade, $codUf));
    }

}