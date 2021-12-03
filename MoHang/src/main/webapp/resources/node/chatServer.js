const app = require('express')();
const port = 1577;
const path = require('path');
const server = require('http').createServer(app);

const serverSocket = require('socket.io')(server, {
        path : '/socket.io',
        cors : {
                orgin : "*",
                credentials : true
        }
});

server.listen(port);

serverSocket.on('connection', (socket)=>{
        console.log(socket.id, 'Connected11');


        socket.emit('msg', '연결 되었습니다.');

        socket.on('msg', function(data) {
                console.log(socket.id, data);

                socket.broadcast.emit('msg', data);
                socket.emit('msg', 'Server : "${data}" 받았습니다.');
        });

});



