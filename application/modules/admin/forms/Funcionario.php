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
class Admin_Form_Funcionario extends Zend_Form {

    const MESSAGE_REQUIRED = 'Preenchimento obrigatório';

    public function init() {

        $cod_funcionario = new Zend_Form_Element_Hidden('cod_funcionario');
        $cod_pessoa = new Zend_Form_Element_Hidden('cod_pessoa');
        
        $matricula = new Zend_Form_Element_Text('matricula');
        $matricula->setRequired(TRUE);
        
        $cod_funcao = new Zend_Form_Element_Select('cod_funcao');
        $cod_funcao->setLabel('Função: ')
                ->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);
        
        $cod_cargo = new Zend_Form_Element_Select('cod_cargo');
        $cod_cargo->setLabel('Cargo: ')
                ->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);
        
        /*
         * Adicionando formularios auxiliares
         */

        $this->addElements(array(
            $cod_funcionario,
            $cod_funcao,
            $cod_cargo,
            $cod_pessoa,
            $matricula
        ));

        /*
         * Populando campos pre-preenchidos
         */
        $this->pupulaComboFuncao();
        
        $cod_cargo->addMultiOptions(array(1 => 'Médico', 2 => 'Enfermeiro', 3 => 'Técnico de Enfermagem'));

        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
    }

    private function pupulaComboFuncao() {

        $modelFuncao = new Model_Funcao();

        foreach ($modelFuncao->fetchAll() as $value) {
            $this->getElement('cod_funcao')
                    ->addMultiOption($value->cod_funcao, $value->nome_funcao);
        }
    }

}