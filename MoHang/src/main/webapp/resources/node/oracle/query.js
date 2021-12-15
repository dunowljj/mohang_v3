function accountList(oracledb, conn) {
    conn.execute("select * from account"  , {}, {outFormat: oracledb.OBJECT}, function (err, result) {
        if (err) throw err;

        dataStr = JSON.stringify(result);
        console.log("dataStr: " + dataStr);
        console.log("query read success");
        arrStr = JSON.stringify(result.rows);
        var arr = JSON.parse(arrStr);

        result = arr;
        console.log(arr);

        return result;
    });
}

function socketInserMsg(oracledb, conn, chatVO){
    conn.execute("insert into chat values(chat_index_seq.nextval," + chatVO.room_num +","
        + chatVO.account_num +","+ chatVO.admin_num+","+ chatVO.chat_history+", sysdate)", function(err, result){
        if(err) throw err;

        console.log(result);
    });
}

    module.exports.accountList = accountList;