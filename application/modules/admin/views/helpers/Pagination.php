<?php

class Zend_View_Helper_Pagination extends Zend_View_Helper_Abstract {

    public $pagination = null;
    private $next = null;
    private $previous = null;
    private $pages = null;
    private $count = null;

    public function pagination($dataArray, $currentPage, $linkNumber) {

        $std = new stdClass();

        $paginator = Zend_Paginator::factory($dataArray);

        $paginator
                ->setCurrentPageNumber($currentPage)
                ->setItemCountPerPage(10)
                ->setPageRange(10);

        $std->paginator = $paginator;

        /*
         * Definindo variavel que contem numeros com links para paginação
         */
        $template = "<li><a href='%s'>%s</a></li>";
        $pagesInRange = $paginator->getPages();

        foreach ($pagesInRange->pagesInRange as $page) {
            $numberPage .= sprintf($template, $linkNumber . $page, $page);
        }

        $std->pages = $numberPage;
        
        /*
         * Definindo variavel que contem paginação Next e Previous
         */
        $std->next = $linkNumber . ($paginator->getCurrentPageNumber() + 1);
        $std->previous = $linkNumber . ($paginator->getCurrentPageNumber() - 1);
        $std->count = $paginator->count();

        return $std;
    }

}
