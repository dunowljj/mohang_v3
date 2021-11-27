//수량 더하기 빼기
function count(type)  {
  const resultElement = document.getElementById('result');
  
  let number = resultElement.innerText;
  
  if(type === 'plus') {
    number = parseInt(number) + 1;
  }
  else if(type === 'minus'&& number != 0)  {
    number = parseInt(number) - 1;
  }
  
  resultElement.innerText = number;
}

//upload module
var uploadService = (function(){
	
	function add(reply, callback, error) {
		console.log("add reply...............");

		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}//end error
		}) //end ajax
	}//end add
})



