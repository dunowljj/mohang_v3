var statistics = (function(){
	
/*restController에서 /{e_num}을 받아오지 않는경우 => ajax사용
 * 	function getAgeGender(data, callback, error){
		 var e_num = data.e_num;
		 $.ajax({
				type: 'get',
				url: "/eventRest/statisticsListDetail",
				data: {"e_num" :e_num},
				contentType: "application/json; charset=UTF-8",
				success: function(data) {
						if(callback){
							callback(data)
						}
				},
				error: function(jqXHR, textStatus, errorThrown) {
				}
		 });

	 };*/


	 function getAgeGender(data, callback, error){
		 var e_num = data.e_num;
		 
		 $.getJSON("/eventRest/statisticsListDetail/"+e_num+".json",
					function(data) {
						console.log(data);
						if(callback){
							callback(data);
						}
					}).fail(function(xhr, status, err) {
				if (error) {
					error();
				}
			});
	 };
	 
	 //관심사 가져오는 콜백함수 생성
	 function getInterest(data, callback, error){
		 	var e_num = data.e_num;
		 
		 $.getJSON("/eventRest/statisticsListDetail_interest/"+e_num+".json",
					function(data) {
						if(callback){
							callback(data);
						}
					}).fail(function(xhr, status, err) {
				if (error) {
					error();
				}
			});
		 
	
	 };
	 
	 return {
		 getAgeGender: getAgeGender,
		 getInterest : getInterest
	 };
})();


/*$(function(){
	var e_num=$("input[name='e_num']").val();
		console.log(e_num);
		$.getJSON("/eventRest/statisticsListDetail/"+e_num+".json",
				function(data) {
					console.log(data);
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});

});*/



//1. 나이_성별그래프
google.charts.load('current', {'packages':['bar']});

      google.charts.setOnLoadCallback(drawChart1);
     // google.charts.setOnLoadCallback(drawChart2);
      google.charts.setOnLoadCallback(drawChart3);
 

      function drawChart1() {
    	  var e_num=$("input[name='e_num']").val();
    	 

    	statistics.getAgeGender({"e_num":e_num}, function(result){
        			console.log("ajax실행");
        			var ageGenderArr = [['나이', '남', '여']];
        			
        			$.each(result, function(i, item){
        				 var ageGender=[item.age, item.m_count, item.f_count];
        				 ageGenderArr.push(ageGender);
        			 })
        			 console.log("1번차트:"+ageGenderArr);
        			 
        			 
        	        var data = google.visualization.arrayToDataTable(ageGenderArr);

        	        var options = {
        	          chart: {
        	            title: '행사결과_성비',
        	            subtitle: '우리 행사가 어느 나이대의 사람들에게 인기있었는지 알려줍니다. ',
        	          }
        	        };

        	        var chart = new google.charts.Bar(document.getElementById('columnchart_material1'));

        	        chart.draw(data, google.charts.Bar.convertOptions(options));
		
    	})
    	
      }		

      //2. 나이별_별점 그래프
      
      
      
      //3. 관심사 그래프(원형)
      
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart3);

      function drawChart3() {
    	  var e_num=$("input[name='e_num']").val();
    	  statistics.getInterest({"e_num":e_num},function(result){
    		  var interestArr = [['관심인원','항목']];
    		  $.each(result, function(i, item){
    			  var interest = [item.interest, item.count];
    			  interestArr.push(interest);
    		  });
    		  console.log("3번차트:"+interestArr);
    		  
    		  var data = google.visualization.arrayToDataTable(interestArr);

    		  var options = {
    				  title: '행사 참여 고객의 관심 분야',
    				  width: 900, // 넓이 옵션
  					height: 500, // 높이 옵션
    		  };

    		  var chart3 = new google.visualization.PieChart(document.getElementById('columnchart_material3'));

    		  chart3.draw(data, options);
    		  window.addEventListener('resize',drawChart3,false);
    	  	});
      }



      

      