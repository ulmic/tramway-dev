#= require jquery
#= require jquery_ujs
#= require bootstrap-datepicker-1.8.0
#= require bootstrap-datepicker-1.8.0.ru.min
#= require simple_form_extension
#= require_tree .

$(document).ready ->
  unless $('.date_picker').length == 0
    $('.date_picker').datepicker({
      format: 'dd.mm.yyyy',
      language: 'ru'
    })

  $('.link').click ->
    location.href = $(this).data('href')

  $('.selectize .selectize-control .selectize-input input[type="text"]').addClass('form-control')
  $('.selectize .selectize-control .selectize-input input[type="text"]').width '100%'
