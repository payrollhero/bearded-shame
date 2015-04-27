// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
  $('.r-tooltip').tooltip({placement: 'bottom'});

  $('#filter-beard-status').bind('change', function(){
    var value = $(this).val();

    $('.beard-status-wrapper').hide();

    if (value != 'all')
      $('.beard-status-options.active-' + value).closest('.beard-status-wrapper').show();
    else
      $('.beard-status-wrapper').show();

  });

  $('.show-form-link').click(function() {
    $('#new-user-form').toggle();

    if ($(this).hasClass('new-user-link'))
      $('.new-user-link').hide();
    else
      $('.new-user-link').show();
  });

  $('#new-user-form').submit(function() {
    var success  = true;
    var lastName  = $('#user_last_name').val().trim();
    var firstName = $('#user_first_name').val().trim();

    if (lastName.length == 0 || firstName.length == 0) {
      alert('Fill in all missing fields');
      success = false;
    }

    return success;
  });
});
