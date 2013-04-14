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
class Simova_Mensagens {
    
    /*
     * Mensagens de sucesso
     */
    const CADASTRO_SUCESSO = 'Cadastro efetuado com sucesso';
    const ALTERAR_SUCESSO = 'Alteração de registro efetuada com sucesso';
    const DELETE_SUCESSO = 'Registro apagado com sucesso';
    
    /*
     * Mensagens de erro
     */
    const DELETE_ERROR = 'Erro ao tentar apagar registro';
    const ALTERAR_ERROR = 'Erro ao tentar salvar alterações do registro';
    const CADASTRO_ERROR = 'Erro ao tentar cadastrar registro';
    
}