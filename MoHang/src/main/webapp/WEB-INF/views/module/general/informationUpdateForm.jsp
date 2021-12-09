<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/resources/css/general-style.css" rel="stylesheet" type="text/css"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
								alt='' style="border-radius:70%; width:100%; height:100%;"></a>
							
							</div>
<!-- 							onclick='changeUploadImg()' -->
							<br><input type="file" name="uploadFile"
							 value='data-type="" data-fileName="" data-path="" data-uuid=""'>
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
							출생년도 : <input type="date" name='account_birth_date' min="1910-01-01" max="2021-11" value="<c:out value="${account.account_birth_date}"/>"><br>
							전화번호 : <input type="text" name="account_phoneNumber" value="<c:out value="${account.account_phoneNumber}"/>"><br>
							이메일 : <input type="text" name="account_email" value="<c:out value="${account.account_email}"/>"><br>
							<div>
								주소 : <input type="text" name="account_address" value="<c:out value="${account.account_address}"/>">
								
							<div class="address_button1 mail_check_button" onclick="execution_daum_address()" style='display: inline-block;
								position: absolute;margin-top: 16px;width: 75px;height: 49px;'>
								<span>주소 찾기</span>
							</div>
							</div>
							<div style='margin-left: 54px;'>
								<input type="text" name="account_address2" value="<c:out value="${account.account_address2}"/>">
							</div>
							<div style='margin-left: 54px;'>
								<input type="text" name="account_address3" value="<c:out value="${account.account_address3}"/>">
							</div>
							
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
		    	 $("#uploadImg").attr('src', '${pageContext.request.contextPath}/resources/images/프로필2.png')
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
			
			if(attach.account_path != 0){
				
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
// 			    $("#uploadFile").attr("filename",attach.account_fileName);
// 				if(attach.account_fileName != null){
					uploadImg.attr('src', '/general/display?filename='+fileCallPath);
// 				}
				
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
		
		}
	
		//다음 주소 연동 
		function execution_daum_address() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								addr += extraAddr;

							} else {
								addr += ' ';
							}

							$("[name=account_address]").val(data.zonecode);
							$("[name=account_address2]").val(addr);

							// 커서를 상세주소 필드로 이동한다.
							$(".account_address3").attr("readonly", false);
							$(".account_address3").focus();

						}
					}).open();
			
		}
	
		
// 		//upload module
// 		var uploadService = (function(){
		   
// 		   function add(reply, callback, error) {
// 		      console.log("add reply...............");

// 		      $.ajax({
// 		         type : 'post',
// 		         url : '/replies/new',
// 		         data : JSON.stringify(reply),
// 		         contentType : "application/json; charset=utf-8",
// 		         success : function(result, status, xhr) {
// 		            if (callback) {
// 		               callback(result);
// 		            }
// 		         },
// 		         error : function(xhr, status, er) {
// 		            if (error) {
// 		               error(er);
// 		            }
// 		         }//end error
// 		      }) //end ajax
// 		   }//end add
// 		})
	
	</script>
	

	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>	
	</body>
	
	<!-- 페이드 영역--> 
<!-- 	<div id="mask"></div> -->

</body>

</html>







