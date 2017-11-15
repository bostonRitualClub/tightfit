// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require_tree .

function submitSearch() {
  event.preventDefault();
  $.each ( $("#nav-search-input input, #index-search-input input").serializeArray(), function ( i, obj ) {
    $('<input type="hidden">').prop( obj ).appendTo( $('#hidden-form') );
  } );
  var emptyInputFields = $('form input:hidden').filter(function() { return $(this).val() == ""; });
  emptyInputFields.attr('disabled', true);
  
  $("#hidden-form").submit();
}

$(document).ready(function() {
  $('select').material_select();

  // This shit don't work!
  // var scroll_top_duration = 700;
  // var $back_to_top = $('.cd-top');
  // 
  // Smooth scroll to top
  // $back_to_top.on('click', function(event){
	// 	event.preventDefault();
	// 	$('body,html').animate({
	// 		scrollTop: 0 ,
	// 	 	}, scroll_top_duration
	// 	);
	// });
});
