/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    var colors = ["red", "blue", "green", "yellow", "brown", "black"];
                
    $('#nome_func').typeahead({
        source: colors
    });
});
