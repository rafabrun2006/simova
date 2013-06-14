<?php

/**
 * Description of Pessoa
 *
 * @author bruno
 */
class App_Model_Pessoa extends Simova_Mapper_ModelMapper {

    protected $_name = 'tb_pessoa';
    protected $_primary = 'cod_pessoa';
    //METODO PARA FAZER UPDATE E INSERT
    public function save($data) {
        $this->_primary = 'cod_pessoa';
        //Convertendo data para padrao exigido pelo banco EUA
        $data['dt_nasc'] = Simova_Date::dateToBanco($data['dt_nasc']);
        
        return parent::save($data);
    }
    //METODO DE CONSULTA POR LOGIN
    public function findByPersonByLogin($codLogin){
        $query = $this->select()
                ->from(array('l' => 'tb_login'), array('*'))
                ->join(array('p' => 'tb_pessoa'), 'l.cod_login = p.cod_login', array('*'))
                ->where('l.cod_login = ?', $codLogin)
                ->setIntegrityCheck(false)
                ;
        
        return $this->fetchAll($query);
    }
    //METODO DE CONSULTA POR ID
    public function findById($cod_pessoa){
        
        $query = $this->select()
                ->from(array('p' => 'tb_pessoa'), array('*'))
                ->joinLeft(array('f' => 'tb_funcionario'), 'p.cod_pessoa = f.cod_pessoa', array('*'))
                ->joinLeft(array('pc' => 'tb_paciente'), 'p.cod_pessoa = pc.cod_pessoa', array('*'))
                ->join(array('e' => 'tb_endereco'), 'p.cod_end = e.cod_end', array('*'))
                ->joinLeft(array('l' => 'tb_login'), 'l.cod_login = p.cod_login', array('*'))
                ->join(array('ec'=>'tb_estado_civil'), 'p.cod_estado_civil = ec.cod_estado_civil',array('nome_estado_civil') )
                ->join(array('c'=> 'tb_cidade'), 'c.cod_cid = e.cod_cid ',array('*'))
                ->join(array('uf'=>'tb_uf'), 'uf.cod_uf = c.cod_uf',array('*'))
                ->joinLeft(array('cg'=>'tb_cargo'), 'cg.cod_cargo = f.cod_cargo',array('*'))
                ->joinLeft(array('fc'=>'tb_funcao'), 'fc.cod_funcao = f.cod_funcao',array('*'))
                ->join(array('us'=>'tb_unidade_saude'), 'us.cod_un_saude = p.cod_un_saude',array('*'))
                ->join(array('cs'=>'tb_status'), 'cs.cod_status = p.cod_status',array('*'))
                ->join(array('pf'=>'tb_perfil'), 'pf.cod_perfil = p.cod_perfil',array('*'))
                ->where('p.cod_pessoa = ?', $cod_pessoa)
                ->setIntegrityCheck(false)
                ;
    

        return $this->fetchAll($query);
    }
    //CONSULTA POR CPF
    public function findByCpf($cpf, $codPessoa){
        $query = $this
                ->select()
                ->where('cpf = ?', $cpf);
        
        if($codPessoa){
            $query->where('cod_pessoa != ?', $codPessoa);
        }
        
        $result = $this->fetchAll($query);
        
        //Retorna unico registro encontrado
        return $result[0];
    }
}