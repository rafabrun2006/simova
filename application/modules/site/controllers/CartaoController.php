<?php

class Site_CartaoController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {
        // action body
    }

    public function consultaCartaoAction() {
        $model = new App_Model_Paciente();

        $paginator = $this->view->pagination(
                $model->listPaciente($this->_request->getPost()), $this->_getParam('page'), '/admin/cartao/consulta-cartao/page/');

        $this->view->listPacientes = $paginator->paginator;

        if ($paginator->count <= 0) {
            $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::NENHUM_RESULTADO));
        }

        $this->view->pagination = $paginator;
        $this->view->request = $this->_request->getPost();
        $this->view->modal = $this->view->render('utils/modal.phtml');
    }

//    public function visualisaCartaoAction() {
//        $model = new App_Model_CartaoVacina();
//        $modelPaciente = new App_Model_Paciente();
//        $modelPessoa = new App_Model_Pessoa();
//        $pessoa = $modelPessoa->findByPersonByLogin(Zend_Auth::getInstance()->getIdentity()->cod_login);
//
//        $paciente = $modelPaciente->getArrayById($pessoa[0]->cod_pessoa);
//
//        $this->view->paciente = (object) $paciente[0];
//        $this->view->cartaoCrianca = $model->vacAplicBetweenIdade();
//    }

    public function visualisaVacinaAction() {
        $usuario = Zend_Auth::getInstance();

        if ($usuario->hasIdentity()) {

            $model = new App_Model_CartaoVacina();
            $modelPaciente = new App_Model_Paciente();
            $modelPessoa = new App_Model_Pessoa();
            $pessoaByLogin = $modelPessoa->findByPersonByLogin($usuario->getIdentity()->cod_login);

            $paciente = $modelPaciente->getArrayById($pessoaByLogin[0]->cod_pessoa);

            $aplicadas = array(
                'cv.cod_pessoa' => $pessoaByLogin[0]->cod_pessoa,
                'cv.cod_situacao_vacina' => 1
            );

            $aprazadas = array(
                'cv.cod_pessoa' => $pessoaByLogin[0]->cod_pessoa,
                'cv.cod_situacao_vacina' => 2
            );

            if ($this->_request->isPost()) {
                $post = $this->_request->getPost();

                //Resultados por filtros de consulta
                $like = array($post['tipoConsulta'] => $post['search']);
            }

            $this->view->paciente = (object) $paciente[0];
            $this->view->vacinasAplicadas = $model->vacAplicBetweenIdade($aplicadas, $like);
            $this->view->vacinasAprazadas = $model->vacAplicBetweenIdade($aprazadas, $like);
        }
    }

    public function verCartaoAction() {
        $usuario = Zend_Auth::getInstance();
        $modelPaciente = new App_Model_Paciente();
        $model = new App_Model_CartaoVacina();
        $modelPessoa = new App_Model_Pessoa();
        $pessoaByLogin = $modelPessoa->findByPersonByLogin($usuario->getIdentity()->cod_login);
        
        $pessoaByLogin[0]->cod_pessoa;
        
        $paciente = $modelPaciente->getArrayById($pessoaByLogin[0]->cod_pessoa);
        
        $where = array(
            'cv.cod_pessoa' => $pessoaByLogin[0]->cod_pessoa,
            'cv.cod_situacao_vacina' => 1,
        );

        $result = $model->vacAplicBetweenIdade($where);
        
        foreach ($result as $value) {
            if ($value->cod_vacina == $vacAnt) {

                $newArray[$value->cod_vacina][] = $this->arrayData($value);

                $vacAnt = $value->cod_vacina;
            } else {
                $newArray[$value->cod_vacina][] = $this->arrayData($value);
                $vacAnt = $value->cod_vacina;
            }

            $array = $newArray;
        }

        $this->view->cartaoVacina = $array;
        $this->view->paciente = (object) $paciente[0];
    }

    private function arrayData($value) {

        return array(
            'cod_cartao_vacina' => $value->cod_cartao_vacina,
            'cod_un_saude' => $value->cod_un_saude,
            'dt_vacina' => $value->dt_vacina,
            'cod_grupo_vacina' => $value->cod_grupo_vacina,
            'dose' => $value->dose,
            'cod_vacina' => $value->cod_vacina,
            'cod_pessoa' => $value->cod_pessoa,
            'cod_situacao_vacina' => $value->cod_situacao_vacina,
            'matricula' => $value->matricula,
            'lote' => $value->lote,
            'nome_vacina' => $value->nome_vacina,
            'cod_end' => $value->cod_end,
            'nome_un_saude' => $value->nome_un_saude,
            'num_un_saude' => $value->num_un_saude
        );
    }

}

