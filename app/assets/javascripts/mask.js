jQuery(function() {
  $('input.mascara_telefone').mask("(99) 9999-9999?9");
  $('input.mascara_cpf').mask("999.999.999-99");
  $('input.mascara_cnpj').mask("99.999.999/9999-99");
  $("input.mascara_data").mask("99/99/9999");

  $(document).on('nested:fieldAdded', function(event){
    var field = event.field;
    var $maskField = field.find('input.mascara_telefone');

    $maskField.mask("(99) 9999-9999?9");
  });
});