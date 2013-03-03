<?php

/**
 * Description of AuthController: 
 * 
 * Classe responsavel pela SESSAO da pagina para usuario administrador
 *
 * @author bruno
 */
class Admin_AuthController extends Zend_Controller_Action {

    /**
     * Metodo construtor da classe
     */
    public function indexAction() {
        $this->redirect('/admin/index');
    }

    /**
     * Metodo responsavel por gerenciar a autenticação do usuario no sistema
     * na area administrativa
     * 
     * FLUXO: Plugin_Acl -> Auth_Controller -> Formulario
     */
    public function loginAction() {

        //Verificando se o formulario e um post, e se o usuario ja nao esta autenticado
        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            //Verificando se o usuario preencheu os campos necessarios
            if (!empty($post['email']) or !empty($post['password'])) {

                //Invoca classe Zend_Auth responsavel pela autenticação no site
                $authAdapter = new Zend_Auth_Adapter_DbTable();
                $authAdapter
                        ->setTableName('TB_LOGIN') //Indicando ao zend qual a tabela para autenticacao
                        ->setCredentialColumn('SENHA_LOGIN') //Indicando o campo para senha
                        ->setIdentityColumn('NOME_LOGIN'); //Indicando o campo para usuario

                $authAdapter
                        ->setIdentity($post['email']) //Preenchendo o usuario
                        ->setCredential($post['password']); //Preenchendo a senha
                //Verificando o sucesso do login
                if ($authAdapter->authenticate()->isValid()) {

                    //Preenchendo os dados da sessao do usuario autenticado
                    Zend_Auth::getInstance()->getStorage()
                            ->write($authAdapter->getResultRowObject(null, 'SENHA_LOGIN'));

                    //Se login certo, redireciona para principal
                    $this->redirect('/admin/index');
                } else {

                    /* Tentativas erro contador */

                    //Criando uma sessao para contagem
                    $session = new Zend_Session_Namespace('try');
                    //Incrementando cada tentativa
                    if (($session->try += 1) >= 5) {
                        $locked = ' bloqueado por mais de ' . $session->try . ' tentativas sem sucesso';
                    }

                    //Se login errado, apresenta mensagem de erro
                    $this->view->mensagem = '<b>Usuário</b> e/ou <b>Senha</b> inválidos! ' . $locked;
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
        $this->redirect('/admin/auth/login');
    }

}
