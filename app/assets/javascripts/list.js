$(document).ready(function(){
  trimClickHandler();
  // massageAndTrimUser();
  // shaveUser();
});



var trimClickHandler = function(){
  $('.trim').on('click', function(event){
    event.preventDefault();
    var userId = this.id
    var route = $(this).data().url
    $.ajax({
      url: '/users/'+userId+route,
      type: 'PUT',
    }).done(function(){
      alert("You are trimmed!")
    })
  })
}

var massageAndTrimClickHandler = function(){
  $('.massage-trim').on('click', function(event){
    event.preventDefault();
    var userId = this.id
    var route = $(this).data().url
    console.log(route)
    $.ajax({
      url: '/users/'+userId+'/massage_and_trim',
      type: 'PUT',
    }).done(function(){
      alert("You are massaged and trimmed!")
    })
  })
};

var shaveClickHandler = function(){
  $('.shave').on('click', function(event){
    event.preventDefault();
    var userId = this.id
    $.ajax({
      url: '/users/'+userId+'/shave',
      type: 'PUT',
    }).done(function(){
      alert("You are shaved!")
    })
  })
}