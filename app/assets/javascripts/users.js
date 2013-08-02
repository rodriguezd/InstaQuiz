
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(function(){

  $("#active").mouseover(function() {
    $("#active").attr('title', 'Quizzes currently being administered.');
  });

  $("#finalized").mouseover(function() {
    $("#finalized").attr('title', 'Quizzes that have been finalized and ready to be activated.');
  });

  $("#pending").mouseover(function() {
    $("#pending").attr('title', 'Quizzes made available for student question submissions.');
  });

  $("#completed").mouseover(function() {
    $("#completed").attr('title', 'Quizzes that have been administered.');
  });
});
