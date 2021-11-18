<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모두의행사</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

</head>
<body>
<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
<div id="mask"></div>
	<div id="searchform">
		<div id="searchform_in">
			<form action="/MoHang/search/eventsearch2.do" method="post" id="searchform_form"> 
			<div class="searchform_one">
				<div class="searchtitle">
					개최기간
				</div>
				<div style="width: 430px; height: 30px; float: left;"></div>
				<div class="searchcontext">
					<input type="date" class="input_box" id="fromDate" name="fromDate" > 
				</div>
				<div style="float: left; margin-top: 10px;">
					~
				</div>
				<div class="searchcontext">
					<input type="date" class="input_box" id="toDate" name="toDate"> 
				</div>
			</div>
			
			<div class="searchform_one">
				<div class="searchtitle">
					검색 필터
				</div>
				<div style="float: left; width: 700px;height: 30px;"></div>
				<div class="search_dropbutton">
					가격 &nbsp;&nbsp;&nbsp;
					<div class="down"><i class="fas fa-chevron-down"></i></div>
						<div class="search_dropcontent" style="display: none;">
						<span>가격</span>
						<div></div>
						<div>
							<input type="radio" id="filter-cost-0" value="유료/무료" class="with-gap" name='price'>
							<label for="filter-cost-0">유료/무료</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="무료" class="with-gap" name='price'>
							<label for="filter-cost-0">무료</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="유료" class="with-gap" name='price'>
							<label for="filter-cost-0">유료</label>
						</div>
						<div class="row1">
							<div class="button_1">
								<a class="button_cancel">취소</a>
							</div>
							<div class="button_1">
								<a class="button_confirm">적용</a>
							</div>
						</div>
					</div>
				</div>
				<div class="search_dropbutton">
					행사 분야
					<div class="down"><i class="fas fa-chevron-down"></i></div>
						<div class="search_dropcontent" style="display: none;">
						<span>행사 분야</span>
						<div></div>
						<div>
							<input type="radio" id="filter-cost-0" value="모든 분야" class="with-gap" name='event-field'>
							<label for="filter-cost-0">모든 분야</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="사업/창업" class="with-gap" name='event-field'>
							<label for="filter-cost-0">사업/창업</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="IT/개발" class="with-gap" name='event-field'>
							<label for="filter-cost-0">IT/개발</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="마케팅/홍보" class="with-gap" name='event-field'>
							<label for="filter-cost-0">마케팅/홍보</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="디자인/기획" class="with-gap" name='event-field'>
							<label for="filter-cost-0">디자인/기획</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="문화/예술" class="with-gap" name='event-field'>
							<label for="filter-cost-0">문화/예술</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="취미/생활" class="with-gap" name='event-field'>
							<label for="filter-cost-0">취미/생활</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="건강/의료" class="with-gap" name='event-field'>
							<label for="filter-cost-0">건강/의료</label>
						</div>
						<div class="row1">
							<div class="button_1">
								<a class="button_cancel">취소</a>
							</div>
							<div class="button_1">
								<a class="button_confirm">적용</a>
							</div>
						</div>
					</div>
				</div>
				<div class="search_dropbutton">
					행사 유형
					<div class="down"><i class="fas fa-chevron-down"></i></div>
						<div class="search_dropcontent" style="display: none;">
						<span>행사 유형</span>
						<div></div>
						<div>
							<input type="radio" id="filter-cost-0" value="세미나/콘퍼런스" class="with-gap" name='event-type'>
							<label for="filter-cost-0">세미나/콘퍼런스</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="강의/교육" class="with-gap" name='event-type'>
							<label for="filter-cost-0">강의/교육</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="축제/공연" class="with-gap" name='event-type'>
							<label for="filter-cost-0">축제/공연</label>
						</div>
						<div class="row1">
							<div class="button_1">
								<a class="button_cancel">취소</a>
							</div>
							<div class="button_1">
								<a class="button_confirm">적용</a>
							</div>
						</div>
					</div>
						<input type="text" id="check" value="${check }" class="check" name='check' style="display: none;">
				</div>
			</div>
				</form>
			<div class="searchform_one">
				<div class="searchtitle">
					선택된 검색 옵션
				</div>
				
				<c:if test="${!empty keyword }">
					<div class="filter-btn" id="keyword1">검색어 :${keyword }<i class="far fa-times-circle cursor-pointer"></i></div>
				</c:if>
				<div class="filter-btn" id="field1" style="display: none;">행사 분야 <i class="far fa-times-circle cursor-pointer"></i></div>
				<c:if test="${!empty type }">
				<div class="filter-btn" id="type1" >${type }<i class="far fa-times-circle cursor-pointer"></i></div>
				</c:if>
				<c:if test="${!empty price }">	
					<div class="filter-btn" id="price1">${price }<i class="far fa-times-circle cursor-pointer"></i></div>
				</c:if>	
				<c:if test="${!empty field  }">
					<div class="filter-btn" id="field1">${field }<i class="far fa-times-circle cursor-pointer"></i></div>
				</c:if>
			</div>
			<div class="line"></div>
			<c:choose >
				<c:when test="${!empty field  }">
				<div class="eventfieldtitle">${field }</div>
				</c:when>
				<c:otherwise>
				<div class="eventfieldtitle">${field }</div>
				</c:otherwise>
			</c:choose>
			
			<span class="countevent">4개의 행사가 있습니다.</span>
		</div>
	</div>
	<div id="container-box">
		<div id="container">
			<div id="eventtitlebox">
				<span class="eventtitle">행사</span>
				<div class="filter-box">
					<input type="checkbox" name='like' value='like'>좋아요 순 
					<input type="checkbox" name='like' value='like'>예약 수 순 
					<input type="checkbox" name='like' value='like'>조회수 순
					<input type="checkbox" name='like' value='like'>가격순
				</div>
			</div>
			<div id="eventbox">
				<div class="keywordbox">
					<div id="keywordbox_in">
						<div id="keywordtitlebox">
							<span class="eventkeywordtitle">인기 검색어</span>
						
							<div id="keywordscroll">
								<ul>
									<li class='rank01'>1<a href="#"> 외국인유학생 채용박람회</a></li>
									<li class='rank02'>2<a href="#"> 2021년 제7회 더레저쇼 WITH 차박 캠핑카쇼</a></li>
									<li class='rank03'>3<a href="#"> 제63회 프랜차이즈 창업박람회 SETEC</a></li>
									<li class='rank04'>4<a href="#"> 슬기로운 데이터 분석 생활</a></li>
									<li class='rank05'>5<a href="#"> 2021년 제7회 더레저쇼 WITH 차박 캠핑카쇼</a></li>
									<li class='rank06'>6<a href="#"> 제63회 프랜차이즈 창업박람회 SETEC</a></li>
									<li class='rank07'>7<a href="#"> 외국인유학생 채용박람회</a></li>
									<li class='rank08'>8<a href="#"> 슬기로운 데이터 분석 생활</a></li>
									<li class='rank09'>9<a href="#"> 2021년 제7회 더레저쇼 WITH 차박 캠핑카쇼</a></li>
									<li class='rank010'>10<a href="#"> 외국인유학생 채용박람회</a></li>
								</ul>
							</div>
						</div>
						<div id="keywordraking">
							<div class="raking">
								<span class="raking_c">1.</span><span><a href="#">외국인유학생 채용박람회</a></span>
							</div>
							<div class="raking">
								<span class="raking_c">2.</span><span><a href="#">외국인유학생 채용박람회</a></span>
							</div>
							<div class="raking">
								<span class="raking_c">3.</span><span><a href="#">외국인유학생 채용박람회</a></span>
							</div>
							<div class="raking">
								<span class="raking_c">4.</span><span><a href="#">외국인유학생 채용박람회</a></span>
							</div>
							<div class="raking">
								<span class="raking_c">5.</span><span><a href="#">슬기로운 데이터 분석 생활</a></span>
							</div>
							<div class="raking">
								<span class="raking_c">6.</span><span><a href="#">슬기로운 데이터 분석 생활</a></span>
							</div>
							<div class="raking">
								<span class="raking_c">7.</span><span><a href="#">슬기로운 데이터 분석 생활</a></span>
							</div>
							<div class="raking">
								<span class="raking_c">8.</span><span><a href="#">슬기로운 데이터 분석 생활</a></span>
							</div>
							<div class="raking">
								<span class="raking_c">9.</span><span><a href="#">슬기로운 데이터 분석 생활</a></span>
							</div>
							<div class="raking">
								<span class="raking_c">10.</span><span><a href="#">슬기로운 데이터 분석 생활</a></span>
							</div>
						</div>
					</div>
				</div>
				<div class="eventbox_in">
					<div class="eventimg">
						<img src="../resources/images/행사1.jpg" style="height : 200px; width: 357px; border: 1px solid #e8e8e8;">
					</div>
					<div class="eventinformation">
						<div class="information_1">
							<span>2021-10-14 ~ 2021-10-17</span> 
							<div style="display: inline-block; width: 245px;"></div>
							<span class="eventprice">10000</span>
						</div>
						<div class="information_2">
							<span class="eventtitle_in"><a href="#">외국인유학생 채용박람회</a></span>
						</div>
						<div class="information_3">
							<span><img src="../resources/images/logo.png" alt="" style="width: 35px;height: 25xp;"></span>
							<span>모두의행사?</span>
							<div style= "display: inline-block; width: 240px;">
							</div>
							<span><img src="../resources/images/눈.png"></span>
							<span>0</span>
							<span><img src="../resources/images/빈하트.png" alt="" style="width: 16px; height: 16px;"></span>
						</div>
					</div>
				</div>
				<div class="eventbox_in">
					<div class="eventimg">
						<img src="../resources/images/행사5.jpg" style="height : 200px; width: 357px; border: 1px solid #e8e8e8;">
					</div>
					<div class="eventinformation">
						<div class="information_1">
							<span>2021-10-16 ~ 2021-10-20</span> 
							<div style="    display: inline-block; width: 245px;"></div>
							<span class="eventprice">10000</span>
						</div>
						<div class="information_2">
							<span class="eventtitle_in"><a href="#">2021년 제7회 더레저쇼 WITH 차박 캠핑카쇼</a></span>
						</div>
						<div class="information_3">
							<span><img src="../resources/images/logo.png" alt="" style="width: 35px;height: 25xp;"></span>
							<span>모두의행사?</span>
							<div style= "display: inline-block; width: 240px;">
							</div>
							<span><img src="../resources/images/눈.png"></span>
							<span>5</span>
							<span><img src="../resources/images/빈하트.png" alt="" style="width: 16px; height: 16px;"></span>
						</div>
					</div>
				</div>
				<div class="eventbox_in">
					<div class="eventimg"> 
						<img src="../resources/images/행사6.jpg" style="height : 200px; width: 357px; border: 1px solid #e8e8e8;">
					</div>
					<div class="eventinformation">
						<div class="information_1">
							<span>2021-11-01 ~ 2021-11-20</span> 
							<div style="display: inline-block; width: 245px;"></div>
							<span class="eventprice">무료</span>
						</div>
						<div class="information_2">
							<span class="eventtitle_in"><a href="#">제63회 프랜차이즈 창업박람회 SETEC</a></span>
						</div>
						<div class="information_3">
							<span><img src="../resources/images/logo.png" alt="" style="width: 35px;height: 25xp;"></span>
							<span>모두의행사?</span>
							<div style= "display: inline-block; width: 240px;">
							</div>
							<span><img src="../resources/images/눈.png"></span>
							<span>10</span>
							<span><img src="../resources/images/찬하트.png" alt="" style="width: 16px; height: 16px;"></span>
						</div>
					</div>
				</div>
				<div class="eventbox_in">
					<div class="eventimg">
						<img src="../resources/images/행사7.jpg" style="height : 200px; width: 357px; border: 1px solid #e8e8e8;">
					</div>
					<div class="eventinformation">
						<div class="information_1">
							<span>2021-11-01 ~ 2021-11-24</span> 
							<div style="    display: inline-block; width: 245px;"></div>
							<span class="eventprice">10000</span>
						</div>
						<div class="information_2">
							<span class="eventtitle_in"><a href="#">슬기로운 데이터 분석 생활</a></span>
						</div>
						<div class="information_3">
							<span><img src="../resources/images/logo.png" alt="" style="width: 35px;height: 25xp;"></span>
							<span>모두의행사?</span>
							<div style= "display: inline-block; width: 240px;">
							</div>
							<span><img src="../resources/images/눈.png"></span>
							<span>15</span>
							<span><img src="../resources/images/찬하트.png" alt="" style="width: 16px; height: 16px;"></span>
						</div>
					</div>
				</div>
				<div class="page_box">
					<div class="page1">
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
			
		</div>
	</div>
	<script type="text/javascript" src="../resources/js/search.js"></script>
<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>