getUrl = function(path){
  return window.location.host + path;
};

$(document).ready(function(){
  $('select#type').bind('change', function(){
    var value = $(this).val();
    var ws = new WebSocket('ws://' + getUrl('/fractals'));

    ws.onopen = function(){
      console.log('connection opened');
      ws.send(value);
    };

    ws.onmessage = function(msg){
      var data = JSON.parse(msg.data);
      console.log('received data: ' + data.file_path);

      var path = 'url(assets/images/fractals/' + data.file_path + ')';
      $('div.panel').css('background-image', path);
    };

    ws.onclose = function(){
      console.log('connection closed');
    };
  });
});

