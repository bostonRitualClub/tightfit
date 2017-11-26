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

//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require advertisements
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

function getRandomArbitrary(min, max) {
  var round = Math.round;
  return round(Math.random() * (max - min) + min);
}

$(document).ready(function() {
  $('select').material_select();
  $(window).bindWithDelay('scroll', function(){
    if ($('#infinite-scrolling').size() > 0) {
      var more_cam_models_url = $('.pagination .next_page').attr('href');
      if (more_cam_models_url && $(window).scrollTop() > $(document).height() - $(window).height() - 500) {
        $('#infinite-scrolling .pagination').html(
          '<div class="infinite-loader"><img class="loader-icon" src="/assets/loader.gif" alt="loading" title="loading" /><h6>  ...probing for more models</h6></div>'
        );
        setTimeout(function(){
          $.getScript(more_cam_models_url);
        }, getRandomArbitrary(1200, 2500));
      }
    }
  }, 100);
});
