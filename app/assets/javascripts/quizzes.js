// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(function() {
  $("#datepicker").datepicker();

  $("#timepicker").timepicker();

  $("#clone_check_box").change(function(){
    if(this.checked) {
      $("#clone_select").show();
      $(".num_choices").hide();
    }
    else {
      $("#clone_select").hide();
      $(".num_choices").show();
    }
  });




});