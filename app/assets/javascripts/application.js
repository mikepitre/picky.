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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require react
//= require react_ujs
//= require components
//= require materialize-sprockets
//= require_tree .

$(document).ready(function() {
    $('select').material_select();
});

navigator.geolocation.getCurrentPosition(function(position) {
  lat = position.coords.latitude;
  lng = position.coords.longitude;
  $('#lat-input').val(lat);
  $('#long-input').val(lng);
  $('#zip').hide();
});
