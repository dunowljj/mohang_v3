

$(document).ready(function(){
	
var actionForm= $("#actionForm");

$(".page-item a").on("click",function(e){
	e.preventDefault();
	console.log("@@@@@@@");
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
})


})