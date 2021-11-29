<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="UTF-8">
<title>모두의행사</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

</head>
<body>
<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>

<div id="mask"></div>
	<div id="searchform">
		<div id="searchform_in">
			<form action="/search/searchform" method="post" id="searchform_form"> 
			<div class="searchform_one">
				<div class="searchtitle">
					개최기간
				</div>
				<div style="width: 530px; height: 30px; float: left;"></div>
				<div class="searchcontext">
					<input type="date" class="input_box" id="e_startdate" name="startDate" value="" > 
				</div>
				<div style="float: left; margin-top: 10px;">
					~
				</div>
				<div class="searchcontext">
					<input type="date" class="input_box" id="e_enddate" name="endDate" value =""> 
				</div>
			</div>
			
			<div class="searchform_one">
				<div class="searchtitle">
					검색 필터
				</div>
				<div style="float: left; width: 800px;height: 30px;"></div>
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
							<input type="radio" id="filter-cost-0" value="사업/창업" class="with-gap" name='field'>
							<label for="filter-cost-0">사업/창업</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="IT/개발" class="with-gap" name='field'>
							<label for="filter-cost-0">IT/개발</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="마케팅/홍보" class="with-gap" name='field'>
							<label for="filter-cost-0">마케팅/홍보</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="디자인/기획" class="with-gap" name='field'>
							<label for="filter-cost-0">디자인/기획</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="문화/예술" class="with-gap" name='field'>
							<label for="filter-cost-0">문화/예술</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="취미/생활" class="with-gap" name='field'>
							<label for="filter-cost-0">취미/생활</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="건강/의료" class="with-gap" name='field'>
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
							<input type="radio" id="filter-cost-0" value="세미나/콘퍼런스" class="with-gap" name='type'>
							<label for="filter-cost-0">세미나/콘퍼런스</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="강의/교육" class="with-gap" name='type'>
							<label for="filter-cost-0">강의/교육</label>
						</div>
						<div>
							<input type="radio" id="filter-cost-0" value="축제/공연" class="with-gap" name='type'>
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
					<input type="hidden" name="field" value="<c:out value='${search.field.replace(","," ")}' />">
					<input type="hidden" name="type" value="${search.type }">
					<input type="hidden" name="price" value="${search.price }">
					<input type="hidden" name="keyword" value="${search.keyword }">
				</div>
			</div>
			</form>
						
			<div class="searchform_one">
				<div class="searchtitle">
					선택된 검색 옵션
				</div>
				
				<c:if test="${!empty search.keyword }">
					<div class="filter-btn" id="keyword1">검색어 :${search.keyword }<i class="far fa-times-circle cursor-pointer"></i></div>
				</c:if>
				<div class="filter-btn" id="field1" style="display: none;">행사 분야 <i class="far fa-times-circle cursor-pointer"></i></div>
				<c:if test="${!empty search.type }">
				<div class="filter-btn" id="type1" ><c:out value='${search.type.replace(","," ")}' /><i class="far fa-times-circle cursor-pointer"></i></div>
				</c:if>
				<c:if test="${!empty search.price }">	
					<div class="filter-btn" id="price1"><c:out value='${search.price.replace(","," ")}' /><i class="far fa-times-circle cursor-pointer"></i></div>
				</c:if>	
				<c:if test="${!empty search.field  }">
					<div class="filter-btn" id="field1"><c:out value='${search.field.replace(","," ")}' /><i class="far fa-times-circle cursor-pointer"></i></div>
				</c:if>
			</div>
			<div class="line"></div>
			<c:choose >
				<c:when test="${!empty search.field  }">
				<div class="eventfieldtitle">${search.field }</div>
				</c:when>
				<c:otherwise>
				<div class="eventfieldtitle">${search.field }</div>
				</c:otherwise>
			</c:choose>
			
			<span class="countevent">${total }개의 행사가 있습니다.</span>
		</div>
	</div>
	<div id="container-box">
		<div id="container">
			<div id="eventtitlebox">
				<span class="eventtitle">행사</span>
				<div class="filter-box">
					<input type="checkbox" name='like' value='like'>좋아요 순 
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
			<c:forEach items="${list}" var ="event">	
				<div class="eventbox_in">
					<div class="eventimg">
						<img src="../resources/images/행사5.jpg" style="height : 200px; width: 357px; border: 1px solid #e8e8e8;">
					</div>
					<div class="eventinformation">
						<div class="information_1">
							<span><fmt:formatDate pattern="yyyy-MM-dd"
									value="${event.e_startDate}" /> ~ 
									<fmt:formatDate pattern="yyyy-MM-dd"
									value="${event.e_endDate}" /></span> 
							<div style="    display: inline-block; width: 245px;"></div>
							<span class="eventprice">${event.e_price }</span>
						</div>
						<div class="information_2">
							<span class="eventtitle_in"><a href="#">${event.e_name }</a></span>
						</div>
						<div class="information_3">
							<span><img src="../resources/images/logo.png" alt="" style="width: 36px;height: 25xp;"></span>
							
							<div style= "display: inline-block; width: 324px;">
							</div>
							<span><img src="../resources/images/눈.png"></span>
							<span>${event.hitcount }</span>
							<span><img src="../resources/images/빈하트.png" alt="" style="width: 16px; height: 16px;"></span>
						</div>
							<input type="hidden" name="e_num" value="${event.e_num }">
					</div>
				 </div>
			   </c:forEach>
			   <div class="page">
				<ul class="pagination">
				   <c:if test="${pageMaker.prev }">
						<li class="page-item "><a class="page-link" href="${pageMaker.search.pageNum -1}">&laquo;</a></li>
				   </c:if>	
				   <c:forEach var="num" begin="${pageMaker.startPage}"
                     end="${pageMaker.endPage}">
                     <li class="page-item  ${pageMaker.search.pageNum == num ? "active":""} " >
                        <a class="page-link" href="${num}">${num}</a>
                     </li>
                   </c:forEach>
                    <c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link" href="${pageMaker.search.pageNum +1 }">&raquo;</a></li>
					</c:if>
				</ul>
			   </div>
		    	<form id='actionForm' action="/search/searchform" method='post'>
					<input type='hidden' name='pageNum' value='${pageMaker.search.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.search.amount}'>
					<input type="hidden" name="field" value="<c:out value='${search.field.replace(","," ")}' />">
					<input type="hidden" name="type" value="${search.type }">
					<input type="hidden" name="price" value="${search.price }">
					<input type="hidden" name="keyword" value="${search.keyword }">
			    </form>
			</div>
		</div>
	</div>
<script>
var actionForm =$("#actionForm");

$(".page-item a").on(
		"click",
		function(e) {

			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']")
					.val($(this).attr("href"));
			actionForm.submit();
		});

</script>	
<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>