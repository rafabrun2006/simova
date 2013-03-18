<?php

/**
 * Description of Pessoa
 *
 * @author bruno
 */
class Model_Pessoa extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_pessoa';
    protected $_primary = 'cod_pessoa';

    public function save($data) {
        
        //Convertendo data para padrao exigido pelo banco EUA
        $data['dt_nasc'] = date('Y-m-d', strtotime($data['dt_nasc']));
        
        return parent::save($data);
    }
}