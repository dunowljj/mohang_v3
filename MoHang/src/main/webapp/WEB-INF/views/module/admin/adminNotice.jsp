<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	

	<div id="container-box1" style = "clear:both; padding-top: 50px;">
	<div id="container" style="padding-bottom: 60px;">
	
	
		<form class="d-flex" style=" float: left;">
			<input class="form-control me-sm-2"type="text" placeholder="Search"    style=" width: auto;">
			<button class="btn btn-secondary my-2 my-sm-01" type="submit">Search</button>&nbsp;&nbsp;&nbsp;
		</form>
		<a id="btn btn-secondary my-2 my-sm-02" class="btn_1" style="color:red; text-decoration:none;">공지사항</a>&nbsp;&nbsp;&nbsp;
		<a id="btn btn-secondary my-2 my-sm-03" class="btn_1" href="/MoHang/admin/AdminReview.do" style="text-decoration:none;"> 리뷰</a>
	
	
	
	<table class="table table-hover"    style= "margin-top: 45px;">
	<colgroup>
	    <col style="width:30px;">	 
		 <col style="width:100px;">
		 <col style="width:150px; ">
		 <col style="width:50px;">
		 <col style="width:70px;">
		 <col style="width:30px;">	
		 
	</colgroup>
		<thead>
			<tr class="table-active">
				<th scop="col"><input type="checkbox"></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">이름</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">아이디</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">전화번호</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">나이</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">비고</font></font></th>
			</tr>
		</thead>
		<tbody>
			<tr>
			    <th scop="row"><input type="checkbox"></th>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">이서준</font></font></th>
				<td><a href="/MoHang/Review/ReviewDetail.do"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">서준123</font></font></a></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">010-0000-0000</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1짱나이</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><button>삭제</button></font></font></td>
			</tr>
			<tr>
			    <th scop="row"><input type="checkbox"></th>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">이용환</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">용환123</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">010-0000-0000</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">2짱나이</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><button>삭제</button></font></font></td>
			</tr>
			<tr>
			    <th scop="row"><input type="checkbox"></th>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">이상엽</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">상엽123</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">010-0000-0000</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">3짱나이</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><button>삭제</button></font></font></td>
			</tr>
			<tr>
			    <th scop="col"><input type="checkbox"></th>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">이정준</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">정준123</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">010-0000-0000</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">4짱나이</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><button>삭제</button></font></font></td>
			</tr>
			<tr>
			    <th scop="col"><input type="checkbox"></th>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">최지혜</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">지혜123</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">010-0000-0000</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">5짱나이</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><button>삭제</button></font></font></td>
			</tr>
			<tr>
			    <th scop="col"><input type="checkbox"></th>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">김원형</font></font></th>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">원형123</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">010-0000-0000</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">5짱나이</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><button>삭제</button></font></font></td>
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
		
		<div class="choice_cancel">
			<button type="cancel" class="btn btn-secondary btn-sm" type="reset" style="margin-top: 32px;
             	float: right;">선택삭제</button>
			<button type="button" class="btn btn-secondary btn-sm" style="margin-top: 32px;
             	float: right; margin-right: 20px;"><a href="/MoHang/admin/AdminNoticeInsertForm.do" style=" text-decoration:none;">글쓰기</a></button>
		</div>
		
	</div>
</div>
		<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>