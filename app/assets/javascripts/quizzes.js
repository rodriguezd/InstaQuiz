// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(function() {
  $("#datepicker").datepicker();

  $("#timepicker").timepicker();

  $("#clone_check_box").change(function(){
    if(this.checked) {
      $(".clone_select").show();
      $(".num_choices").hide();
    }
    else {
      $(".clone_select").hide();
      $(".num_choices").show();
    }
  });


    $('.multiselect').multiselect({
      buttonClass: 'btn btn-primary',
      buttonWidth: 'auto',
      buttonContainer: '<div class="btn-group" />',
      maxHeight: false,
      buttonText: function(options) {
        if (options.length == 0) {
          return 'Select Group(s) <b class="caret"></b>';
        }
        else if (options.length > 8) {
          return options.length + ' selected  <b class="caret"></b>';
        }
        else {
          var selected = '';
          options.each(function() {
            selected += $(this).text() + ', ';
          });
          return selected.substr(0, selected.length -2) + ' <b class="caret"></b>';
        }
      }
    });



});