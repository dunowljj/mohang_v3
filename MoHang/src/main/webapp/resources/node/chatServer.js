/**
 * 
 */

//express 모듈 참조
const app = require("express")();

const cors = require('cors');

app.use(cors());

const server = app.listen(1571);
var io = require('socket.io')(server);

// 경로관련 모듈 사용
var path = require('path');


//script 위치 지정
app.get("/socket/socket.io.js", (req,res)=>{
	res.sendFile(
		path.resolve( __dirname + '/node_modules/socket.io/client-dist/socket.io.js'	)
		);
});

app.get('/socket/socket.io.js.map', (req, res) => {
  res.sendFile(
    path.resolve(
      __dirname + '/node_modules/socket.io/client-dist/socket.io.js.map'
    )
  );
});


io.on('connection', (socket)=>{
	socket.on('disconnection', () =>{
		console.log('disconnected');
	});
});