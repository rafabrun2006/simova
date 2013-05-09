/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 * 
 */

$(document).ready(function() {

    $('#dt_nasc').datepicker();
    
    $('#cpf').mask('999.999.999-99');
    
    //$('#rg').mask('9.999.999');
    
    $('#cep').mask('999.999-99');
    
    $('#telefone_residencial').mask('(99)9999-9999');
    
    $('#telefone_celular').mask('(99)9999-9999');

});


