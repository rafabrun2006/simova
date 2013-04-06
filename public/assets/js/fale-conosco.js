/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
   
    $.get('/admin/fale-conosco/consulta-fale-conosco', function(data){
        $('.contact-list').html(data);
    });
    
});

