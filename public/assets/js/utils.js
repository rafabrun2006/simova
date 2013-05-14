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
    $('#cod_uf').change(function(){
        var uf_id = $(this).val();
        
        $.get('/admin/endereco/ajax-popula-cidade/uf_id/'+uf_id, function(data){
            $('#cod_cid').html(data);
        });
    });
});