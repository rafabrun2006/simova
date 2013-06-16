<?php

/**
 * Description of Mensagens
 * 
 * Classe contem as mensagens que serão utilizadas em todos o
 * sistema, fazendo assim reutilização de codigo e padronização das mensagens
 * exibidas pelo sistema.
 *
 * @author Administrador
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
    
    /*
     * Mensagem de aviso (warning) e validação
     */
    const FORM_INVALIDO = 'Verifique o seu formulário';
    const NENHUM_RESULTADO = 'Nenhum resultado encontrado';
    
    /*
     * Mensagem para aviso de vacina aprazada
     */
    const VACINA_REGISTRADA = 'Vacina registrada com sucesso';
    const VACINA_APRAZADA = 'Vacina aprazada com sucesso';
    
    /*
     * Mensagem aviso restaurar
     */
    const RESTAURAR_SUCESSO = 'Registro restaurado com sucesso';
    
    const CPF_CADASTRADO = 'Este CPF já está cadastrado';
    
}