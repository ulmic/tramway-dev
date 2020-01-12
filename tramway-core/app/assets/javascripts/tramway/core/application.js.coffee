#= require jquery
#= require jquery_ujs
#= require bootstrap-datepicker-1.8.0
#= require bootstrap-datepicker-1.8.0.ru.min
#= require font_awesome5
#= require_tree .

window.i18n_locale = (locale) ->
  switch locale
    when 'en' then { date_format: 'yyyy-mm-dd', locale: locale }
    when 'ru' then { date_format: 'dd.mm.yyyy', locale: locale }

$(document).ready ->
  unless window.current_locale
    console.log 'You should set `window.current_locale` before all Javascript code'
  unless $('.date_picker').length == 0
    $('.date_picker').datepicker({
      format: window.current_locale.date_format,
      language: window.current_locale.locale
    })

  $('.link').click ->
    href = $(this).data('href')
    if href
      location.href = href
    else
      anchor = $(this).data('anchor')
      unless $(anchor).offset() == undefined
        $(window).scrollTop $(anchor).offset().top
