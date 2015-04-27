$(document).ready(function(){
  trimClickHandler();
  massageAndTrimClickHandler();
  shaveClickHandler();
});


var ajaxifyRequest = function(userId, route){
  $.ajax({
    url: '/users/'+userId+route,
    type: 'PUT'
  }).done(function(response){
    alert(response.first_name+" "+response.last_name+" is clean!")
  })
}

var trimClickHandler = function(){
  $('.trim').on('click', function(event){
    event.preventDefault();
    var userId = this.id
    var route = $(this).data().url
    ajaxifyRequest(userId, route);
  })
}

var massageAndTrimClickHandler = function(){
  $('.massage-trim').on('click', function(event){
    event.preventDefault();
    var userId = this.id
    var route = $(this).data().url
    ajaxifyRequest(userId, route);
  })
};

var shaveClickHandler = function(){
  $('.shave').on('click', function(event){
    event.preventDefault();
    var userId = this.id
    var route = $(this).data().url
    ajaxifyRequest(userId, route);
  })
}