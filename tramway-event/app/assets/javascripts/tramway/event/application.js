//= require tramway/core/application
//= require_tree .
//= require clipboard

window.current_locale = window.i18n_locale('ru');

$(document).ready(function(){  
  
  var clipboard = new Clipboard('.clipboard-btn');
  console.log(clipboard);
	
});
