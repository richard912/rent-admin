// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ready = function() {
	$("#table_users tr[data-link]").click(function() {
		
    window.location.href = $(this).attr('data-link');
  })
};

$(document).ready(ready);

$(document).on('page:load', ready);