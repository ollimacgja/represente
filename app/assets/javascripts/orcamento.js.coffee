# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#orcamento_fornecedor_dados').autocomplete
    source: "/fornecedores/search",
    select: ( event, ui ) ->
      $("#fornecedor_id").val(ui.item.id)

  $('#orcamento_cliente_dados').autocomplete
    source: "/cliente/search",
    select: ( event, ui ) ->
      $("#cliente_id").val(ui.item.id)