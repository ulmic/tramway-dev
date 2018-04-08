#= require jquery
#= require jquery_ujs
#= require tramway/sport_school/jquery.scrollTo.min
#= require_tree .

$.extend($.scrollTo.defaults, {
    axis: 'y',
    duration: 2000
})
$(document).ready ->
  $('.scroll').click (e) ->
    e.preventDefault()
    $.scrollTo "##{$(@).data('id')}"
