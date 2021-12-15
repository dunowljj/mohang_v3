
const app = require('express')();
const port = 1577;
const path = require('path');
const server = require('http').createServer(app);
const oracledb = require('oracledb');
const query = require('./oracle/query');
const userlist = new Map();
// 엑셀 모듈 불러오기
const xlsx = require('xlsx');

var dbConn;

var accountVO ;

const book = xlsx.utils.book_new();


const serverSocket = require('socket.io')(server, {
    path: '/socket.io',
    cors: {
        orgin: "*",
        credentials: true
    }
});

server.listen(port);

serverSocket.on('connection', (socket) => {


        // map에 유저정보와 socket id 저장
        socket.on('addUser', function(account_num){
            console.log('connected');
            console.log(account_num);
            if(account_num > 0){
                console.log("유저추가");
                userlist.set(account_num, socket.id);
            }else{
                console.log('접속자 없음');
            }

            console.log(userlist.size);
        });


    socket.emit('userlist', ()=>{
        console.log('userlist Load');
    });

    // 채팅상대가 소켓에 접속중일때
    socket.on('selectUser', function(account_num){
        // 채팅 상대 소켓을 저장할 변수
        console.log("유저 선택")
        var user;

        // 접속중인지 확인할 변수
        var isCheck;
        console.log("유저 번호 : " + account_num)

        for(var [key, value] of userlist){
            // 선택한 유저가 채팅에 접속중이면 true 반환
            if(key == account_num){
                user = value;
                console.log(user);
                isCheck = true;
                break;
            }else{
                //선택한 유저가 채팅에 접속중이지 않으면 false 반환
                console.log("여긴 왜들어오니?");
                isCheck = false;
            }
        }

        userlist.forEach(((value, key, map) => {
            console.log("key : " + key + " , " + "value: " + value);
        }));



        if(isCheck == true){
            console.log("해당유저는 접속중 입니다.")
            socket.on('msg', function (data) {
                serverSocket.to(user).emit('msg',data);
            });
        }else if(isCheck == false){
            console.log("해당유저는 접속중이 아닙니다.")
        }
    });



    socket.on('disconnect', () => {
        console.log(socket.id, "disconnect");
        //서버를 종료하면 Map에서 제거..
        userlist.forEach(((value, key, map) => {
            if(value == socket.id){
                userlist.delete(key);
                console.log("유저 : " + key + "접속종료");
                return;
            }
        }));
    })
});

