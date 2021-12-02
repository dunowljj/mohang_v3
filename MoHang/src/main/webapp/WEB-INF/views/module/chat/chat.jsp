<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Socket.io Test</title>

  <script src="http://localhost:1571/socket/socket.io.js"></script>
  <script src="../resources/js/jquery.js"></script>
  <style>
    * {
      box-sizing: border-box;
    }

    #chatContent {
      border: 1px solid #000;
      width: 100%;
      height: 200px;
      margin-bottom: 10px;
      overflow-y: auto;
    }

    #myChat {
      width: 100%;
    }
  </style>
</head>

<body>
  <div id="chatContent">

  </div>
  <input id="myChat" type="text">

  <script>
    var socket = io.connect('http://localhost:1571');

    socket.on('msg', function (data) {
      $("#chatContent").append('${data}<br>');
    });

    $("#myChat").on("keyup", function () {
      if (window.event.keyCode == 13) {
        $("#chatContent").append('Client : ' + $(this).val() + ' 보냅니다.<br>');
        socket.emit('msg', $(this).val());
        $(this).val("");
      }
    });
  </script>
</body>

</html>