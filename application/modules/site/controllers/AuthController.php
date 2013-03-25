<?php

/**
 * Description of AuthController: 
 * 
 * Classe responsavel pela SESSAO da pagina para usuario administrador
 *
 * @author bruno
 */
class Site_AuthController extends Zend_Controller_Action {

    /**
     * Metodo construtor da classe
     */
    public function indexAction() {
        $this->redirect('/index');
    }

    /**
     * Metodo responsavel por gerenciar a autenticação do usuario no sistema
     * na area administrativa
     * 
     * FLUXO: Plugin_Acl -> Auth_Controller -> Formulario
     */
    public function loginAction() {
        $this->_helper->layout->disableLayout();
        //Verificando se o formulario e um post, e se o usuario ja nao esta autenticado
        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            //Verificando se o usuario preencheu os campos necessarios
            if (!empty($post['email']) or !empty($post['password'])) {

                //Invoca classe Zend_Auth responsavel pela autenticação no site
                $authAdapter = new Zend_Auth_Adapter_DbTable();
                $authAdapter
                        ->setTableName('tb_login') //Indicando ao zend qual a tabela para autenticacao
                        ->setCredentialColumn('senha_login') //Indicando o campo para senha
                        ->setIdentityColumn('nome_login') //Indicando o campo para usuario
                        ->setAmbiguityIdentity(TRUE); //Caso haja ambiguidade de usuario na tabela

                $authAdapter
                        ->setIdentity($post['email']) //Preenchendo o usuario
                        ->setCredential(md5($post['password'])); //Preenchendo a senha
                //Verificando o sucesso do login
                if ($authAdapter->authenticate()->isValid()) {

                    //Preenchendo os dados da sessao do usuario autenticado
                    Zend_Auth::getInstance()->getStorage()
                            ->write($authAdapter->getResultRowObject(null, 'senha_login'));

                    //Se login certo, redireciona para principal
                    $this->_redirect('/admin/index');
                } else {
                    //Se login errado, apresenta mensagem de erro
                    $this->view->mensagem = '<b>Usuário</b> e/ou <b>Senha</b> inválidos! ';
                }
            } else {

                //Caso nao preenchido os campos necessarios, retorna mensagem
                $this->view->mensagem = '<b>Usuário</b> e <b>Senha</b> e de preenchimento obrigatório';
            }
        }
    }

    /**
     * Metodo responsavel pelo fechamento da sessao do usuario autenticado
     */
    public function logoutAction() {
        $auth = Zend_Auth::getInstance();
        $auth->clearIdentity();
        $this->_redirect('/admin/auth/login');
    }

    /*
     * Metodo que gera imagem captcha
     */
    private function generateCaptcha() {
        //Apagando arquivos existentes
        $result = scandir('captcha');
        foreach ($result as $filename) {
            if ($filename != '.' and $filename != '..') {
                unlink('captcha/' . $filename);
            }
        }

        $captcha = new Zend_Captcha_Image();
        $captcha->setExpiration('300')
                ->setWordLen('6')
                ->setHeight('60')
                ->setWidth('210')
                ->setFont('fonts/entsans.ttf')
                ->setImgDir('captcha/');

        $captcha->generate();
        $captcha_session = new Zend_Session_Namespace('Zend_Form_Captcha_' . $captcha->getId());
        $captcha_iterator = $captcha_session->getIterator();
        $captcha_word = $captcha_iterator['word'];

        $session = new Zend_Session_Namespace('captcha');
        $session->captcha_confirm = $captcha_word;

        //response
        return $captcha->getId();
    }

    /*
     * Metodo responsavel por recuperar senha
     */
    public function recuperarAction() {

        if ($this->_request->isPost()) {

            $data = $this->_request->getPost();
            $session = new Zend_Session_Namespace('captcha');

            if ($session->captcha_confirm == $data['captcha_confirm']) {
                $model = new App_Model_Login();
                $result = $model->findArrayByName($data['nome_login']);

                if ($result) {

                    //Criando uma senha aleatoria para o usuario
                    for ($i = 0; $i < 6; $i++) {
                        $newPass .= rand(1, 9);
                    }

                    //Nova senha criada
                    $result[0]['senha_login'] = $newPass;

                    //Salvando nova senha
                    $model->saveLogin($result[0]);

                    $this->view->mensagem = 'Sua nova senha é: ' . $newPass;
                } else {
                    $this->view->mensagem = 'Este usuário esta incorreto!';
                }
            } else {
                $this->_redirect('/admin/auth/recover');
            }
        } else {
            $this->view->captcha = $this->generateCaptcha();
        }
    }

}