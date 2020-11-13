//= require active_admin/base
//= require activeadmin/quill_editor/quill
//= require activeadmin/quill_editor_input

$(document).ready(function() {
  $("#park_state_id").change(function() {
     getCitiesByState("id="+$("#park_state_id").val());
   });
 });

function getCitiesByState(id) {
  $.getJSON('/cities_by_state',id, function(j) {
    var options = '<option value="">SELECIONE A CIDADE</option>';
    $.each(j.cty, function(i, item) {
      options += '<option value="' + item.id + '">' + item.n + '</option>';
    });
    $("#park_city_id").html(options);
   });
 }
