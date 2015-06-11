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
//= require handlebars
//= require_tree .


$(document).on('page:change', function() {

  newQuestion();
  upvote();
  downvote();
  // newAnswer();
  // upvoteAnswer();
  // downvoteAnswer();

});

var newQuestion = function() {

  $('.questionForm').on("submit", function(event){
    event.preventDefault();

    var result = $(this).serialize();

    var request = $.ajax({
      method: "POST",
      url: '/questions',
      data: result,
    });

    request.done(function(response){
      $(".list-of-questions").append(response);
      $('.title-field').val("")
    });

    request.error(function(){
      alert("Question Submission Error");
    });
  });
};

var upvote = function() {

  $('.upvote-link').on("click", function(event){
    event.preventDefault();

    that = $(this)

    var $link = $(this).attr("href")

    var request = $.ajax({
      method: "POST",
      url: $link,
    })

    request.done(function(response){
      $(that).siblings('p').html("<p>Score: " + response["score"] + "</p>")
    });
  });
};

var downvote = function() {

  $('.downvote-link').on("click", function(event){
    event.preventDefault();

    that = $(this);

    var $link = $(this).attr("href")

    var request = $.ajax({
      method: "POST",
      url: $link,
    })

    request.done(function(response){
      $(that).siblings('p').html("<p>Score: " + response["score"] + "</p>")
    });
  });
};


// var newAnswer = function() {

//   $('.answerForm').on("submit", function(event){
//     event.preventDefault();

//     var result = $(this).serialize();

//     var request = $.ajax({
//       method: "POST",
//       url: '/'
//     })
//   })

// }