/**
 * 
 */


const express = require("express");
const PORT = 8082;

const app = express();


app.get("/", (req,res)=>{
	res.send("Chat Server Test");
});

app.listen(PORT);

console.log("Chat Server On");