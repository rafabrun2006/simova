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
    const MESSAGE_TIPO_INVALIDO = 'Tipo Invalido';

    public function init() {

        $cod_funcionario = new Zend_Form_Element_Hidden('cod_funcionario');
        $cod_pessoa = new Zend_Form_Element_Hidden('cod_pessoa');

        $matricula = new Zend_Form_Element_Text('matricula');
        $matricula->addValidator(new Zend_Validate_Int())
                ->addErrorMessage(self::MESSAGE_TIPO_INVALIDO)
                ->setRequired(TRUE);

        $cod_funcao = new Zend_Form_Element_Select('cod_funcao');
        $cod_funcao->setLabel('Função: ')
                ->setRequired(true)
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
        $this->populaComboCargo();

        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
    }

    private function pupulaComboFuncao() {

        $modelFuncao = new App_Model_Funcao();

        $this->getElement('cod_funcao')
                    ->addMultiOption(NULL, '--');
        
        foreach ($modelFuncao->fetchAll() as $value) {
            $this->getElement('cod_funcao')
                    ->addMultiOption($value->cod_funcao, $value->nome_funcao);
        }
    }

    private function populaComboCargo() {

        $modelCargo = new App_Model_Cargo();

        $this->getElement('cod_cargo')
                    ->addMultiOption(NULL, '--');
        
        foreach ($modelCargo->fetchAll() as $value) {
            $this->getElement('cod_cargo')
                    ->addMultiOption($value->cod_cargo, $value->nome_cargo);
        }
    }

}