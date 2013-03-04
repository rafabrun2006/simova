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
class Admin_Form_Pessoa extends Zend_Form {

    public function init() {

        $codPessoa = new Zend_Form_Element_Hidden('COD_PESSOA');

        $cpf = new Zend_Form_Element_Text('CPF');
        $cpf->setLabel('CPF: ')->setRequired(TRUE);

        $nome = new Zend_Form_Element_Text('NOME', array('class'=>'input-xlarge'));
        $nome->setLabel('Nome: ');

        $nomeMae = new Zend_Form_Element_Text('NOME_MAE', array('class'=>'input-xlarge'));
        $nomeMae->setLabel('Nome da Mãe: ');

        $nomePai = new Zend_Form_Element_Text('NOME_PAI', array('class'=>'input-xlarge'));
        $nomePai->setLabel('Nome do Pai: ');

        $sexo = new Zend_Form_Element_Radio('SEXO');
        $sexo->setLabel('Sexo: ');

        $rg = new Zend_Form_Element_Text('RG');
        $rg->setLabel('RG: ');

        $estadoCivil = new Zend_Form_Element_Text('ESTADO_CIVIL');
        $estadoCivil->setLabel('Estado Civil: ');

        $dtNascimento = new Zend_Form_Element_Text('DT_NASC');
        $dtNascimento->setLabel('Data de Nascimento: ');

        $registroNasc = new Zend_Form_Element_Text('REGISTRO_NASC');
        $registroNasc->setLabel('Nº do Registro de Nascimento: ');

        $codUnidadeSaude = new Zend_Form_Element_Text('COD_UNIDADE_SAUDE');
        $codUnidadeSaude->setLabel('Codigo da Unidade de Saude:');

        $tipoPessoa = new Zend_Form_Element_Radio('TIPO_PESSOA');
        $tipoPessoa->setLabel('Tipo de Pessoa');
        
        $perfil = new Zend_Form_Element_Select('COD_PERFIL');
        $perfil->setLabel('Perfil:');

        /*
         * Adicionando formularios auxiliares
         */
        $this->addSubForm(new Admin_Form_Email(), 'Email');
        $this->addSubForm(new Admin_Form_Perfil(), 'Perfil');
        $this->addSubForm(new Admin_Form_Endereco(), 'Endereco');

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
            $tipoPessoa,
            $perfil,
        ));

        /*
         * Populando campos pre-preenchidos
         */
        $sexo->addMultiOptions(array('M' => 'Masculino', 'F' => 'Feminino'));
        $tipoPessoa->addMultiOptions(array('P' => 'Paciente', 'F' => 'Funcionário'));
        $this->pupulaComboPerfil();

        foreach ($this->getElements() as $element) {
            $element->setDecorators(array(
                'ViewHelper',
                'Errors',
                array('HtmlTag', array('tag' => 'div', 'class' => 'controls')),
                array('Label', array('tag' => 'div', 'class' => 'control-label'))
            ));
        }
    }
    
    private function pupulaComboPerfil(){

        $modelPerfil = new Model_Perfil();

        foreach ($modelPerfil->listAll() as $value) {
            $this->getElement('COD_PERFIL')
                    ->addMultiOption($value->COD_PERFIL, $value->NOME_PERFIL);
        }

    }

}