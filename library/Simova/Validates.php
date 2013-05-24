<?php

/**
 * Validador para Cadastro de Pessoas
 *
 * Implementação de algoritmos para cadastro de pessoas físicas e jurídicas
 * conforme Ministério da Fazenda do Governo Federal.
 *
 * @category Hazel
 * @package  Hazel_Validator
 * @author   Wanderson Henrique Camargo Rosa
 */
class Simova_Validates extends Zend_Validate_Abstract {

    /**
     * Modificadores de Dígitos
     * @var array
     */
    protected $_modifiers = array(
        'array1' => array(10, 9, 8, 7, 6, 5, 4, 3, 2),
        'array2' => array(11, 10, 9, 8, 7, 6, 5, 4, 3, 2),
    );
    protected $_exceptions = array(
        '00000000000',
        '11111111111',
        '22222222222',
        '33333333333',
        '44444444444',
        '55555555555',
        '66666666666',
        '77777777777',
        '88888888888',
        '99999999999',
    );

    public function isValid($value) {

        $explode = explode('-', $value);
        $cpf8 = str_replace('.', '', $explode[0]);
        $strSplit = str_split($cpf8);

        //Calculo para obter digito 1
        for ($i = 0; $i < count($this->_modifiers['array1']); $i++) {
            $resMulti1 += (int) ($strSplit[$i] * (int) $this->_modifiers['array1'][$i]);
        }

        $rest1 = (int) ($resMulti1 % 11);
        $strSplit[9] = $rest1 < 2 ? 0 : (11 - $rest1);
        //Fim para digito 1
        //Calculo para obter digito 2
        for ($i = 0; $i < count($this->_modifiers['array2']); $i++) {
            $resMulti2 += (int) ($strSplit[$i] * (int) $this->_modifiers['array2'][$i]);
        }

        $rest2 = (int) ($resMulti2 % 11);
        $strSplit[10] = $rest2 < 2 ? 0 : (11 - $rest2);
        //Fim digito 2
        //Conferencia entre valor digitado e valor obtido por calculo
        $cpfComplete = str_replace(array('.', '-'), '', $value);
        $cpfDigits = implode('', $strSplit);
        $valid = $cpfDigits === $cpfComplete ? TRUE : FALSE;

        if ($valid) {
            if (in_array($cpfComplete, $this->_exceptions)) {
                return false;
            } else {
                return true;
            }
        } else {
            return false;
        }
    }

}