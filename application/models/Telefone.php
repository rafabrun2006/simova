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
    
    public function findByPerson($codPessoa){
        $query = $this->select()
                ->from(array('p' => 'tb_pessoa'), array('cod_pessoa'))
                ->join(array('t' => 'tb_telefone'), 'p.cod_pessoa = t.cod_pessoa', array('*'))
                ->where('t.cod_pessoa = ?', $codPessoa)
                ->setIntegrityCheck(false)
                ;
        
        return $this->fetchAll($query);
    }

}