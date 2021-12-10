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
	if(gender == "m"){
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



//리턴
	return {
		checkInterest : checkInterest,
		checkGender : checkGender,
	};


})();




function showUploadResult(uploadResult){
    uploadImg = $("#uploadImg");
	fildat = $("#fileDat");

	console.log(uploadResult.account_path)
    if(!uploadResult){ 
    	uploadImg.attr('src', '${pageContext.request.contextPath}/resources/images/프로필.png')
    	console.log(uploadResult.account_path)
    	return; }
    
    uploadFile = $("input[name='uploadFile']");
//	    absolutePath = "\${pageContext.request.contextPath}/"
//		var uploadFolder = "C:\\Users\\jhwoo_nb\\git\\mohang_v3\\MoHang\\src\\main\\webapp\\resources\\images";
    if(uploadResult.account_fileType){
			var fileCallPath =  encodeURIComponent(uploadResult.account_path + "/s_"+uploadResult.account_uuid +"_"+uploadResult.account_fileName);
			uploadFile.data('uuid', uploadResult.account_uuid);
			uploadFile.data('fileName', uploadResult.account_fileName);
			uploadFile.data('type', uploadResult.account_fileType);
			uploadFile.data('path', uploadResult.account_path);
			uploadImg.attr('src', '/general/display?filename='+fileCallPath);
			
		    $("#fileDat input[name='account_uuid']").val(uploadResult.account_uuid)
		    $("#fileDat input[name='account_path']").val(uploadResult.account_path)
		    $("#fileDat input[name='account_fileName']").val(uploadResult.account_fileName)
		    $("#fileDat input[name='account_fileType']").val(uploadResult.account_fileType)
			
		}
		
    };

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




//-------updateInformation end---------