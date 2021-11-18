<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="../resources/css/statistics.css" rel="stylesheet">

<jsp:include page="/WEB-INF/views/comm/header.jsp"></jsp:include>
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
					<h3>'${event.e_name }' 결과 상세 분석</h3>
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
								<div class="r_content">${event.o_name }adsdsf</div>
							</div>
							<div class="row">
								<div class="r_title">행사이미지</div>
								<div class="r_content">
									<img alt="" src="../resources/images/모행.png">이거 어케 연결시키지흠
								</div>
							</div>
							<div class="row">
								<div class="r_title">행사상세내용</div>
								<div class="r_content">${event.o_name }adsdsf</div>
							</div>
							<div class="row">
								<div class="r_title">행사기간</div>
								<div class="r_content">${event.o_name }adsdsf</div>
							</div>
							<div class="row">
								<div class="r_title">대관장소</div>
								<div class="r_content">${event.o_name }adsdsf</div>
							</div>
							<div class="row">
								<div class="r_title">행사유형</div>
								<div class="r_content">${event.o_name }adsdsf</div>
							</div>
							<div class="row">
								<div class="r_title">가격</div>
								<div class="r_content">${event.o_name }adsdsf원</div>
							</div>
							<div class="row">
								<div class="r_title">대관장소</div>
								<div class="r_content">${event.o_name }adsdsf실</div>
							</div>
						</div>


						<div class="rowBox2">

							<div class="row">
								<div class="r_title">주최자 성함</div>
								<div class="r_content">${event.o_name }adsdsf</div>
							</div>

							<div class="row" style="margin-top: 170px">
								<div class="r_title">모집기간</div>
								<div class="r_content">${event.o_name }adsdsf</div>
							</div>
							<div class="row" style="margin-top: 40px">
								<div class="r_title">행사분야</div>
								<div class="r_content">${event.o_name }adsdsf</div>
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
								우리 행사에 <br>관심있는 고객
							</div>
							<div class="s_content">
								<div class="row">
									<div class="col-sm">조회수 |</div>
									<div class="col-sm">좋아요수 |</div>
									<div class="col-sm">예약건수 |</div>
								</div>
								<div class="row">
									<div class="col-sm">예약율 |</div>
									<div class="col-sm">예약취소율 |</div>
									<div class="col-sm"></div>
								</div>
							</div>
						</div>

						<div class="s_row">
							<div class="s_title">고객 연령별 성비</div>
							<div class="s_content" id="columnchart_material"
								style="width: 800px; height: 500px;"></div>
						</div>
						<div class="s_row">
							<div class="s_title">고객 연령별 별점</div>
							<div class="s_content" id="columnchart_material"
								style="width: 800px; height: 500px;"></div>
						</div>
						<div class="s_row">
							<div class="s_title">고객의 주 관심사</div>
							<div class="s_content">${event.o_name }adsdsf</div>
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