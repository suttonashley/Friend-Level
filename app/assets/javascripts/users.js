# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready


$('.add-friend').click(function(){
  var $this = $(this);
  $this.toggleClass('SeeMore');
  if($this.hasClass('.add-friend')){
    $this.text('Add Friend');
  } else {
    $this.text('Friend Requested');
  }
});
