$(function(){

  $("#newgreet").submit(function(){
    $.post("/greetings", $("#newgreet").serialize());
    
    return false;
  });

  var pusher = new Pusher(window.pusher_key);
  var channel = pusher.subscribe(window.pusher_channel);
  channel.bind('new_greeting', function(data) {
    $("#greetings").prepend(data.greeting_html);
  });

});
