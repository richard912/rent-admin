var ready = function() {
  $(".js-select").select2({
    theme: "bootstrap",
    width: "70%",
  });
  $('#status').select2({
    theme: "bootstrap",
    width: "70%",
    minimumResultsForSearch: -1
  });

  $('#btn_newagent').on('click', function() {
    $('#newAgent').modal();
  });

  $("tr[data-link]").click(function() {
    window.location.href = $(this).attr('data-link');
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);