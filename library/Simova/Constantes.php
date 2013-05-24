<?php

/**
 * Description of Mensagens
 * 
 * Classe contem as mensagens que serão utilizadas em todos o
 * sistema, fazendo assim reutilização de codigo e padronização das mensagens
 * exibidas pelo sistema.
 *
 * @author bruno
 */
class Simova_Constantes {
    
    /*
     * Constantes para tipos de dose de vacina
     */
    const PRIMEIRA_DOSE     = 1;
    const SEGUNDA_DOSE      = 2;
    const TERCEIRA_DOSE     = 3;
    const REFORCO           = 4;
    const CAMPANHA          = 5;
    
    const ADMINISTRADOR     = 1;
    const FUNCIONARIO       = 2;
    const PACIENTE          = 3;
    
    const DATE_FORMAT_VIEW = 'd/m/Y';
    const DATE_FORMAT_BANCO = 'Y-m-d';
}