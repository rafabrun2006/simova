<?php
/**
 * Description of FaleConoscoController
 *
 * @author bruno
 */
class Admin_FaleConoscoController extends Zend_Controller_Action {
    
    public function consultaFaleConoscoAction(){
        $this->_helper->layout->disableLayout();
        $modelFaleConosco = new App_Model_FaleConosco();
        
        $this->view->faleConosco = $modelFaleConosco->fetchAll();
    }
    
}