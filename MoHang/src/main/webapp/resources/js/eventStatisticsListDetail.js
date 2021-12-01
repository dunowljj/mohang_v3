var statistics = (function(){
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
	 
	 return {
		 getAgeGender: getAgeGender
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



//첫번재 그래프 
google.charts.load('current', {'packages':['bar']});

      google.charts.setOnLoadCallback(drawChart1);
      google.charts.setOnLoadCallback(drawChart2);
      google.charts.setOnLoadCallback(drawChart3);
 

      function drawChart1() {
    	 
    	var e_num=$("input[name='e_num']").val();
        var data = google.visualization.arrayToDataTable(
        		
    	statistics.getAgeGender({"e_num":e_num}, function(result){
        			console.log("ajax실행");
        			
        			
        			var ageGenderArr = [['나이','남','여']];
        			
        			$.each(result, function(i, item){
        				var ageGender=[item.age, item.m_count, item.f_count];
        				ageGenderArr.push(ageGender);
        			})
        			console.log(ageGenderArr);
        		})
        /*		[
          ['나이대', '남', '여' ],//하나씩 추가하면 그래프 생성됨. 
          ['10', 20, 30],
          ['20',  20, 50],
          ['30', 20, 30],
          ['40', 20, 30],
          ['50', 20, 30],
          ['60', 20, 30]
        ]*/
        		
        );

        var options = {
          chart: {
            title: '행사결과_성비',
            subtitle: '우리 행사가 어느 나이대의 사람들에게 인기있었는지 알려줍니다. ',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material1'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
//첫번째 그래프 완료
      

//두번째 그래프 
      function drawChart2() {
        var data = google.visualization.arrayToDataTable([
          ['나이대', '남', '여' ],//하나씩 추가하면 그래프 생성됨. 
          ['10', 20, 30],
          ['20',  20, 50],
          ['30', 20, 30],
          ['40', 20, 30],
          ['50', 20, 30],
          ['60', 20, 30]
        ]);

        var options = {
          chart: {
            title: '행사결과_나이대별 별점',
            subtitle: '우리 행사가 어느 나이대의 사람들에게 인기있었는지 알려줍니다. ',
          }
        };

        var chart2 = new google.charts.Bar(document.getElementById('columnchart_material2'));

        chart2.draw(data, google.charts.Bar.convertOptions(options));
      }
      

 //3번째 그래프
      

      