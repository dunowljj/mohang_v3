
//function btn_hide(e){
//	e.preventDefault();
//	document.getElementsByClassName("btn1").remove();
//}

  $(document).ready(function(){
	$(".btn1").on('click', function(e){
		e.preventDefault();
		this.remove();
	})
})