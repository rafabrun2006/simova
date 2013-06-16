<?php

/**
 * Description of Pessoa
 *
 * @author Administrador
 */
class App_Model_Login extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_login';
    protected $_primary = 'cod_login';

    public function saveLogin($data) {
        $this->_primary = 'cod_login';

        $data['senha_login'] = $this->encodingBase64($data['senha_login']);
        return $this->save($data);
    }

    public static function encodingBase64($value) {
        return base64_encode($value);
    }

    public static function decodingBase64($data) {
        return base64_decode($data);
    }

    public function findArrayByName($nomeLogin) {
        $query = $this->select()
                ->from(array('l' => 'tb_login'), array('*'))
                ->where('nome_login = ?', $nomeLogin)
                ->setIntegrityCheck(false);

        return $this->fetchAll($query)->toArray();
    }

}