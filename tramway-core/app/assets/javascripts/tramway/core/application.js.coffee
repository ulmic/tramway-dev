#= require jquery
#= require jquery_ujs
#= require_tree .

$ ->
  $('.date_picker').datepicker({
    format: 'dd.mm.yyyy',
    language: 'ru'
  })
