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
//= require_tree .

$(document).ready(function() {

  console.log("js loaded");
  clickForm();

})

var clickForm = function() {


  $('#FUCK').on("submit", function(event){
    event.preventDefault();

    var result = $(this).serialize();


    var request = $.ajax({
      method: "POST",
      url: '/questions',
      data: result,
    })

    request.done(function(){
      debugger

    })

  })

  // $(".questionBoard").on("click", ".upvoteButton", function(event){
  //   event.preventDefault();

  //   console.log("GET OUT");

  // });
}
