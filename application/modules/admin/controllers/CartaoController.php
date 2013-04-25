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
                    }

                    //Caso sucesso mostrar mensagem de sucesso
                    $this->_helper->flashMessenger(array('success' => Simova_Mensagens::CADASTRO_SUCESSO));
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
        $this->view->modal = $this->view->render('utils/modal.phtml');
    }

    public function visualisaCartaoAction() {
        $model = new App_Model_CartaoVacina();
        $modelPaciente = new App_Model_Paciente();

        $paciente = $modelPaciente->getArrayById($this->_getParam('cod_pessoa'));

        $this->view->paciente = (object) $paciente[0];
        Zend_Debug::dump($this->view->cartaoCrianca = $model->vacAplicBetweenIdade(0, 10));
    }

    public function visualisaVacinaAction() {
        
    }
    public function verCartaoAction() {
        
    }

}

