<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- slick -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="../resources/css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../resources/css/slick.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/slick-theme.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/slick.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<%@ page import="org.mohang.domain.AccountVO" %>
<%
   AccountVO account = (AccountVO)session.getAttribute("account");
   String check = (String)session.getAttribute("check"); 
	
%>


<!-- 달력 -->
<script type="text/javascript" src="../resources/js/search.js"></script>
<script>
	  $(function() {
         $('.slider-div').slick(
                {
                   infinite : true, //무한 반복 옵션    
                   slidesToShow : 4, // 한 화면에 보여질 컨텐츠 개수
                   slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
                   speed : 100, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
                   arrows : true, // 옆으로 이동하는 화살표 표시 여부
                   dots : true, // 스크롤바 아래 점으로 페이지네이션 여부
                   autoplay : false, // 자동 스크롤 사용 여부
                   autoplaySpeed : 10000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
                   pauseOnHover : true, // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
                   vertical : false, // 세로 방향 슬라이드 옵션

                   prevArrow : "<button type='button' class='slick-prev'>Previous</button>", // 이전 화살표 모양 설정
                   nextArrow : "<button type='button' class='slick-next'>Next</button>", // 다음 화살표 모양 설정

                   draggable : true, //드래그 가능 여부 

                   responsive : [ // 반응형 웹 구현 옵션
                   {
                      breakpoint : 960, //화면 사이즈 960px
                      settings : {
                         //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                         slidesToShow : 3
                      }
                   }, {
                      breakpoint : 768, //화면 사이즈 768px
                      settings : {
                         //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                         slidesToShow : 2
                      }
                   } ]

                });
                
                
      })
      $(function() {
         $('.month_event_box_in').slick(
                {
                   infinite : true, //무한 반복 옵션    
                   slidesToShow : 4, // 한 화면에 보여질 컨텐츠 개수
                   slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
                   speed : 100, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
                   arrows : true, // 옆으로 이동하는 화살표 표시 여부
                   dots : true, // 스크롤바 아래 점으로 페이지네이션 여부
                   autoplay : false, // 자동 스크롤 사용 여부
                   autoplaySpeed : 10000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
                   pauseOnHover : true, // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
                   vertical : false, // 세로 방향 슬라이드 옵션

                   prevArrow : "<button type='button' class='slick-prev'>Previous</button>", // 이전 화살표 모양 설정
                   nextArrow : "<button type='button' class='slick-next'>Next</button>", // 다음 화살표 모양 설정

                   draggable : true, //드래그 가능 여부 

                   responsive : [ // 반응형 웹 구현 옵션
                   {
                      breakpoint : 960, //화면 사이즈 960px
                      settings : {
                         //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                         slidesToShow : 3
                      }
                   }, {
                      breakpoint : 768, //화면 사이즈 768px
                      settings : {
                         //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                         slidesToShow : 2
                      }
                   } ]

                });
                
                
      })
   
      
</script>
<script>
	
	var now = new Date(); // 현재 날짜 및 시간
	var year = now.getFullYear(); // 연도
	var month = now.getMonth() + 1; // 월
	var date = now.getDate(); // 일
	var lastDate = new Date(year, month, 0).getDate();
	
	//두자리인지 한자리인지
	var leadingZeros = function (date, num) {
		 var zero = '';
		 date = date.toString();
		
		 if (date.length < num) {
		  for (i = 0; i < num - date.length; i++)
		   zero += '0';
		 }
		 return zero + date;
	}

   function clickpage(i) {
	   var param =i.split(",");
	   var date =leadingZeros(param[0],2);
	   var month =leadingZeros(param[1],2);
	   var year = param[2];
	   console.log('year'+year);
	   eventService.dayview({date:date,month:month,year:year},function(list){
		 
		  var html = "";
		  if(list.length>8){
		 	  for(var i = 0, len = list.length || 0; i < 8; i++){
		 		  list[i].e_startDate =moment(list[i].e_startDate).format("YYYY-MM-DD");
				  list[i].e_endDate =moment(list[i].e_endDate).format("YYYY-MM-DD");
		 		  html +='<div class="eventbox4">'
				  html +=' <div class="eventbox_in1">'
				  html +='	 <div class="eventbox_img">'
					  html +='		<a href=\"/event/eventDetail?e_num='+list[i].e_num+'\">'+'<img src=\"../resources/images/'+list[i].e_fname+'\" alt=""'
				  html +='			style="width: 290px; height: 190px; border: 1px solid #333; margin-left: 4px; border-radius: 10px;"></a>'
				  html +='	 </div>'
				  html +='<div class="eventbox_context1">'
				  html +='<span>'+list[i].e_startDate+'~'+list[i].e_endDate+'</span>'
				  html +='<p class="event_title">'+list[i].e_name+'</p>'		
				  html += '</div>'
				  html +='<div class="eventbox_context3">'
				  html +='<span class="price">'+list[i].e_price+'원</span>'
				  html +='	 </div></div>'
		 	  }
		  }else if(list.length<=8){
			  for(var i = 0, len = list.length || 0; i < len; i++){
		 		  list[i].e_startDate =moment(list[i].e_startDate).format("YYYY-MM-DD");
				  list[i].e_endDate =moment(list[i].e_endDate).format("YYYY-MM-DD");
		 		  html +='<div class="eventbox4">'
				  html +=' <div class="eventbox_in1">'
				  html +='	 <div class="eventbox_img">'
			      html +='		<a href=\"/event/eventDetail?e_num='+list[i].e_num+'\">'+'<img src=\"../resources/images/'+list[i].e_fname+'\" alt=""'
				  html +='			style="width: 290px; height: 190px; border: 1px solid #333; margin-left: 4px; border-radius: 10px;"></a>'
				  html +='	 </div>'
				  html +='<div class="eventbox_context1">'
				  html +='<span>'+list[i].e_startDate+'~'+list[i].e_endDate+'</span>'
				  html +='<p class="event_title">'+list[i].e_name+'</p>'		
				  html += '</div>'
				  html +='<div class="eventbox_context3">'
				  html +='<span class="price">'+list[i].e_price+'원</span>'
				  html +='	 </div></div>'
		 	  }
		  }else{
			  	  html += '<div>행사일정이 없습니다.</div>'
		  }
	 	  $(".month_event_box_in").html(html);
	   })
       
		  
   }
   
   $(function() {
	 
      if(document.getElementById('month')){
    	  eventService.monthview({year:year,month:month},function(list){
  			
	      document.getElementById("month").innerHTML = '<em>' + year + '년</em>' + '<em>' + month + '월</em>';
	           
	      document.getElementById("day").innerHTML = html;
	    
	      var html = '<ul>';
	      for (var i = 1; i <= lastDate; i++) {
	    	 i= leadingZeros(i,2);
	         html +="<li><a href=\"javascript: clickpage(\'"+i+","+month+","+year+"\')\"  class=\"on"+i+"\">"+i+"</a></li>";
	      }
	     
	      html += '</ul>';
	      document.getElementById("day").innerHTML = html;
	      html = '';
	      
	      for (var j = 0, len = list.length || 0; j < len; j++) {
		    	 list[j].e_startDate =moment(list[j].e_startDate).format("YYYY-MM-DD");
		    	 list[j].e_endDate =moment(list[j].e_endDate).format("YYYY-MM-DD");
		    	 var startMonth =list[j].e_startDate.substring(5,7);
		    	 var endMonth = list[j].e_endDate.substring(5,7);
		    	 console.log('startMonth:'+startMonth);
		    	 console.log('endMonth:'+endMonth);
		    	 var startdate= list[j].e_startDate.substring(8,10);
		    	 var enddate = list[j].e_endDate.substring(8,10);
		    	 if(startMonth<month ){
		    		 startdate= 0;
		    	 }
		    	 if(month<endMonth){
		    		 enddate= lastDate;
		    	 }

		    	 for(var i=startdate;i<=enddate;i++){
		    		 i = leadingZeros(i,2);
		    		 $('#day ul li .on'+i).attr('class','active')
		    	 }

		  }
 		  var html = "";
 		  if(list.length>8){
		 	  for(var i = 0, len = list.length || 0; i < 8; i++){
		 		  list[i].e_startDate =moment(list[i].e_startDate).format("YYYY-MM-DD");
				  list[i].e_endDate =moment(list[i].e_endDate).format("YYYY-MM-DD");
		 		  html +='<div class="eventbox4">'
				  html +=' <div class="eventbox_in1">'
				  html +='	 <div class="eventbox_img">'
				  html +='		<a href=\"/event/eventDetail?e_num='+list[i].e_num+'\">'+'<img src=\"../resources/images/'+list[i].e_fname+'\" alt=""'
				  html +='			style="width: 290px; height: 190px; border: 1px solid #333; margin-left: 4px; border-radius: 10px;"></a>'
				  html +='	 </div>'
				  html +='<div class="eventbox_context1">'
				  html +='<span>'+list[i].e_startDate+'~'+list[i].e_endDate+'</span>'
				  html +='<p class="event_title">'+list[i].e_name+'</p>'		
				  html += '</div>'
				  html +='<div class="eventbox_context3">'
				  html +='<span class="price">'+list[i].e_price+'원</span>'
				  html +='	 </div></div>'
					 
		 	  }
 		  }else if(list.length<=8){
 			 for(var i = 0, len = list.length || 0; i < len; i++){
		 		  list[i].e_startDate =moment(list[i].e_startDate).format("YYYY-MM-DD");
				  list[i].e_endDate =moment(list[i].e_endDate).format("YYYY-MM-DD");
		 		  html +='<div class="eventbox4">'
				  html +=' <div class="eventbox_in1">'
				  html +='	 <div class="eventbox_img">'
				  html +='		<a href=\"/event/eventDetail?e_num='+list[i].e_num+'\">'+'<img src=\"../resources/images/'+list[i].e_fname+'\" alt=""'
				  html +='			style="width: 290px; height: 190px; border: 1px solid #333; margin-left: 4px; border-radius: 10px;"></a>'
				  html +='	 </div>'
				  html +='<div class="eventbox_context1">'
				  html +='<span>'+list[i].e_startDate+'~'+list[i].e_endDate+'</span>'
				  html +='<p class="event_title">'+list[i].e_name+'</p>'		
				  html += '</div>'
				  html +='<div class="eventbox_context3">'
				  html +='<span class="price">'+list[i].e_price+'원</span>'
				  html +='	 </div></div>'
		 	  }
 		  }else{
			  	  html += '<div>행사일정이 없습니다.</div>'
		  }
	 	  $(".month_event_box_in").html(html);
      })
      $('input[name=year]').val(year);
      $('input[name=month]').val(month);
      $('#year_prev').click(function() {
       	
       	 $('#day').after("<div class='slider-div'></div>")
            if (month == 1) {
               month = 13;
               year = year - 1;
            }
            month = month - 1;
            eventService.monthview({year:year,month:month},function(list){
           	
             document.getElementById("month").innerHTML = '<em>'
                   + year + '년</em>' + '<em>' + month
                   + '월</em>';
             lastDate = new Date(year, month, 0).getDate();
             document.getElementById("day").innerHTML = html;
             var html = '<ul>';
             for (var i = 1; i <= lastDate; i++) {
    	    	 i= leadingZeros(i,2);
    	         html +="<li><a href=\"javascript: clickpage(\'"+i+","+month+","+year+"\')\"  class=\"on"+i+"\">"+i+"</a></li>";
    	      }
	   	     
	   	     html += '</ul>';
	   	     document.getElementById("day").innerHTML = html;
             html = '';
             for (var j = 0, len = list.length || 0; j < len; j++) {
		    	 list[j].e_startDate =moment(list[j].e_startDate).format("YYYY-MM-DD");
		    	 list[j].e_endDate =moment(list[j].e_endDate).format("YYYY-MM-DD");
		    	 var startMonth =list[j].e_startDate.substring(5,7);
		    	 var endMonth = list[j].e_endDate.substring(5,7);
		    	 console.log('startMonth:'+startMonth);
		    	 console.log('endMonth:'+endMonth);
		    	 var startdate= list[j].e_startDate.substring(8,10);
		    	 var enddate = list[j].e_endDate.substring(8,10);
		    	 if(startMonth<month ){
		    		 startdate= 0;
		    	 }
		    	 if(month<endMonth){
		    		 enddate= lastDate;
		    	 }

		    	 for(var i=startdate;i<=enddate;i++){
		    		 i = leadingZeros(i,2);
		    		 $('#day ul li .on'+i).attr('class','active')
		    	 }

		  }
             var html = "";
             if(list.length>8){
		   	 	 for(var i = 0, len = list.length || 0; i < 8; i++){
		   	 		  list[i].e_startDate =moment(list[i].e_startDate).format("YYYY-MM-DD");
		   			  list[i].e_endDate =moment(list[i].e_endDate).format("YYYY-MM-DD");
		   	 		  html +='<div class="eventbox4">'
		   			  html +=' <div class="eventbox_in1">'
		   			  html +='	 <div class="eventbox_img">'
		   		      html +='		<a href=\"/event/eventDetail?e_num='+list[i].e_num+'\">'+'<img src=\"../resources/images/'+list[i].e_fname+'\" alt=""'
		   			  html +='			style="width: 290px; height: 190px; border: 1px solid #333; margin-left: 4px; border-radius: 10px;"></a>'
		   			  html +='	 </div>'
		   			  html +='<div class="eventbox_context1">'
		   			  html +='<span>'+list[i].e_startDate+'~'+list[i].e_endDate+'</span>'
		   			  html +='<p class="event_title">'+list[i].e_name+'</p>'		
		   			  html += '</div>'
		   			  html +='<div class="eventbox_context3">'
		   			  html +='<span class="price">'+list[i].e_price+'원</span>'
		   			  html +='	 </div></div>'
		   	 	 }
             }else if(list.length<=8){
            	 for(var i = 0, len = list.length || 0; i < len; i++){
		   	 		  list[i].e_startDate =moment(list[i].e_startDate).format("YYYY-MM-DD");
		   			  list[i].e_endDate =moment(list[i].e_endDate).format("YYYY-MM-DD");
		   	 		  html +='<div class="eventbox4">'
		   			  html +=' <div class="eventbox_in1">'
		   			  html +='	 <div class="eventbox_img">'
		   		      html +='		<a href=\"/event/eventDetail?e_num='+list[i].e_num+'\">'+'<img src=\"../resources/images/'+list[i].e_fname+'\" alt=""'
		   			  html +='			style="width: 290px; height: 190px; border: 1px solid #333; margin-left: 4px; border-radius: 10px;"></a>'
		   			  html +='	 </div>'
		   			  html +='<div class="eventbox_context1">'
		   			  html +='<span>'+list[i].e_startDate+'~'+list[i].e_endDate+'</span>'
		   			  html +='<p class="event_title">'+list[i].e_name+'</p>'		
		   			  html += '</div>'
		   			  html +='<div class="eventbox_context3">'
		   			  html +='<span class="price">'+list[i].e_price+'원</span>'
		   			  html +='	 </div></div>'
		   	 	 }
             }else{
            	 	  html += '<div>행사일정이 없습니다.</div>'
   		 	 }
	   	 	 $(".month_event_box_in").html(html);
             $('input[name=year]').val(year);
             $('input[name=month]').val(month);
             
            })
	  })
      $('#year_next').click(
    		  	  
                  function() {
                     if (month == 12) {
                        month = 0;
                        year = year + 1;
                     }
                     month = month + 1;
                     eventService.monthview({year:year,month:month},function(list){
	                     document.getElementById("month").innerHTML = '<em>'
	                           + year + '년</em>' + '<em>' + month
	                           + '월</em>';
	                     lastDate = new Date(year, month, 0).getDate();
	                     document.getElementById("day").innerHTML = html;
	                     var html = '<ul>';
	                     for (var i = 1; i <= lastDate; i++) {
	            	    	 i= leadingZeros(i,2);
	            	         html +="<li><a href=\"javascript: clickpage(\'"+i+","+month+","+year+"\')\"  class=\"on"+i+"\">"+i+"</a></li>";
	            	     }
		           	     
		           	     html += '</ul>';
		           	     document.getElementById("day").innerHTML = html;
	                     html = '';
	                     for (var j = 0, len = list.length || 0; j < len; j++) {
	                    	 list[j].e_startDate =moment(list[j].e_startDate).format("YYYY-MM-DD");
	        		    	 list[j].e_endDate =moment(list[j].e_endDate).format("YYYY-MM-DD");
	        		    	 var startMonth =list[j].e_startDate.substring(5,7);
	        		    	 var endMonth = list[j].e_endDate.substring(5,7);
	        		    	 console.log('startMonth:'+startMonth);
	        		    	 console.log('endMonth:'+endMonth);
	        		    	 var startdate= list[j].e_startDate.substring(8,10);
	        		    	 var enddate = list[j].e_endDate.substring(8,10);
	        		    	 if(startMonth<month ){
	        		    		 startdate= 0;
	        		    	 }
	        		    	 if(month<endMonth){
	        		    		 enddate= lastDate;
	        		    	 }
	        		    	 for(var i=startdate;i<=enddate;i++){
	        		    		 i = leadingZeros(i,2);
	        		    		 $('#day ul li .on'+i).attr('class','active')
	        		    	 }

	        			 }
	                     var html = "";
	                     if(list.length>8){
	        		   	 	 for(var i = 0, len = list.length || 0; i < 8; i++){
	        		   	 		  list[i].e_startDate =moment(list[i].e_startDate).format("YYYY-MM-DD");
	        		   			  list[i].e_endDate =moment(list[i].e_endDate).format("YYYY-MM-DD");
	        		   	 		  html +='<div class="eventbox4">'
	        		   			  html +=' <div class="eventbox_in1">'
	        		   			  html +='	 <div class="eventbox_img">'
	        		   		      html +='		<a href=\"/event/eventDetail?e_num='+list[i].e_num+'\">'+'<img src=\"../resources/images/'+list[i].e_fname+'\" alt=""'
	        		   			  html +='			style="width: 290px; height: 190px; border: 1px solid #333; margin-left: 4px; border-radius: 10px;"></a>'
	        		   			  html +='	 </div>'
	        		   			  html +='<div class="eventbox_context1">'
	        		   			  html +='<span>'+list[i].e_startDate+'~'+list[i].e_endDate+'</span>'
	        		   			  html +='<p class="event_title">'+list[i].e_name+'</p>'		
	        		   			  html += '</div>'
	        		   			  html +='<div class="eventbox_context3">'
	        		   			  html +='<span class="price">'+list[i].e_price+'원</span>'
	        		   			  html +='	 </div></div>'
	        		   	 	 }
	                     }else if(list.length<=8){
	                    	 for(var i = 0, len = list.length || 0; i < len; i++){
	        		   	 		  list[i].e_startDate =moment(list[i].e_startDate).format("YYYY-MM-DD");
	        		   			  list[i].e_endDate =moment(list[i].e_endDate).format("YYYY-MM-DD");
	        		   	 		  html +='<div class="eventbox4">'
	        		   			  html +=' <div class="eventbox_in1">'
	        		   			  html +='	 <div class="eventbox_img">'
	        		   		      html +='		<a href=\"/event/eventDetail?e_num='+list[i].e_num+'\">'+'<img src=\"../resources/images/'+list[i].e_fname+'\" alt=""'
	        		   			  html +='			style="width: 290px; height: 190px; border: 1px solid #333; margin-left: 4px; border-radius: 10px;"></a>'
	        		   			  html +='	 </div>'
	        		   			  html +='<div class="eventbox_context1">'
	        		   			  html +='<span>'+list[i].e_startDate+'~'+list[i].e_endDate+'</span>'
	        		   			  html +='<p class="event_title">'+list[i].e_name+'</p>'		
	        		   			  html += '</div>'
	        		   			  html +='<div class="eventbox_context3">'
	        		   			  html +='<span class="price">'+list[i].e_price+'원</span>'
	        		   			  html +='	 </div></div>'
	        		   	 	 }
	                     }else{
	                    		  html += '<div>행사일정이 없습니다.</div>'
	           			  }
	        	   	 	 $(".month_event_box_in").html(html);
	                     $('input[name=year]').val(year);
	                     $('input[name=month]').val(month);
                     })  
                  })
   
      }
   })
 
  
  </script>


<!-- slick end -->
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg text-uppercase fixed-top bg-secondary"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="/Main"><img
				src="../resources/images/logo.png"
				style="width:  190px; height: 80p; background: black;"></a>
			<form method="post" action="/search/searchform" id="event-search">
				    <input class="eventus-input" id="einput" type="search" name="keyword">
					<input type="hidden" name="field" value="<c:out value='${search.field.replace(","," ")}' />">
					<input type="hidden" name="type" value="${search.type }">
					<input type="hidden" name="price" value="${search.price }">
					<input type="hidden" name="keyword" value="${search.keyword }">
			</form>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="nav-eventbar">
					<c:if test="${account != null}">
						<% if(check.equals("true")){ %>
							<li><a href="/organization/applyForm">단체정보신청</a></li>
							<li><a href="/event/listApply">신청 리스트확인</a></li>
						<%}else{ %>
							<li><a href="organization/getOrganization">단체정보수정</a></li>
							<li><a href="/event/listApply">신청 리스트확인</a></li>
						<%} %>
					</c:if>
				</ul>
				
				<c:if test="${account != null}">
				<% if(check.equals("false")){ %>
				<div id="pro_box">
					<a href="#"><img src="../resources/images/프로필.png"></a>
					<div class="button">
						<img src="../resources/images/button.png">
					</div>
					<div id="myPage1" style="display: none">
						<ul>
							<li><a href="/general/listLikes">관심있는 행사</a></li>
							<li><a href="/event/toinsertForm">행사 신청</a></li>
							<li><a href="/event/listApply">my 행사 리스트</a></li>
							<li><a href="/event/listStatistics">결과 분석 그래프</a></li>
							<li><a href="#">1:1 채팅</a></li>
							<li><a href="/general/reservationList">예약확인</a></li>
							<li><a href="/general/listMyPartIn">리뷰 작성 및 확인</a></li>
							<li><a href="/general/updateInformation">회원 정보 수정</a></li>
						</ul>
					</div>
				</div>
				<%}else{ %>
				<div id="pro_box">
					<a href="#"><img src="../resources/images/프로필.png"></a>
					<div class="button">
						<img src="../resources/images/button.png">
					</div>
					<div id="myPage1" style="display: none">
						<ul>
							<li><a href="/general/listLikes">관심있는 행사</a></li>
							<li><a href="/organization/applyForm">단체 정보 신청</a></li>
							<li><a href="#">1:1 채팅</a></li>
							<li><a href="/general/reservationList">예약확인</a></li>
							<li><a href="/MoHang/general/reviewList.do">리뷰 작성 및 확인</a></li>
							<li><a href="/general/updateInformation">회원 정보 수정</a></li>
						</ul>
					</div>
				</div>
				
				
				<%} %>
				</c:if>
				
				<ul class="nav-loginbar">
				
					<!-- 로그인 x -->
					<c:if test="${account == null}">
						<li><a href="/login/login">로그인</a></li>
						<li><a href="/login/join">회원가입</a></li>
					</c:if>
					
					<!-- 로그인o -->
					<c:if test="${account != null}">
						<div class="login_success_area">
                        	<span>${account.account_name}님 반갑습니다</span>
                        	<span>마일리지 : ${account.account_mileage}원</span>
                        	<span onclick="location.href='/login/logout'" style="color: #ff0000">로그아웃</span>	
                        	<c:if test="${account.account_id == 'admin'}">
								<span><a href="/admin/mohang">관리자 페이지</a></span>
							</c:if>
                    	</div>	
					</c:if>
					
				</ul>


			</div>

		</div>
	</nav>
	<!-- <script src="../jquery-ui-1.12.1/datepicker-ko.js"></script> -->
	<script type="text/javascript">
//마이페이지 다운 이벤트
$(document).click(function(e) {
   
   if($(e.target).attr('src')!='../resources/images/button.png'){
      $("#myPage1").css('display','none');
   }
   if($(e.target).attr('src')=='../resources/images/button.png'){
      $("#myPage1").toggle();
   }
})
 var inputs = $('input[type="hidden"]');
  $("#event-search").on('submit',function(){
		  $(inputs[3]).val("");
		  $(inputs[9]).val("");
		  $(inputs[18]).val("");
	  
  })
</script>
