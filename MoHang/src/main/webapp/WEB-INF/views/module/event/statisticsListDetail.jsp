<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="../resources/css/statistics.css" rel="stylesheet">

<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
 <script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/eventStatisticsListDetail.js"
	type="text/javascript"></script>
</head>
<body>
	<div id="container-box1">
		<div id="container">

			<div class="statisticsPage">
				<div class="subTitle">
					<h3>'${endEvent.e_name }' 결과 상세 분석</h3>
				</div>
				<div class="subsubTitle">
					<br>
					<h6>
						종료된 행사들의 결과 분석 통계를 확인 할 수 있습니다.<br> 다음 행사 진행시 참고해 주세요 :)
					</h6>

				</div>

				<div class="result">
					<div class="titleName">
						<h6>
							<b>행사 상세 정보</b>
						</h6>
					</div>

					<div class="rowBox">
						<div class="rowBox1">
							<div class="row">
								<div class="r_title">행사명</div>
								<input type="hidden" name="e_num" value="${endEvent.e_num}">
								<div class="r_content">${endEvent.e_name }</div>
							</div>
							<div class="row">
								<div class="r_title">행사이미지</div>
								<div class="r_content">
									<img alt="" src="../resources/images/${endEvent.e_fname }">
								</div>
							</div>
							<div class="row">
								<div class="r_title">행사상세내용</div>
								<div class="r_content">${endEvent.e_detail }</div>
							</div>
							<div class="row">
								<div class="r_title">행사기간</div>
								<div class="r_content"> ${endEvent.e_startDate } ~ ${endEvent.e_endDate }</div>
							</div>
							<div class="row">
								<div class="r_title">대관장소</div>
								<div class="r_content">${eventHall.eh_name}대여장</div>
							</div>
							<div class="row">
								<div class="r_title">행사유형</div>
								<div class="r_content">${endEvent.e_type }</div>
							</div>
							<div class="row">
								<div class="r_title">가격</div>
								<div class="r_content">${endEvent.e_price }원</div>
							</div>
							<div class="row">
								<div class="r_title">대관장소</div>
								<div class="r_content">${endEvent.eh_num }실</div>
							</div>
						</div>


						<div class="rowBox2">

							<div class="row">
								<div class="r_title">주최자 성함</div>
								<div class="r_content">${endEvent.e_personName }</div>
							</div>

							<div class="row" style="margin-top: 170px">
								<div class="r_title">모집기간</div>
								<div class="r_content">${endEvent.e_startRecruiteDate } ~ ${endEvent.e_endRecruiteDate}</div>
							</div>
							<div class="row" style="margin-top: 40px">
								<div class="r_title">행사분야</div>
								<div class="r_content">${endEvent.e_field }</div>
							</div>
						</div>
					</div>
					<!--행사상세정보-->

					<br>
					<br>
					<div class="titleName">
						<h6>
							<b>결과 분석 통계</b>
						</h6>
					</div>

					<div class="statisticsBox">
						<div class="s_row">
							<div class="s_title">
								우리 행사에 관심있는 고객
							</div>
							<div class="s_content">
								<div class="row">
									<div class="col-sm">조회수 | ${endEvent.e_hitcount } 회</</div>
									<div class="col-sm">좋아요수 |  ${endEvent.e_like } 개</div>
									<div class="col-sm">예약건수 | ${statistics.reservation } 건</div>
									<div class="col-sm">예약율 | ${statistics.ratioReservation} %</div>
									<div class="col-sm">예약취소율 | ${statistics.rationReservationCancel} %</div>
									<div class="col-sm"></div>
								</div>
							</div>
						</div>
						<br>
						<div class="s_row">
							<div class="s_title">고객 연령별 성비</div>
							<div class="s_content" id="columnchart_material1"
								style="width: 800px; height: 500px;"></div>
						</div>
						<div class="s_row">
							<div class="s_title">고객 연령별 별점</div>
							<div class="s_content" id="columnchart_material2"
								style="width: 800px; height: 500px;"></div>
						</div>
						<div class="s_row">
							<div class="s_title">고객의 주 관심사</div>
							<div class="s_content" id="columnchart_material3">adsdsf</div>
						</div>
					</div>
				</div>

				<div class="btnPage">
					<button type="button" class="btn btn-primary btn-sm">엑셀로
						보내기</button>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="/WEB-INF/views/comm/footer.jsp"></jsp:include>
</body>
</html>