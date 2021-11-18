

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">

<link href="../resources/css/event.css" rel="stylesheet">

<style>
	*{font-family: 'Jua', sans-serif;}
	
</style>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="../resources/css/bootstrap.css" rel="stylesheet" />

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>



<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/event.js" type="text/javascript"></script> 

	
	<div id="container-box1" style = "clear:both" >
	<div id="container">
	
	<p style="font-size: 30px; margin-top:150px;">
		<span style="color: #000000;font-size: 20px;">My 행사 리스트</span>
	</p>
	
	<table class="table table-hover" id="applyList">
	<colgroup>
		 <col style="width:30px;">
		 <col style="width:150px;">
		 <col style="width:50px;">
		 <col style="width:70px;">
		 <col style="width:30px;">		 
	</colgroup>
		<thead>
			<tr class="table-active">
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">번호</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">행사제목</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">신청날짜</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">진행 상황</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">비고</font></font></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></th>
				<td onclick="event.cancelBubble=true"><a href="/MoHang/event/applyInsertFormShow.do" ><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">~여행을 떠나요</font></font></a></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/17</font></font></td>
				<td><div class="arrow"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;" >승인대기</font></font></div></td>
				<td onclick="event.cancelBubble=true"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><a href="/MoHang/event/insertFormUpdate.do"><button>수정</button><button style="display:none">결제</button></a></font></font></td>
			</tr>
			<tr>
				<td colspan="5" >
					<div class="listArccodian">
					<!-- 이미지+글조합 -->
						<div class="arccodianBox">
							<figure >
								<img src="../resources/images/승인1.png" alt="승인대기" class="imageSize" id="img1"/>
								<figcaption>승인대기</figcaption>
							</figure>
				
							<figure>
								<img src="../resources/images/승인3.png" alt="승인반려" class="imageSize" id="img3"/>
								<figcaption>승인반려</figcaption>
							</figure>
							
							<figure>
								<img src="../resources/images/승인4.png" alt="승인완료" class="imageSize" id="img4"/>
								<figcaption>승인완료</figcaption>
							</figure>
							
						<figure>
								<img src="../resources/images/승인5.png" alt="결제대기" class="imageSize" id="img5"/>
								<figcaption>결제대기</figcaption>
							</figure>
						
								<figure>
								<img src="../resources/images/승인6.png" alt="행사대기" class="imageSize" id="img6"/>
								<figcaption>행사대기</figcaption>
							</figure>
							
							<figure>
								<img src="../resources/images/승인7.png" alt="행사진행중" class="imageSize" id="img7"/>
								<figcaption>행사진행중</figcaption>
							</figure>
							
							<figure>
								<img src="../resources/images/승인8.png" alt="행사완료" class="imageSize" id="img8"/>
								<figcaption>행사완료</figcaption>
							</figure> 
						</div>
					</div>
				</td>
			</tr>
	<!-- 아코디언  한덩어리 실험 -->
<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></th>
				<td onclick="event.cancelBubble=true"><a href="/MoHang/event/applyInsertFormShow.do" ><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">~여행을 떠나요</font></font></a></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/17</font></font></td>
				<td><div class="arrow"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;" >승인대기</font></font></div></td>
				<td onclick="event.cancelBubble=true"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><a href="/MoHang/event/insertFormUpdate.do"><button>수정</button><button style="display:none">결제</button></a></font></font></td>
			</tr>
			<tr>
				<td colspan="5" >
					<div class="listArccodian">
					<!-- 이미지+글조합 -->
						<div class="arccodianBox">
							<figure >
								<img src="../resources/images/승인1.png" alt="승인대기" class="imageSize" id="img1"/>
								<figcaption>승인대기</figcaption>
							</figure>
				
							<figure>
								<img src="../resources/images/승인3.png" alt="승인반려" class="imageSize" id="img3"/>
								<figcaption>승인반려</figcaption>
							</figure>
							
							<figure>
								<img src="../resources/images/승인4.png" alt="승인완료" class="imageSize" id="img4"/>
								<figcaption>승인완료</figcaption>
							</figure>
							
						<figure>
								<img src="../resources/images/승인5.png" alt="결제대기" class="imageSize" id="img5"/>
								<figcaption>결제대기</figcaption>
							</figure>
						
								<figure>
								<img src="../resources/images/승인6.png" alt="행사대기" class="imageSize" id="img6"/>
								<figcaption>행사대기</figcaption>
							</figure>
							
							<figure>
								<img src="../resources/images/승인7.png" alt="행사진행중" class="imageSize" id="img7"/>
								<figcaption>행사진행중</figcaption>
							</figure>
							
							<figure>
								<img src="../resources/images/승인8.png" alt="행사완료" class="imageSize" id="img8"/>
								<figcaption>행사완료</figcaption>
							</figure> 
						</div>
					</div>
				</td>
			</tr>
			
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></th>
				<td onclick="event.cancelBubble=true"><a href="/MoHang/event/applyInsertFormShow.do" ><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">~여행을 떠나요</font></font></a></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/17</font></font></td>
				<td><div class="arrow"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;" >승인대기</font></font></div></td>
				<td onclick="event.cancelBubble=true"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><a href="/MoHang/event/insertFormUpdate.do"><button>수정</button><button style="display:none">결제</button></a></font></font></td>
			</tr>
			<tr>
				<td colspan="5" >
					<div class="listArccodian">
					<!-- 이미지+글조합 -->
						<div class="arccodianBox">
							<figure >
								<img src="../resources/images/승인1.png" alt="승인대기" class="imageSize" id="img1"/>
								<figcaption>승인대기</figcaption>
							</figure>
				
							<figure>
								<img src="../resources/images/승인3.png" alt="승인반려" class="imageSize" id="img3"/>
								<figcaption>승인반려</figcaption>
							</figure>
							
							<figure>
								<img src="../resources/images/승인4.png" alt="승인완료" class="imageSize" id="img4"/>
								<figcaption>승인완료</figcaption>
							</figure>
							
						<figure>
								<img src="../resources/images/승인5.png" alt="결제대기" class="imageSize" id="img5"/>
								<figcaption>결제대기</figcaption>
							</figure>
						
								<figure>
								<img src="../resources/images/승인6.png" alt="행사대기" class="imageSize" id="img6"/>
								<figcaption>행사대기</figcaption>
							</figure>
							
							<figure>
								<img src="../resources/images/승인7.png" alt="행사진행중" class="imageSize" id="img7"/>
								<figcaption>행사진행중</figcaption>
							</figure>
							
							<figure>
								<img src="../resources/images/승인8.png" alt="행사완료" class="imageSize" id="img8"/>
								<figcaption>행사완료</figcaption>
							</figure> 
						</div>
					</div>
				</td>
			</tr>
			
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></th>
				<td onclick="event.cancelBubble=true"><a href="/MoHang/event/applyInsertFormShow.do" ><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">~여행을 떠나요</font></font></a></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/17</font></font></td>
				<td><div class="arrow"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;" >승인대기</font></font></div></td>
				<td onclick="event.cancelBubble=true"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><a href="/MoHang/event/insertFormUpdate.do"><button>수정</button><button style="display:none">결제</button></a></font></font></td>
			</tr>
			<tr>
				<td colspan="5" >
					<div class="listArccodian">
					<!-- 이미지+글조합 -->
						<div class="arccodianBox">
							<figure >
								<img src="../resources/images/승인1.png" alt="승인대기" class="imageSize" id="img1"/>
								<figcaption>승인대기</figcaption>
							</figure>
				
							<figure>
								<img src="../resources/images/승인3.png" alt="승인반려" class="imageSize" id="img3"/>
								<figcaption>승인반려</figcaption>
							</figure>
							
							<figure>
								<img src="../resources/images/승인4.png" alt="승인완료" class="imageSize" id="img4"/>
								<figcaption>승인완료</figcaption>
							</figure>
							
						<figure>
								<img src="../resources/images/승인5.png" alt="결제대기" class="imageSize" id="img5"/>
								<figcaption>결제대기</figcaption>
							</figure>
						
								<figure>
								<img src="../resources/images/승인6.png" alt="행사대기" class="imageSize" id="img6"/>
								<figcaption>행사대기</figcaption>
							</figure>
							
							<figure>
								<img src="../resources/images/승인7.png" alt="행사진행중" class="imageSize" id="img7"/>
								<figcaption>행사진행중</figcaption>
							</figure>
							
							<figure>
								<img src="../resources/images/승인8.png" alt="행사완료" class="imageSize" id="img8"/>
								<figcaption>행사완료</figcaption>
							</figure> 
						</div>
					</div>
				</td>
			</tr>
			
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></th>
				<td onclick="event.cancelBubble=true"><a href="/MoHang/event/applyInsertFormShow.do" ><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">~여행을 떠나요</font></font></a></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/17</font></font></td>
				<td><div class="arrow"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;" >승인대기</font></font></div></td>
				<td onclick="event.cancelBubble=true"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><a href="/MoHang/event/insertFormUpdate.do"><button>수정</button><button style="display:none">결제</button></a></font></font></td>
			</tr>
			<tr>
				<td colspan="5" >
					<div class="listArccodian">
					<!-- 이미지+글조합 -->
						<div class="arccodianBox">
							<figure >
								<img src="../resources/images/승인1.png" alt="승인대기" class="imageSize" id="img1"/>
								<figcaption>승인대기</figcaption>
							</figure>
				
							<figure>
								<img src="../resources/images/승인3.png" alt="승인반려" class="imageSize" id="img3"/>
								<figcaption>승인반려</figcaption>
							</figure>
							
							<figure>
								<img src="../resources/images/승인4.png" alt="승인완료" class="imageSize" id="img4"/>
								<figcaption>승인완료</figcaption>
							</figure>
							
						<figure>
								<img src="../resources/images/승인5.png" alt="결제대기" class="imageSize" id="img5"/>
								<figcaption>결제대기</figcaption>
							</figure>
						
								<figure>
								<img src="../resources/images/승인6.png" alt="행사대기" class="imageSize" id="img6"/>
								<figcaption>행사대기</figcaption>
							</figure>
							
							<figure>
								<img src="../resources/images/승인7.png" alt="행사진행중" class="imageSize" id="img7"/>
								<figcaption>행사진행중</figcaption>
							</figure>
							
							<figure>
								<img src="../resources/images/승인8.png" alt="행사완료" class="imageSize" id="img8"/>
								<figcaption>행사완료</figcaption>
							</figure> 
						</div>
					</div>
				</td>
			</tr>
			
			
			
			
			
	
			
		</tbody>
		</table>

		<div class="page">
			<ul class="pagination">
				<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
				</li>
				<li class="page-item active"><a class="page-link" href="#">1</a>
				</li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">&raquo;</a>
				</li>
			</ul>
		</div>
		
		<div class="search">
		<form class="d-flex">
			<input class="form-control me-sm-2" type="text" placeholder="Search">
			<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
		</form>
		</div>
		</div>
		</div>
		<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>