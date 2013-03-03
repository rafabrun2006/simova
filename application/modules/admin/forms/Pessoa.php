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
        $cpf = new Zend_Form_Element_Text('CPF', 'CPF');
        $nome = new Zend_Form_Element_Text('NOME');
        $nomeMae = new Zend_Form_Element_Text('NOME_MAE');
        $nomePai = new Zend_Form_Element_Text('NOME_PAI');
        $sexo = new Zend_Form_Element_Radio('SEXO');
        $rg = new Zend_Form_Element_Text('RG');
        $estadoCivil = new Zend_Form_Element_Text('ESTADO_CIVIL');
        $dtNascimento = new Zend_Form_Element_Text('DT_NASC');
        $registroNasc = new Zend_Form_Element_Text('REGISTRO_NASC');
        $codUnidadeSaude = new Zend_Form_Element_Text('COD_UNIDADE_SAUDE');
        $tipoPessoa = new Zend_Form_Element_Radio('TIPO_PESSOA');

        $btn = new Zend_Form_Element_Button('enviar', array(
            'class' => 'btn btn-primary',
            'type' => 'submit',
            'label' => 'Salvar'
        ));


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
            $btn
        ));
        
        $elements = $this->getElements();
        foreach($elements as $element) {
            $element->removeDecorator('DtDdWrapper')
                    ->removeDecorator('htmlTag')
                    ->removeDecorator('label');
        }
    }

}
