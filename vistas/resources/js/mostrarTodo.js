$(function(){
    $('#ckbTodo').click(function () {
        $('.Todo').prop('disabled', $('#ckbTodo:checked').length==0 );
    });
});