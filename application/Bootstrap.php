<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{

    public function _initPlugins(){
    
        $bootstrap = $this->getApplication();

        if ($bootstrap instanceof Zend_Application) {
            $bootstrap = $this;
        }

        $bootstrap->bootstrap('FrontController');
        $front = $bootstrap->getResource('FrontController');

        $front->registerPlugin(new Simova_Plugins_Layout());
        $front->registerPlugin(new Simova_Plugins_Acl());
        
    }

    public function _initConfigs(){
    
        new Zend_Locale('pt_BR');
        
    }
}