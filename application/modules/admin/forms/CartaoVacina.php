<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Vacina
 *
 * @
 */
class Admin_Form_CartaoVacina extends Zend_Form {

    const MESSAGE_REQUIRED = 'Preenchimento obrigatório';

    public function init() {

        $codCartaoVac = new Zend_Form_Element_Hidden('cod_cartao_vac');

        $dtVacAplicada = new Zend_Form_Element_Text('dt_vac_aplicada', array('class'=>'date-utils', 'readonly'=>TRUE));
        $dtVacAplicada->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $dtAprazada = new Zend_Form_Element_Text('dt_aprazada', array('class'=>'date-utils', 'readonly'=>TRUE));
        $dtAprazada->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);
        
        $codLote = new Zend_Form_Element_Text('cod_lote');
        $codLote->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);
        
        $matricula = new Zend_Form_Element_Text('matricula');
        $matricula->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $codCampanha = new Zend_Form_Element_Select('cod_campanha');
        $codCampanha->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);
        
        $codDose = new Zend_Form_Element_Select('dose');
        $codDose->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);
        
        $codDoseApraz = new Zend_Form_Element_Select('dose_apraz');
        $codDoseApraz->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $codUnidade = new Zend_Form_Element_Select('cod_un_saude');
        $codUnidade->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);
        
        $codUnidadeApraz = new Zend_Form_Element_Select('cod_un_saude_apraz');
        $codUnidadeApraz->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $codVacina = new Zend_Form_Element_Select('cod_vacina');
        $codVacina->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);
        
        $codVacinaApraz = new Zend_Form_Element_Select('cod_vacina_apraz');
        $codVacinaApraz->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $this->addElements(array(
            $codCartaoVac,
            $dtVacAplicada,
            $dtAprazada,
            $codCampanha,
            $codUnidade,
            $codUnidadeApraz,
            $codVacina,
            $codVacinaApraz,
            $codLote,
            $matricula,
            $codDose)
        );

        $this->populaComboUnidade();
        $this->populaComboCampanha();
        $this->populaComboVacina();
        $this->populaComboDose();
        $this->populaComboUnidadeApraz();
        $this->populaComboVacinaApraz();
        
        foreach ($this->getElements() as $element) {
            $element->removeDecorator('htmlTag')
                    ->removeDecorator('label');
        }
    }

    private function populaComboUnidade() {
        $modelPerfil = new App_Model_UnidadeSaude();
        $this->getElement('cod_un_saude')->addMultiOption('', '--');

        foreach ($modelPerfil->fetchAll() as $value) {
            $this->getElement('cod_un_saude')
                    ->addMultiOption($value->cod_un_saude, $value->nome_un_saude);
        }
    }
    
    private function populaComboUnidadeApraz() {
        $modelPerfil = new App_Model_UnidadeSaude();
        $this->getElement('cod_un_saude_apraz')->addMultiOption('', '--');
        
        foreach ($modelPerfil->fetchAll() as $value) {
            $this->getElement('cod_un_saude_apraz')
                    ->addMultiOption($value->cod_un_saude, $value->nome_un_saude);
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

    private function populaComboVacinaApraz() {
        $vacina = new App_Model_Vacina();
        $this->getElement('cod_vacina_apraz')->addMultiOption('', '--');
        
        foreach ($vacina->joinAllRelations() as $option) {
            
            $this->getElement('cod_vacina_apraz')
                    ->addMultiOption($option->cod_vacina, $option->nome_vacina);
        }
    }
    
    private function populaComboVacina() {
        $vacina = new App_Model_Vacina();
        $this->getElement('cod_vacina')->addMultiOption('', '--');
        
        foreach ($vacina->joinAllRelations() as $option) {
            
            $this->getElement('cod_vacina')
                    ->addMultiOption($option->cod_vacina, $option->nome_vacina);
        }
    }
    
    private function populaComboDose(){
        $this->getElement('dose')->addMultiOptions(array(
            '' => '--',
            Simova_Constantes::PRIMEIRA_DOSE => '1ª Dose',
            Simova_Constantes::SEGUNDA_DOSE => '2ª Dose',
            Simova_Constantes::TERCEIRA_DOSE => '3ª Dose',
            Simova_Constantes::REFORCO => 'Reforço',
            Simova_Constantes::CAMPANHA => 'Campanha'
        ));
    }

}