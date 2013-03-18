// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {
  $('form#new_comment').on('ajax:success', function(xhr, data, status) {
    if (data.success) {
      var commenter, comment, li;
      commenter = $('<div />', {
        'class': 'commenter',
        text: data.comment.commenter_name + ' said'
      });

      comment = $('<div />', {
        'class': 'body',
        text: data.comment.body
      });

      li = $('<li />', {
        'class': 'comment',
        id: 'comment-'+data.comment.id
      }).append(commenter).append(comment);

      $('ul#comments').append(li);
      $('form#new_comment').find('textarea').val('');
    } else {
      $('body').append(data.message);
    }
  });
})

