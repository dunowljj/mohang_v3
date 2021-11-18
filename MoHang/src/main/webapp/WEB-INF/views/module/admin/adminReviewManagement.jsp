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
	
	<div id="container-box1" style = "clear:both; padding-top: 70px;">
	<div id="container" style="padding-bottom: 60px;">
	
	
		<form class="d-flex" style=" float: left;">
			<input class="form-control me-sm-2"type="text" placeholder="Search"    style=" width: auto;">
			<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>&nbsp;&nbsp;&nbsp;
		</form>
		<a id="btn btn-secondary my-2 my-sm-02" class="btn_1" href= "/MoHang/admin/AdminNotice.do" style="text-decoration:none;">공지사항</a>&nbsp;&nbsp;&nbsp;
		<a id="btn btn-secondary my-2 my-sm-03" class="btn_1" href="/MoHang/admin/AdminReview.do" style ="color:red; text-decoration:none;"> 리뷰</a>
	
	
	
	<table class="table table-hover"  style="margin-top: 25px;" >
	<colgroup>
	    <col style="width:30px;">	 
		 <col style="width:100px;">
		 <col style="width:150px; ">
		 <col style="width:50px;">
		 <col style="width:70px;">
		 <col style="width:30px;">	
		 <col style="width:50px;">	
		 
	</colgroup>
		<thead>
			<tr class="table-active">
				<th scop="col"><input type="checkbox"></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">번호</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">제목</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">작성자</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">작성일</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">조회수</font></font></th>
				<th scope="col"><font style="vertical-align: inherit;"><font
							style="vertical-align: inherit;"></font></font></th>
				</tr>
		</thead>
		<tbody>
			<tr>
			    <th scop="row"><input type="checkbox"></th>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></th>
				<td><a href="/MoHang/Review/ReviewDetail.do"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">~여행을떠나요</font></font></a></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">이서준</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/8</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">99999</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><button>수정</button>&nbsp;<button>삭제</button></font></font></td>
			</tr>
			<tr>
			    <th scop="row"><input type="checkbox"></th>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></th>
				<td><a href="/MoHang/Review/ReviewDetail.do"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">~여행을떠나요</font></font></a></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">이서준</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/8</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">99999</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><button>수정</button>&nbsp;<button>삭제</button></font></font></td>
			</tr>
			<tr>
			    <th scop="row"><input type="checkbox"></th>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></th>
				<td><a href="/MoHang/Review/ReviewDetail.do"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">~여행을떠나요</font></font></a></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">이서준</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/8</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">99999</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><button>수정</button>&nbsp;<button>삭제</button></font></font></td>
			</tr>
			<tr>
			    <th scop="row"><input type="checkbox"></th>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></th>
				<td><a href="/MoHang/Review/ReviewDetail.do"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">~여행을떠나요</font></font></a></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">이서준</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/8</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">99999</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><button>수정</button>&nbsp;<button>삭제</button></font></font></td>
			</tr>
			<tr>
			    <th scop="row"><input type="checkbox"></th>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></th>
				<td><a href="/MoHang/Review/ReviewDetail.do"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">~여행을떠나요</font></font></a></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">이서준</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/8</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">99999</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><button>수정</button>&nbsp;<button>삭제</button></font></font></td>
			</tr>
			<tr>
			    <th scop="row"><input type="checkbox"></th>
				<th scope="row"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">1</font></font></th>
				<td><a href="/MoHang/Review/ReviewDetail.do"><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">~여행을떠나요</font></font></a></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">이서준</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">12/8</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">99999</font></font></td>
				<td><font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;"><button>수정</button>&nbsp;<button>삭제</button></font></font></td>
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
			<button type="button" class="btn btn-secondary btn-sm" type="reset" style="margin-top: 32px;
             float: right;">선택삭제</button>
		</div>
		
		</div>
		</div>
		<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>