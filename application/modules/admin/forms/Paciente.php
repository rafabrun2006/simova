<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CadastroVacinas
 *
 * @author bruno
 */
class Admin_Form_Paciente extends Zend_Form {

    const MESSAGE_REQUIRED = 'Preenchimento obrigatório';

    public function init() {

        $cod_paciente = new Zend_Form_Element_Hidden('cod_pac');
        $cod_pessoa = new Zend_Form_Element_Hidden('cod_pessoa');

        /*
         * Adicionando formularios auxiliares
         */

        $this->addElements(array(
            $cod_paciente,
            $cod_pessoa,
        ));

        /*
         * Populando campos pre-preenchidos
         */

        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
    }

}