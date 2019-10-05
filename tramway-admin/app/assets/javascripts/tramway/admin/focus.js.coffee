$ ->
  url = new URL(window.location.href)
  focusElementSelector = url.searchParams.get('focus')
  unless $(focusElementSelector).offset() == undefined
    $(window).scrollTop $(focusElementSelector).offset().top
