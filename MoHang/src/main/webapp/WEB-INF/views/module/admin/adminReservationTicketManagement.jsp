<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<style>
	*{font-family: 'Jua', sans-serif;}
	
</style>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="../resources/css/bootstrap.css" rel="stylesheet" />
</head>
<body>

<jsp:include page="/WEB-INF/views/comm/adminheader.jsp"></jsp:include>

<div class ="dd" style= "display : none">	
<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
</div>
	
	<div id="container-box1" style = "clear:both";>
	<div id="container">
	
	<p style="font-size: 30px; ">
		<span style="color: #000000;font-size: 20px;">행사 예약 티켓 관리</span>
	</p>
	
	행사정보
	<table class="table table-hover">
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
						style="vertical-align: inherit;">이름</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">예약날짜</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">가격</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">예약현황</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">비고</font></font></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">이서준</font></font></th>
				<td><a href="/MoHang/Review/ReviewDetail.do"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/18</font></font></a></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">무료</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">예약완료</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><button>예약취소</button></font></font></td>
			</tr>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">이용환</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/18</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">유료</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">예약취소</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"></font></font></td>
			</tr>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">이상엽</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/18</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">유료</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">관람완료</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"></font></font></td>
			</tr>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">이정준</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/18</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">유료</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">예약완료</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><button>예약취소</button></font></font></td>
			</tr>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">최지혜</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/18</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">무료</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">예약취소</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"></font></font></td>
			</tr>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">김원형</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/18</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">유료</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">미관람</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"></font></font></td>
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
		
		
		</div>
		</div>
		<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>