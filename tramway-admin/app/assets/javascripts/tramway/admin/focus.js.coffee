$ ->
  url = new URL(window.location.href)
  focusElementSelector = url.searchParams.get('focus')
  $(window).scrollTop $(focusElementSelector).offset().top
