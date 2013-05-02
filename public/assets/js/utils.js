/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 * 
 */

$(document).ready(function() {

    $('.date-utils').datepicker({
        //format: 'dd-mm-yyyy'
    });


    $('#print').click(function() {
        var table = document.getElementById('data-print');
        $('body').html(table);
        print();
    });
});