/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 * 
 */

$(document).ready(function() {

    $('.date-utils').datepicker({
        format: 'dd-mm-yyyy'
    });

    $('.pagination').smartpaginator({
        totalrecords: 100,
        recordspage: 10,
        initval: 0,
        next: 'Proximo',
        prev: 'Anterior',
        first: 'Primeiro',
        last: 'Ultimo',
        theme: 'green',
        onchange: 'onChange'
    });

    function onChange(newPageValue) {
        alert(newPageValue);
    }
});


