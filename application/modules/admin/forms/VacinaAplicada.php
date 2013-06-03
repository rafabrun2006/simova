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

        $codLote = new Zend_Form_Element_Select('lote');
        $codLote->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);
        
        $codCampanha = new Zend_Form_Element_Select('cod_campanha');
        $codCampanha->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $matricula = new Zend_Form_Element_Select('matricula');
        $matricula->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $this->addElements(array(
            $codVacinaAplicada,
            $codLote,
            $matricula,
            $codCampanha
        ));

        $this->populaComboCampanha();
        $this->populaComboMatricula();
        $this->populaComboLote();
        
        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
    }
    
    private function populaComboCampanha() {
        $campanha = new App_Model_Campanha();
        $this->getElement('cod_campanha')->addMultiOption('', '--');

        foreach ($campanha->fetchAll() as $option) {
            $this->getElement('cod_campanha')
                    ->addMultiOption($option->cod_camp, $option->nome_camp);
        }
    }
    
    private function populaComboMatricula(){
        $funcionario = new App_Model_Funcionario();
        
        $this->getElement('matricula')->addMultiOption('', '--');
        
        foreach($funcionario->fetchAll() as $option){
            $this->getElement('matricula')->addMultiOption($option->matricula, $option->matricula);
        }
    }
    
    private function populaComboLote(){
        $modelLote = new App_Model_Lote();
        
        foreach($modelLote->fetchAll() as $lote){
            $this->getElement('lote')->addMultiOption($lote->cod_lote, $lote->num_lote);
        }
    }

}