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
							<a><img id="uploadImg" src='${pageContext.request.contextPath}/resources/images/프로필2.png' alt='enlarge' onclick='changeUploadImg()' style="border-radius:70%"></a>
							<br><input type="file" name="uploadFile">
							<div class='bigPictureWrapper'>
								<div class='bigPicture'>
								</div>
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
			<form action='' id="pw_update_form">
				<input type='text' onfocus="this.placeholder=''" onblur="this.placeholder=' 현재 비밀번호'"
					placeholder=' 현재 비밀번호'><br>
				<div id="pw_update_small_title">
				<span>새 비밀번호 설정</span>
				</div>
				<input type='text' onfocus="this.placeholder=''" onblur="this.placeholder=' 6자리 이상 문자,숫자,특수문자'"
					placeholder=' 6자리 이상 문자,숫자,특수문자'><br>
				<input type='text' onfocus="this.placeholder=''" onblur="this.placeholder=' 새 비밀번호 확인'"
					placeholder=' 새 비밀번호 확인'><br>
			</form>
		<div id='pw_update_footer'>
		<a class="pwUp_close-area">취소하기</a>
		<a><input type="submit" value='변경하기'></input></a>
    	</div>
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
// 	      if(!checkExtension(file.name, file.size) ){
// 	        return false;
// 	      }
		console.log(file.name)
		console.log(file.size)
		console.log(file);
	      formData.append("uploadFile", file);
	      console.log(formData);
	 
	    
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
	    
	   });
	  function showUploadResult(uploadResult){
	    uploadImg = $("#uploadImg");
		    
	    if(!uploadResult){ 
	    	uploadImg.attr('src', '${pageContext.request.contextPath}/resources/images/프로필.png')
	    	
	    	return; }
	    
	    uploadFile = $("input[name='uploadFile']");
// 	    absolutePath = "\${pageContext.request.contextPath}/"
// 		var uploadFolder = "C:\\Users\\jhwoo_nb\\git\\mohang_v3\\MoHang\\src\\main\\webapp\\resources\\images";
	    if(uploadResult.image){
				var fileCallPath =  encodeURIComponent(uploadResult.uploadPath + "/s_"+uploadResult.uuid +"_"+uploadResult.name);
// 				uploadFile.data('uuid', uploadFile.uuid);
// 				uploadFile.data('name', uploadFile.name);
// 				uploadFile.data('type', uploadFile.type);
// 				uploadFile.data('path', uploadFile.path);
				uploadImg.attr('src', '/general/display?filename='+fileCallPath);
			}
			
	    };
	    
	    
	  
  });

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>
	

	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>	
	</body>
	
	<!-- 페이드 영역--> 
<!-- 	<div id="mask"></div> -->

</body>

</html>







