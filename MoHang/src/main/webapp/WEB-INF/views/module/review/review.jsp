<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
	<div id="header_nav">
		<ul>
			<li><a href="/MoHang/search/eventsearch.do?field=모든 분야">전체</a></li>
			<li><a href="/MoHang/search/eventsearch.do?field=사업/창업">사업/창업</a></li>
			<li><a href="/MoHang/search/eventsearch.do?field=IT/개발">IT/개발</a></li>
			<li><a href="/MoHang/search/eventsearch.do?field=마케팅/홍보">마케팅/홍보</a></li>
			<li><a href="/MoHang/search/eventsearch.do?field=디자인/기획">디자인/기획</a></li>
			<li><a href="/MoHang/search/eventsearch.do?field=문화/예술">문화/예술</a></li>
			<li><a href="/MoHang/search/eventsearch.do?field=취미/생활">취미/생활</a></li>
			<li><a href="/MoHang/search/eventsearch.do?field=건강/의료">건강/의료</a></li>
			<li><a href="/MoHang/Review/ReviewList.do">리뷰게시판</a></li>
		</ul>
	</div>
	<div id="container-box1">
	<div id="container">
	
	<p>
		<span style="color: #000000; font-size: 20px;">리뷰게시판</span>
	</p>
	
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
						style="vertical-align: inherit;">번호</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">제목</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">작성자</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">작성 날짜</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">조회수</font></font></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></th>
				<td><a href="/MoHang/Review/ReviewDetail.do"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">바보</font></font></a></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">김원형</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">2021.10.22</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">999999999999999</font></font></td>
			</tr>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">2</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">멍청</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">김원형</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">2021.10.22</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">9</font></font></td>
			</tr>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">3</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
			</tr>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">4</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
			</tr>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">5</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
			</tr>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">6</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
			</tr>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">7</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
			</tr>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">8</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
			</tr>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">9</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
			</tr>
			<tr>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">10</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></td>
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