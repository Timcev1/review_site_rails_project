// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('ready page:load', function() {


  class Comment{
    constructor(comment, rating, email){
      this.comment = comment
      this.rating = rating
      this.email = email
    }
  }
  Comment.prototype.display = function(){
    return "Comment: "+ this.comment + "<br>" + "Rating: "+ this.rating + "<br>" + "Email: "+ this.email + "<br>" + "<br>"
  }

  $("a.showComments").on("click", function(e){
  $.ajax({
    method: "GET",
    url: this.href
  }).done(function(data){
    var x = ""
    for (i = 0; i < data.length; i++){
      x += new Comment(data[i].comments, data[i].rating, data[i].user.email).display()
      //x += "<p>"+"Comment: " + data[i].comments +"<br>"+ "rating: " +data[i].rating + "<br>"+ "Submitted by: " + data[i].user.email+ "</p>"
    }
    $("div.comment").html(x)
  })
  e.preventDefault();
});

  $("a.newcomment").on("click", function(e){
    $.ajax({
        method: "GET",
        url: this.href
      }).done(function(data){
        $("div.postComment").html(data)
      })
    e.preventDefault();
  });


  $("a.category").on("click", function(e){
  $.ajax({
    method: "GET",
    url: this.href
  }).done(function(data){
    $("div.cat_job").html(data)
  })
  e.preventDefault();
  });

  $("#new_comment.new_comment").on("submit",function(e){
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        $("#comment_comments").val("");
        $('#comment_rating').val("");
        $('div.comment').append(response);
        $('.submit_button').prop('disabled', false);
      }
    });
    e.preventDefault();
  })



})
