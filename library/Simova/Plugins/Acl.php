<?php

class Simova_Plugins_Acl extends Zend_Controller_Plugin_Abstract {

    /**
     * Metodo automatico do zend que executa no inicio da aplicação
     * @param Zend_Controller_Request_Abstract $request
     */
    public function dispatchLoopStartup(Zend_Controller_Request_Abstract $request) {

        /*
         *  Atentar para alguns detalhes como os de configuração de PHP.INI
         *  referente ao SESSION.COOKIE_DOMAIN, configurado no arquivo INDEX.PHP
         */

        /*
         * Chamada do metodo de autenticacao caso o modulo seja admin e o usuario
         * caso o usuario nao esteja autenticado na pagina
         * 
         * FLUXO: Plugin_Acl -> Auth_Controller -> Formulario
         */
        $auth = Zend_Auth::getInstance();

        //Verifica se o modulo e o admin
        if ($request->getModuleName() == 'admin') {

            if (!$auth->hasIdentity()) {
                $request->setModuleName('admin');
                $request->setControllerName('/auth');
                $request->setActionName('/login');
            }
            
            if ($auth->getIdentity()->cod_perfil >= 3) {
                $request->setModuleName('admin');
                $request->setControllerName('/auth');
                $request->setActionName('/login');
                
                Zend_Registry::set('notAccess', 'Você não tem previlégios para acessar esta área!');
            }
        }
    }

}