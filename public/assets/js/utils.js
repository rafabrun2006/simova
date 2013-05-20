/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 * 
 */

$(document).ready(function() {

    $('.date-utils').datepicker({
        format: 'dd-mm-yyyy'
    });


    $('#print').click(function() {
        var table = document.getElementById('data-print');
        $('body').html(table);
        print();
    });

    //Load city by UF
    $('#cod_uf').change(function() {
        var uf_id = $(this).val();

        $.get('/admin/endereco/ajax-popula-cidade/uf_id/' + uf_id, function(data) {
            $('#cod_cid').html(data);
        });
    });

    $('#cpf').change(function() {
        if (verificaCpf($('#cpf').val()) && !$('#cod_pessoa').val()) {
            $('#cpf-error').css('color', 'red');
            $('#cpf-error').html('Número de CPF já está cadastrado');
            $(this).val('');
            $(this).focus();
        }else{
            $('#cpf-error').css('color', 'green');
            $('#cpf-error').html('Numero de CPF aceito');
        }
    });

});

function verificaCpf(cpf) {
    retorno = false;

    $.ajax({
        url: '/admin/pessoa/busca-por-cpf/cpf/' + cpf,
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