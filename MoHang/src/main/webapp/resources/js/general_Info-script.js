//-------updateInformion---------
var updateInfoService = (function(){
//관심도 받아오기
function checkInterest(){
	var interest = $(".interest_check input[type='hidden']").val();
	console.log(interest);
	var arr = interest.split(',');
	
	for(var i in arr){
		console.log(arr[i]);
		$(".interest_check input[value=\'"+arr[i]+"\']")
		.attr("checked", true);
	}
}
//관심도 end

//성별 받아오기
function checkGender(){
	var gender = $(".interest_gender input[type='hidden']").val();
	if(gender == "남"){
		$("#male").attr('checked',true);
	}else{
		$("#female").attr('checked',true);
	}	
}
//
//$(document).ready(function(){
//	checkInterest();
//	checkGender();
//});
//성별 end

//파일 업로드 비동기 
//function uploadProfile(){
//	$("#prof_up_btn").on("change")
//	
//	
//	
//}
//function enlargeProfile(){
//	$("#uploadImg").on('click', function(){
//		this.css("width", "500px").css("height", "380px")
//	})
//}


//리턴
	return {
		checkInterest : checkInterest,
		checkGender : checkGender,
	};


})();

/* var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|png)$");*/
var maxSize = 5242880;
function checkExtension(fileName, fileSize){
    
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    
//	    if(regex.test(fileName)){
//	      alert("해당 종류의 파일은 업로드할 수 없습니다.");
//	      return false;
//	    }
    return true;
  }


//function changeUploadImg(){
//    var uploadImg = document.getElementById("uploadImg");
//    if(uploadImg.alt == "enlarge"){
//    	uploadImg.alt = "reset";
//    	uploadImg.style.width = "500px";
//    	uploadImg.style.height = "500px";
//    } else {
//    	uploadImg.alt = "enlarge";
//    	uploadImg.style.width = "67.99px";
//    	uploadImg.style.height = "66px";
//    }
//}
$("#uploadImg").on("click","img", function(e){
    
    console.log("view image");
    
    var uploadImg = $(this);
    
    var path = encodeURIComponent(uploadImg.data("path")+"/" + uploadImg.data("uuid")+"_" + uploadImg.data("filename"));
    
//    if(uploadimg.data("type")){
//      showImage(path.replace(new RegExp(/\\/g),"/"));
//    }else {
      //download 
      self.location ="/download?fileName="+path
//    }
    
    
});
  
function showImage(fileCallPath){
	    
    alert(fileCallPath);
    
    $(".bigPictureWrapper").css("display","flex").show();
    
    $(".bigPicture")
    .html("<img src='/display?fileName="+fileCallPath+"' >")
    .animate({width:'100%', height: '100%'}, 1000);
    
  }

  $(".bigPictureWrapper").on("click", function(e){
    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
    setTimeout(function(){
      $('.bigPictureWrapper').hide();
    }, 1000);
  });



//-------updateInformation end---------