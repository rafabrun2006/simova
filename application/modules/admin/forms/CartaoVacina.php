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

        $dtVacina = new Zend_Form_Element_Text('dt_vacina', array('class' => 'date-utils', 'readonly' => TRUE));
        $dtVacina->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $codDose = new Zend_Form_Element_Select('dose');
        $codDose->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $codUnidade = new Zend_Form_Element_Select('cod_un_saude');
        $codUnidade->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $codVacina = new Zend_Form_Element_Select('cod_vacina');
        $codVacina->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $codPessoa = new Zend_Form_Element_Hidden('cod_pessoa');
        $codPessoa->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $codGrupoVacina = new Zend_Form_Element_Select('cod_grupo_vacina');
        $codGrupoVacina->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $codSituacaoVacina = new Zend_Form_Element_Hidden('cod_situacao_vacina');
        $codSituacaoVacina->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $this->addElements(array(
            $codCartaoVac,
            $dtVacina,
            $codPessoa,
            $codUnidade,
            $codGrupoVacina,
            $codVacina,
            $codSituacaoVacina,
            $codDose)
        );

        $this->populaComboUnidade();
        $this->populaComboVacina();
        $this->populaComboDose();
        $this->populaComboGrupoVacina();

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

    private function populaComboGrupoVacina() {
        $vacina = new App_Model_GrupoVacina();
        $this->getElement('cod_grupo_vacina')->addMultiOption('', '--');

        foreach ($vacina->fetchAll() as $option) {

            $this->getElement('cod_grupo_vacina')
                    ->addMultiOption($option->cod_grupo_vacina, $option->nome_grupo_vacina);
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

    private function populaComboDose() {
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