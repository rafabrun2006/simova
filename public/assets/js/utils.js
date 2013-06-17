/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 * 
 */

$(document).ready(function() {

    //Mascara da data e utilização da biblioteca datePicker para criação do calendario
    $('.date-utils').datepicker({
        format: 'dd/mm/yyyy'
    });

    //ação imprimir
    $('#print').click(function() {
        var table = document.getElementById('data-print');
        $('body').html(table);
        print();
    });

    //seleção de cidades por uf
    $('#cod_uf').change(function() {
        var uf_id = $(this).val();

        $.post('/admin/endereco/ajax-popula-cidade/cod_uf/', {cod_uf:uf_id}, function(data) {
            $('#cod_cid').html(data);
        });
    });

    //JQuery para validação do CPF
    $('#cpf').focusout(function() {
        if ($('#cpf').val() !== '___.___.___-__') {
            var verifica = verificaCpf($('#cpf').val(), $('#cod_pessoa').val());

            if (verifica && $('#cpf').val()) {
                $('#cpf-error').css('color', 'red');
                $('#cpf-error').html('Número de CPF invalido ou já cadastrado');
                $(this).val('');
                $(this).focus();
            } else {
                $('#cpf-error').css('color', 'green');
                $('#cpf-error').html('Número de CPF aceito');
            }
        }
    });

});

/*
 * Funcionamento
 * 1 - Usuario digitou CPF e acionou evento (focusout) ->
 * 2 - Jquery ->
 * 3 - PessoaController::buscaPorCpfAction -> 
 * 4 - PessoaController::buscaPorCpf -> 
 * 5 - App_Model_Pessoa::findByCpf();
 * 6 - Retorno do PHP para jquery com resultado de Falso ou Verdadeiro
 */
function verificaCpf(cpf, cod_pessoa) {
    retorno = false;
    //Ajax e um metodo do jquery que executa uma URL
    $.ajax({
        url: '/admin/pessoa/busca-por-cpf/cpf/' + cpf + '/cod_pessoa/' + cod_pessoa,
        type: 'post',
        async: false,
        dataType: 'json',
        success: function(data) {
            if (data.retorno) {
                retorno = true;
            } else {
                retorno = false;
            }
        }
    });

    return retorno;
}