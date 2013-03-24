<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CadastroVacinas
 *
 * @author bruno
 * @email Rafael Bruno <rafabrun2006@gmail.com>
 */
class Admin_Form_Pessoa extends Zend_Form {

    const MESSAGE_REQUIRED = 'Preenchimento obrigatório';

    public function init() {

        $codPessoa = new Zend_Form_Element_Hidden('cod_pessoa');

        $cpf = new Zend_Form_Element_Text('cpf');
        $cpf->setLabel('CPF: ');

        $nome = new Zend_Form_Element_Text('nome', array('class' => 'input-xlarge'));
        $nome->setLabel('Nome: ')
                ->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $nomeMae = new Zend_Form_Element_Text('nome_mae', array('class' => 'input-xlarge'));
        $nomeMae->setLabel('Nome da Mãe: ')
                ->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $nomePai = new Zend_Form_Element_Text('nome_pai', array('class' => 'input-xlarge'));
        $nomePai->setLabel('Nome do Pai: ');

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

        $dtNascimento = new Zend_Form_Element_Text('dt_nasc', array('readonly' => 'readonly'));
        $dtNascimento->setLabel('Data de Nascimento: ')
                ->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $registroNasc = new Zend_Form_Element_Text('registro_nasc');
        $registroNasc->setLabel('Nº do Registro de Nascimento: ');

        $codUnidadeSaude = new Zend_Form_Element_Select('cod_un_saude');
        $codUnidadeSaude->setLabel('Codigo da Unidade de Saude:')
                ->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED);

        $perfil = new Zend_Form_Element_Select('cod_perfil');
        $perfil->setRequired(TRUE)
                ->addErrorMessage(self::MESSAGE_REQUIRED)
                ->setLabel('Perfil:');

        $email = new Zend_Form_Element_Text('email', array('class' => 'input-xlarge'));
        $email->setLabel('Email:')
                ->addValidator(new Zend_Validate_EmailAddress());
        /*
         * Adicionando formularios auxiliares
         */
        $this->addSubForm(new Admin_Form_Perfil(), 'Perfil');
        $this->addSubForm(new Admin_Form_Endereco(), 'Endereco');
        $this->addSubForm(new Admin_Form_Login(), 'Login');
        $this->addSubForm(new Admin_Form_Telefone(), 'Telefone');
        $this->addSubForm(new Admin_Form_Funcionario(), 'Funcionario');
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
        ));

        /*
         * Populando campos pre-preenchidos
         */
        $sexo->addMultiOptions(array('M' => 'Masculino', 'F' => 'Feminino'))->setValue('M');
        $estadoCivil->addMultiOptions(array('1' => 'Solteiro', '2' => 'Casado'));
        $this->populaComboPerfil();
        $this->populaComboUnidade();

        foreach ($this->getElements() as $element) {
            $element->removeDecorator('HtmlTag')->removeDecorator('Label');
        }
    }

    /*
     * @email Rafael Bruno <rafabrun2006@gmail.com>
     */

    private function populaComboPerfil() {

        $modelPerfil = new App_Model_Perfil();

        foreach ($modelPerfil->listAll() as $value) {
            $this->getElement('cod_perfil')
                    ->addMultiOption($value->cod_perfil, $value->nome_perfil);
        }
    }

    private function populaComboUnidade() {

        $modelPerfil = new App_Model_UnidadeSaude();

        foreach ($modelPerfil->fetchAll() as $value) {
            $this->getElement('cod_un_saude')
                    ->addMultiOption($value->cod_un_saude, $value->nome_un_saude);
        }
    }

}