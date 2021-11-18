
//데이트피커_한글설정 및 기간설정
$(function() {
        $("#datepicker1").datepicker();
    });
    
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
      });

    $(function() { 
        //오늘 날짜를 출력
        $("#today").text(new Date().toLocaleDateString());

        //datepicker 한국어로 사용하기 위한 언어설정
        $.datepicker.setDefaults($.datepicker.regional['ko']); 
        
        // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
        // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

        //시작일.
        $('#fromDate').datepicker({
            showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
            buttonImage: "../resources/images/calendar.png", // 버튼 이미지
            buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
            buttonText: "날짜선택",             // 버튼의 대체 텍스트
            dateFormat: "yy-mm-dd",             // 날짜의 형식
            changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
            
            minDate:7 ,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가) 잠깐 나 이거 일주일 뒤로 선택하고 싶은데 
            onClose: function( selectedDate ) {    
                // 시작일(fromDate) datepicker가 닫힐때
                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#toDate").datepicker( "option", "minDate", selectedDate );
            }                
        });

        //종료일
        $('#toDate').datepicker({
            showOn: "both", 
            buttonImage:"../resources/images/calendar.png", 
            buttonImageOnly : true,
            buttonText: "날짜선택",
            dateFormat: "yy-mm-dd",
            changeMonth: true,
            minDate: 0, // 오늘 이전 날짜 선택 불가
            onClose: function( selectedDate ) {
                // 종료일(toDate) datepicker가 닫힐때
                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#fromDate").datepicker( "option", "maxDate", selectedDate );
                $("#recruiteToDate").datepicker( "option", "maxDate", selectedDate );
            }                
        });
        
        
        //모집시작일.
        $('#recruiteFromDate').datepicker({
            showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
            buttonImage: "../resources/images/calendar.png", // 버튼 이미지
            buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
            buttonText: "날짜선택",             // 버튼의 대체 텍스트
            dateFormat: "yy-mm-dd",             // 날짜의 형식
            changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
            minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
            onClose: function( selectedDate ) {    
                // 시작일(fromDate) datepicker가 닫힐때
                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#toDate").datepicker( "option", "minDate", selectedDate );
            }                
        });
        
        //모집종료일
        $('#recruiteToDate').datepicker({
            showOn: "both", 
            buttonImage:"../resources/images/calendar.png", 
            buttonImageOnly : true,
            buttonText: "날짜선택",
            dateFormat: "yy-mm-dd",
            changeMonth: true,
            minDate: 0, // 오늘 이전 날짜 선택 불가
            onClose: function( selectedDate ) {
                // 종료일(toDate) datepicker가 닫힐때
                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#fromDate").datepicker( "option", "maxDate", selectedDate );
            }                
        });  
        
        
    });
    
    //무료클릭시 값 0 으로 바뀌는 자스문
    $(document).ready(function(){
    	$("#e_priceCheck").change(function(){
    		if($("#e_priceCheck").is(":checked")){
    			$("#e_priceSmall").val("0")
    		}
    	});
    });
    
    //무료클릭시 0으로 바뀌고 + 비활성화되게하는거. 
    function checkDisable(frm)
    {
        if( frm.e_priceCheck.checked == true ){
    	   frm.e_priceSmall.disabled = true;
    	} else {
    	   frm.e_priceSmall.disabled = false;
    	}
    }
    
    
    
    //행사대표이미지 미리보기
    	openFile = function(event) { 
    		var input = event.target;
    		var reader = new FileReader();
    		reader.onload = function(){ 
    			var dataURL = reader.result; 
    			var titleImage = document.getElementById('titleImage'); 
    			titleImage.src = dataURL;
    		}; 
    		reader.readAsDataURL(input.files[0]); 
    	};
    
    //행사상세이미지	
    	openFile2 = function(event) { 
    		var input2 = event.target;
    		var reader2 = new FileReader();
    		reader2.onload = function(){ 
    			var dataURL2 = reader2.result; 
    			var contentImage2 = document.getElementById('contentImage'); 
    			contentImage2.src = dataURL2;
    		}; 
    		reader2.readAsDataURL(input2.files[0]); 
    	};
    	
    

    
    
    

    

