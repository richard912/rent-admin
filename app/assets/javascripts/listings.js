// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ready = function() {
	$('#btn_newlisting').on('click', function() {
    	$('#newListing').modal();
  });

  $("#table_listings tr[data-link]").click(function() {
  	
    window.location.href = $(this).attr('data-link');
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);