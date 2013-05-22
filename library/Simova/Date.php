<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Simova_Date
 *
 * @author Bruno
 */
class Simova_Date {
    
    /**
     * Formata data para formato exigido pelo banco de dados
     * @param type $date
     * @return type
     */
    public static function dateToBanco($date){
        return date(Simova_Constantes::DATE_FORMAT_BANCO, strtotime($date));
    }
    
    /**
     * Formata data para formato de visualização
     * @param type $date
     * @return type
     */
    public static function dateToView($date){
        return date(Simova_Constantes::DATE_FORMAT_VIEW, strtotime($date));
    }
}