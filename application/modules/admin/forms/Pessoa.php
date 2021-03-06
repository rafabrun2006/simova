<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CadastroVacinas
 *
 * admin/form/pessoa.php
 */
class Admin_Form_Pessoa extends Zend_Form {

    const MESSAGE_REQUIRED = 'Preenchimento obrigatório';
    const MESSAGE_INVALID_CPF = 'Insira um numero de CPF válido';

    public function init() {

        $codPessoa = new Zend_Form_Element_Hidden('cod_pessoa');

        $cpf = new Zend_Form_Element_Text('cpf');
        $cpf->setLabel('CPF: ')
                ->setRequired(FALSE)
                ->addErrorMessage(self::MESSAGE_INVALID_CPF)
                ->addValidator(new Simova_Validates())
                ;

        $nome = new Zend_Form_Element_Text('nome', array('class' => 'input-xlarge'));
        $nome->setLabel('Nome: ')
                ->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED)
                //->addValidator(new Zend_Validate_Alpha())
                ;

        $nomeMae = new Zend_Form_Element_Text('nome_mae', array('class' => 'input-xlarge'));
        $nomeMae->setLabel('Nome da Mãe: ')
                ->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED)
                //->addValidator(new Zend_Validate_Alpha())
                ;

        $nomePai = new Zend_Form_Element_Text('nome_pai', array('class' => 'input-xlarge'));
        $nomePai->setLabel('Nome do Pai: ')
                //->addValidator(new Zend_Validate_Alpha())
                ;

        $sexo = new Zend_Form_Element_Radio('sexo');
        $sexo->setLabel('Sexo: ')
                ->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $rg = new Zend_Form_Element_Text('rg');
        $rg->setLabel('RG: ');
                

        $estadoCivil = new Zend_Form_Element_Select('cod_estado_civil');
        $estadoCivil->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED)
                ->setLabel('Estado Civil: ');

        $dtNascimento = new Zend_Form_Element_Text('dt_nasc', array('readonly' => 'readonly', 'class'=>'date-utils'));
        $dtNascimento->setLabel('Data de Nascimento: ')
                ->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED)
                ;

        $registroNasc = new Zend_Form_Element_Text('registro_nasc');
        $registroNasc->setLabel('Nº do Registro de Nascimento: ');

        $codUnidadeSaude = new Zend_Form_Element_Select('cod_un_saude');
        $codUnidadeSaude->setLabel('Codigo da Unidade de Saude:')
                ->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $perfil = new Zend_Form_Element_Select('cod_perfil');
        $perfil->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $email = new Zend_Form_Element_Text('email', array('class' => 'input-xlarge'));
        $email->setLabel('Email:')
                ->addValidator(new Zend_Validate_EmailAddress());
        
        $telResidencial = new Zend_Form_Element_Text('telefone_residencial');
        $telCelular = new Zend_Form_Element_Text('telefone_celular');
        $telCelular->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED)
                ;
        
        /*
         * Adicionando formularios auxiliares
         */
        $this->addSubForm(new Admin_Form_Endereco(), 'Endereco');
        $this->addSubForm(new Admin_Form_Login(), 'Login');
        $this->addSubForm(new Admin_Form_Status(), 'Status');

        $this->addElements(array(
            $codPessoa,
            $nome,
            $cpf,
            $nomeMae,
            $nomePai,
            $sexo,
            $rg,
            $estadoCivil,
            $dtNascimento,
            $registroNasc,
            $codUnidadeSaude,
            $perfil,
            $email,
            $telCelular,
            $telResidencial
        ));

        /*
         * Populando campos pre-preenchidos
         */
        $sexo->addMultiOptions(array('M' => 'Masculino', 'F' => 'Feminino'))->setValue('M');
        $this->populaComboUnidade();
        $this->populaEstadoCivil();

        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
    }

    /*
     * @email Rafael Administrador <rafabrun2006@gmail.com>
     */

    private function populaComboUnidade() {

        $modelPerfil = new App_Model_UnidadeSaude();

        foreach ($modelPerfil->fetchAll() as $value) {
            $this->getElement('cod_un_saude')
                    ->addMultiOption($value->cod_un_saude, $value->nome_un_saude);
        }
    }

    private function populaEstadoCivil(){
        $modelEstadoCivil = new App_Model_EstadoCivil();
        
        foreach($modelEstadoCivil->fetchAll() as $value){
            $this->getElement('cod_estado_civil')
                    ->addMultiOption($value->cod_estado_civil, $value->nome_estado_civil);
        }
    }
}
