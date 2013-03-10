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

        $codPessoa = new Zend_Form_Element_Hidden('Cod_Pessoa');

        $cpf = new Zend_Form_Element_Text('CPF');
        $cpf->setLabel('CPF: ')->setRequired(TRUE);

        $nome = new Zend_Form_Element_Text('Nome', array('class'=>'input-xlarge'));
        $nome->setLabel('Nome: ');

        $nomeMae = new Zend_Form_Element_Text('Nome_Mae', array('class'=>'input-xlarge'));
        $nomeMae->setLabel('Nome da Mãe: ');

        $nomePai = new Zend_Form_Element_Text('Nome_Pai', array('class'=>'input-xlarge'));
        $nomePai->setLabel('Nome do Pai: ');

        $sexo = new Zend_Form_Element_Radio('Sexo');
        $sexo->setLabel('Sexo: ');

        $rg = new Zend_Form_Element_Text('RG');
        $rg->setLabel('RG: ');

        $estadoCivil = new Zend_Form_Element_Text('Estado_Civil_Cod_Estado_Civil');
        $estadoCivil->setLabel('Estado Civil: ');

        $dtNascimento = new Zend_Form_Element_Text('Dt_nasc');
        $dtNascimento->setLabel('Data de Nascimento: ');

        $registroNasc = new Zend_Form_Element_Text('Registro');
        $registroNasc->setLabel('Nº do Registro de Nascimento: ');

        $codUnidadeSaude = new Zend_Form_Element_Text('TB_Unidade_Saude_Cod_Un_Saude');
        $codUnidadeSaude->setLabel('Codigo da Unidade de Saude:');
        
        $perfil = new Zend_Form_Element_Select('Cod_Perfil');
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
            $perfil,
        ));

        /*
         * Populando campos pre-preenchidos
         */
        $sexo->addMultiOptions(array('M' => 'Masculino', 'F' => 'Feminino'));
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
            $this->getElement('Cod_Perfil')
                    ->addMultiOption($value->Cod_Perfil, $value->Nome_Perfil);
        }

    }

}