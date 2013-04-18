/* 
 * Espera confirmação do usuario em caso de uso da decisão manual
 */

$(document).ready(function() {
    
    var confirmYes;
    
    $('.confirm').click(function() {

        confirmYes = this.href;

        $('.modal-body').html('Deseja excluir este registro?');
        $('.modal').modal('show');

        return false;
    });

    $('.modal #yes').click(function() {
        $('.modal').modal('hide');

        document.location.href = confirmYes;
    });

});