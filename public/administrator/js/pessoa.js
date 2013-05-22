/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 * 
 */

$(document).ready(function() {

    $('#dt_nasc').datepicker();

    $('#cpf').mask('999.999.999-99');

    //$('#rg').mask('9.999.999');

    $('#cep').mask('99.999-999');

    $('#telefone_residencial').mask('(99)9999-9999');

    $('#telefone_celular').mask('(99)9999-9999');

    $('#tipoConsulta').change(function() {

        if ($(this).val() == 'cod_sit') {
            $('#div-search-select').attr('class', 'hidden-print');
            $('#div-search-input').attr('class', 'hidden');
            $('#appendedInputButton').attr('name', 'disable');
        } else {
            $('#div-search-select').attr('class', 'hidden');
            $('#div-search-input').attr('class', 'hidden-print');
            $('#appendedInputButton').attr('name', 'search');
        }
    });

});


