<?php

class Admin_CartaoController extends Zend_Controller_Action {

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

    public function registrarAprazarVacinaAction() {
        $modelPaciente = new App_Model_Paciente();
        $form = new Admin_Form_CartaoVacina();
        $data = $this->_request->getPost();

        //Populando dados de paciente apartir do banco de dados
        $paciente = $modelPaciente->getArrayById($this->_getParam('cod_pessoa'));
        $form->getElement('cod_pessoa')->setValue($paciente[0]['cod_pessoa']);
        
        /*
         * Preenchendo automaticamente os dados de registrar vacina quando 
         * estiver em situaçao de aprazada sendo que os dados serao utilizados
         * para aplicação da vacina
         */
        if ($this->_getParam('cod_cartao_vacina')) {
            $modelCartaoVacina = new App_Model_CartaoVacina();

            $dataArray = $modelCartaoVacina->find($this->_getParam('cod_cartao_vacina'))
                    ->toArray();

            $form->getElement('cod_vacina')->setAttrib('readonly', TRUE);
            $form->getElement('cod_tipo_cartao')->setAttrib('readonly', TRUE);
            $form->getElement('dose')->setAttrib('readonly', TRUE);

            $form->populate($dataArray[0]);
            $form->getElement('dt_vacina')->setValue(Simova_Date::dateToView($dataArray[0]['dt_vacina']));
        }

        if ($this->_request->isPost()) {

            //Testando validade dos dados com zend form
            if ($form->isValid($data)) {

                //Chamando model de cartao vacina e dose vacina
                $model = new App_Model_CartaoVacina();

                //Salvando vacina aplicada e vacina aprazada
                $data['cod_cartao_vacina'] = $model->save($data);

                if ($data['cod_cartao_vacina']) {

                    //Salvando dose da vacina aplicada
                    if ($data['cod_situacao_vacina'] == 1) {

                        $modelVacinaApli = new App_Model_VacinaAplicada();
                        $modelVacinaApli->save($data);

                        //Caso sucesso mostrar mensagem de sucesso
                        $this->_helper->flashMessenger(array('success' => Simova_Mensagens::VACINA_REGISTRADA));
                    } else {
                        $this->_helper->flashMessenger(array('success' => Simova_Mensagens::VACINA_APRAZADA));
                    }

                    $this->_redirect('/admin/cartao/registrar-aprazar-vacina/cod_pessoa/' . $this->_getParam('cod_pessoa'));
                } else {

                    //Caso erro mostra mensagem de erro
                    $this->_helper->flashMessenger(array('danger' => Simova_Mensagens::CADASTRO_ERROR));
                }
            } else {
                //Caso form invalido popula formulario e mostra mensagem
                $this->_helper->flashMessenger(array('warning' => Simova_Mensagens::FORM_INVALIDO));
                $form->populate($data);
            }
        }

        $form->addSubForm(new Admin_Form_VacinaAplicada(), 'VacinaAplicada');
        $this->view->paciente = $paciente[0];
        $this->view->form = $form;
        $this->view->params = $this->_getAllParams();
        $this->view->modal = $this->view->render('utils/modal.phtml');
    }

    public function visualisaCartaoAction() {
        $model = new App_Model_CartaoVacina();
        $modelPaciente = new App_Model_Paciente();

        $paciente = $modelPaciente->getArrayById($this->_getParam('cod_pessoa'));

        $this->view->paciente = (object) $paciente[0];
        $this->view->cartaoCrianca = $model->vacAplicBetweenIdade();
    }

    public function visualisaVacinaAction() {
        $model = new App_Model_CartaoVacina();
        $modelPaciente = new App_Model_Paciente();

        $paciente = $modelPaciente->getArrayById($this->_getParam('cod_pessoa'));

        $aplicadas = array(
            'cv.cod_pessoa' => $this->_getParam('cod_pessoa'),
            'cv.cod_situacao_vacina' => 1
        );

        $aprazadas = array(
            'cv.cod_pessoa' => $this->_getParam('cod_pessoa'),
            'cv.cod_situacao_vacina' => 2
        );

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            //Resultados por filtros de consulta
            $like = array($post['tipoConsulta'] => $post['search']);
        }

        //$this->view->_cabecalho = $this->view->render('/cartao/_cabecalho.phtml');
        $this->view->paciente = (object) $paciente[0];
        $this->view->vacinasAplicadas = $model->vacAplicBetweenIdade($aplicadas, $like);
        $this->view->vacinasAprazadas = $model->vacAplicBetweenIdade($aprazadas, $like);
    }

    public function verCartaoAction() {
        $modelPaciente = new App_Model_Paciente();
        $model = new App_Model_CartaoVacina();

        $paciente = $modelPaciente->getArrayById($this->_getParam('cod_pessoa'));

        $where = array(
            'cv.cod_pessoa' => $this->_getParam('cod_pessoa'),
            'cv.cod_situacao_vacina' => 1,
            'cod_tipo_cartao' => $this->_getParam('tipo')
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

