<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Cidade
 *
 * 
 */
class Admin_Form_VacinaAplicada extends Zend_Form {

    const MESSAGE_REQUIRED = 'Preenchimento obrigatório';

    public function init() {

        $codVacinaAplicada = new Zend_Form_Element_Hidden('cod_vacina_aplicada');
        $codVacinaAplicada->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $codLote = new Zend_Form_Element_Text('lote');
        $codLote->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $matricula = new Zend_Form_Element_Text('matricula');
        $matricula->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $this->addElements(array(
            $codVacinaAplicada,
            $codLote,
            $matricula
        ));

        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
    }

}