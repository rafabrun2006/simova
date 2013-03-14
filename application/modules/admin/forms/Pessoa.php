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

        $codPessoa = new Zend_Form_Element_Hidden('cod_pessoa');

        $cpf = new Zend_Form_Element_Text('CPF');
        $cpf->setLabel('CPF: ')->setRequired(TRUE);

        $nome = new Zend_Form_Element_Text('nome', array('class'=>'input-xlarge'));
        $nome->setLabel('Nome: ');

        $nomeMae = new Zend_Form_Element_Text('nome_mae', array('class'=>'input-xlarge'));
        $nomeMae->setLabel('Nome da Mãe: ');

        $nomePai = new Zend_Form_Element_Text('nome_pai', array('class'=>'input-xlarge'));
        $nomePai->setLabel('Nome do Pai: ');

        $sexo = new Zend_Form_Element_Radio('sexo');
        $sexo->setLabel('Sexo: ');

        $rg = new Zend_Form_Element_Text('RG');
        $rg->setLabel('RG: ');

        $estadoCivil = new Zend_Form_Element_Select('cod_estado_civil');
        $estadoCivil->setLabel('Estado Civil: ');

        $dtNascimento = new Zend_Form_Element_Text('dt_nasc');
        $dtNascimento->setLabel('Data de Nascimento: ');

        $registroNasc = new Zend_Form_Element_Text('registro_nasc');
        $registroNasc->setLabel('Nº do Registro de Nascimento: ');

        $codUnidadeSaude = new Zend_Form_Element_Text('cod_un_saude');
        $codUnidadeSaude->setLabel('Codigo da Unidade de Saude:');
        
        $perfil = new Zend_Form_Element_Select('cod_perfil');
        $perfil->setLabel('Perfil:');

        $email = new Zend_Form_Element_Text('email', array('class'=>'input-xlarge'));
        $email->setLabel('Email:');
        /*
         * Adicionando formularios auxiliares
         */
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
            $perfil,
            $email
        ));

        /*
         * Populando campos pre-preenchidos
         */
        $sexo->addMultiOptions(array('M' => 'Masculino', 'F' => 'Feminino'));
        $estadoCivil->addMultiOptions(array('S' => 'Solteiro', 'C' => 'Casado'));
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
            $this->getElement('cod_perfil')
                    ->addMultiOption($value->cod_perfil, $value->nome_perfil);
        }

    }

}