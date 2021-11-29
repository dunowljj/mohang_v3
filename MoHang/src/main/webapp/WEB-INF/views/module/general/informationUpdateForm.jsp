<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/resources/css/general-style.css" rel="stylesheet" type="text/css"/>
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->

<title>Insert title here</title>
</head>
<body>
	<!-- 전체 랩 --> <div id="wrap"> 
	<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/general_Info-script.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/general_modal-script.js"></script>
	<div class='bigPictureWrapper'>
		<div class='bigPicture'>
		</div>
	</div>
	
	<div id="container-box1">
		<div id="container">
			<div class='account_wrapper'>
				<div class="form_wrap">
					<div class="form_head">
						<h3>회원정보수정</h3><br>
						<h5>기본정보수정</h5><hr>
		 			</div>
					<br>
			
					<div class="form_center">
						<form action="updateInformation" method="post" id='updateForm'
						 enctype="multipart/form-data">
							<input type="hidden" name="account_num" value="<c:out value='${account.account_num}'/>">
							<div style="height:80px; width:80px;">
							<a><img id="uploadImg" src='${pageContext.request.contextPath}/resources/images/프로필2.png' 
								alt='' style="border-radius:35%; width:100%; height:100%;"></a>
							</div>
<!-- 							onclick='changeUploadImg()' -->
							<br><input type="file" name="uploadFile">
<!-- 							 value=' data-type="" data-fileName="" data-path="" data-uuid=""'> -->
							<div id='fileDat'>
<!-- 							<input type="hidden" name="attach.account_num" value="A-2"> -->
							<input type="hidden" name="account_uuid" value="">
							<input type="hidden" name="account_path" value="">
							<input type="hidden" name="account_fileName" value="">
							<input type="hidden" name="account_fileType" value="">
							</div>
<!-- 							<div class="prof_result"> -->
<!-- 								<div ></div> -->
								
<%-- 								<input type="hidden" name="accountImg_uuid" value="<c:out value='${account.accountImg_uuid}'/>"> --%>
<%-- 								<input type="hidden" name="accountImg_uploadPath" value="<c:out value='${account.accountImg_uploadPath}'/>"> --%>
<%-- 								<input type="hidden" name="accountImg_fileName" value="<c:out value='${account.accountImg_fileName}'/>"> --%>
<%-- 								<input type="hidden" name="accountImg_fileType" value="<c:out value='${account.accountImg_fileType}'/>"> --%>
<!-- 							</div> -->
							
<!-- 							<input id="upProf" type="file" name="account_fname"><br> -->
<!-- 							<input type="button" name="변경" id="upProf_btn"> -->
							<br>
							이름 : <input type="text" name="account_name" value="<c:out value='${account.account_name}'/>">
							<br>
							아이디 :  <input type="text" name="account_id" value="<c:out value='${account.account_id}'/>">
							<br>
							비밀번호 : ******** <button class="pwUp_openMask" type="button">변경</button><br>
<%-- 							<input type="hidden" <c:out value="${account.account_password}"/>> --%>
							
							<div class="interest_gender">
							성별 :
							  <input type="hidden" value="<c:out value='${account.account_gender}'></c:out>">
							  <input type="radio" id="male" name="account_gender" value="남" checked>
							  <label for="male">남</label>
							  <input type="radio" id="female" name="account_gender" value="여">
							  <label for="female">여</label>
							</div>
							출생년도 : <input type="date" name='account_birth_date' min="1910-01" max="2021-11" value="<c:out value="${account.account_birth_date}"/>"><br>
							전화번호 : <input type="text" name="account_phonenumber" value="<c:out value="${account.account_phonenumber}"/>"><br>
							이메일 : <input type="text" name="account_email" value="<c:out value="${account.account_email}"/>"><br>
							주소 : <input type="text" name="account_address" value="<c:out value="${account.account_address}"/>"><br>
							
							<br>
							관심사별 항목 체크	
							<br>
							<div class="interest_check">
								<input type="hidden" value="<c:out value="${account.account_interest}"/>">
								<input type="checkbox" name="account_interest" value='사업/창업'>사업/창업
								<input type="checkbox" name="account_interest" value='IT/개발'>IT/개발	
								<input type="checkbox" name="account_interest" value='마케팅/홍보'>마케팅/홍보 	
								<input type="checkbox" name="account_interest" value='디자인/기획'>디자인/기획
								<input type="checkbox" name="account_interest" value='문화/예술'>문화/예술	
								<input type="checkbox" name="account_interest" value='취미/생활'>취미/생활
								<input type="checkbox" name="account_interest" value='건강/의료'>건강/의료
							</div>
							<br>
							<input id='' type="submit" value="수정">
							<input id='' type="reset" value="취소">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 		modal -->
<div class="pwUp_ModalPopup">
	<div id='pw_update_head'>
		<b>비밀번호 변경</b>
		</div>
			<form action='updatePassword' id="pw_update_form" method='post'>
				<input name="password" type='password' onfocus="this.placeholder=''" onblur="this.placeholder=' 현재 비밀번호'"
					placeholder=' 현재 비밀번호' value=""><br>
				<div id="pw_update_small_title">
				<span>새 비밀번호 설정</span>
				</div>
				<input name="password1" type='password' onfocus="this.placeholder=''" onblur="this.placeholder=' 6자리 이상 문자,숫자,특수문자'"
					placeholder=' 6자리 이상 문자,숫자,특수문자'><br>
				<input name="password2" type='password' onfocus="this.placeholder=''" onblur="this.placeholder=' 새 비밀번호 확인'"
					placeholder=' 새 비밀번호 확인'><br>
				<input type="hidden" name="account_num" value="<c:out value='${account.account_num}'/>">
		<div id='pw_update_footer'>
		<a class="pwUp_close-area">취소하기</a>
		<a><input type="submit" value='변경하기'></input></a>
    	</div>
			</form>
   </div>
</div>
<!-- 		modal end -->
	<div id="mask"></div>
	
	<script type="text/javascript">
	
	$(document).ready(function(){
		updateInfoService.checkInterest();
		updateInfoService.checkGender();
	
		$("input[type='file']").on('change',function(e){
	
		    var formData = new FormData();
		    
		    var uploadFile = $("input[name='uploadFile']");
		    
		    var files = uploadFile[0].files;
		   	console.log(files[0]);
			var file = files[0];
			if(file == undefined){
		    	 $("#uploadImg").attr('src', '${pageContext.request.contextPath}/resources/images/프로필.png')
			}	      
			if(!checkExtension(file.name, file.size) ){
		        return false;
		      }
		      formData.append("uploadFile", file);
		    
		    $.ajax({
		      url: '/general/uploadProfile',
		      processData: false, 
		      contentType: false,
		      data: formData,
		      type: 'POST',
		      dataType:'json',
		        success: function(result){
		          console.log(result); 
				  showUploadResult(result); //업로드 결과 처리 함수 
	
		      }
		    }); //$.ajax
	    
	});//on.change
		
	    $("#uploadImg").click(function(){
	        
	        var uploadFile = $("input[name='uploadFile']");
	        var uploadImg = $(this);

	        var path = uploadFile.data("path")+"\\" + uploadFile.data("uuid")+"_" + uploadFile.data("fileName");
// 	        console.log(path);
	        if(uploadFile.data("type")){

	          showImage(path);
	        }else {
	          //download 
// 	          self.location ="/download?fileName="+path
	        }
	    });	
	
		var account_num = '<c:out value="${account.account_num}"/>';
		
		$.getJSON("/general/getAttach",{account_num: account_num}, function(attach){
			
			var uploadFile = $("input[name='uploadFile']");
	        var uploadImg = $("#uploadImg");
			var fileCallPath =  encodeURIComponent(attach.account_path + "/s_"+attach.account_uuid +"_"+attach.account_fileName);
			uploadFile.data('uuid', attach.account_uuid);
			uploadFile.data('fileName', attach.account_fileName);
			uploadFile.data('type', attach.account_fileType);
			uploadFile.data('path', attach.account_path);
			
			$("#fileDat input[name='account_uuid']").val(attach.account_uuid)
		    $("#fileDat input[name='account_path']").val(attach.account_path)
		    $("#fileDat input[name='account_fileName']").val(attach.account_fileName)
		    $("#fileDat input[name='account_fileType']").val(attach.account_fileType)
		    $("#uploadFile").attr("filename",attach.account_fileName);
			if(attach.account_fileName != null){
			uploadImg.attr('src', '/general/display?filename='+fileCallPath);
			}
			
			
		});
	
	
  });//document.ready
 
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  var maxSize = 5242880;
  function checkExtension(fileName, fileSize){
      
      if(fileSize >= maxSize){
        alert("파일 사이즈 초과");
        return false;
      }
      
 	    if(regex.test(fileName)){
 	      alert("해당 종류의 파일은 업로드할 수 없습니다.");
 	      return false;
 	    }
      return true;
   }


	
	
      
    function showImage(fileCallPath){
    	    
       alert(fileCallPath);
       
       $(".bigPictureWrapper").css("display","flex").show();
       
       $(".bigPicture")
       .html("<img src='/general/display?filename="+encodeURI(fileCallPath)+"'>")
       .animate({width:'100%', height: '100%'}, 1000);
       
     }

     $(".bigPictureWrapper").on("click", function(e){
       $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
       setTimeout(function(){
         $('.bigPictureWrapper').hide();
       }, 1000);
     });
	
	
     var message = '<c:out value="${message}"/>';

		messagePop(message);

		history.replaceState({}, null, null);

		function messagePop(message) {

			if (message === '' || history.state) {
				return;
			}
			alert(message);
		
		}
	
	
	
	
	
	
	
	
	
	
	
	
	</script>
	

	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>	
	</body>
	
	<!-- 페이드 영역--> 
<!-- 	<div id="mask"></div> -->

</body>

</html>







