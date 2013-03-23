<?php

/**
 * Description of Pessoa
 *
 * @author bruno
 */
class App_Model_Telefone extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_telefone';
    protected $_primary = 'cod_tel';

    public function saveMultiple($data, $numberFones) {

        $return = FALSE;

        $i = 1;

        while ($i++ < $numberFones) {

            $result = parent::save(array(
                        'num_tel' => $data['num_tel'.$i],
                        'cod_pessoa' => $data['cod_pessoa']
            ));

            if ($result) {
                $return = TRUE;
            }
        }

        return $return;
    }

}