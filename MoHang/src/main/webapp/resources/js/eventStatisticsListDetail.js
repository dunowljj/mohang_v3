var statistics = (function(){
   
/*restController에서 /{e_num}을 받아오지 않는경우 => ajax사용
 *    function getAgeGender(data, callback, error){
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
    
    //나이대별 별점 가져오는 함수생성
    function getScope(data, callback, error){
       var e_num = data.e_num;
       $.getJSON(
            "/eventRest/statisticsListDetail_scope/"+e_num+".json",
            function(data){
               if(callback){
                  callback(data);
               }
            }).fail(function(xhr, status, err){
               if(error){
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
       getScope : getScope,
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
      google.charts.setOnLoadCallback(drawChart2);
      google.charts.setOnLoadCallback(drawChart3);
 

      function drawChart1() {
         var e_num=$("input[name='e_num']").val();
        

       statistics.getAgeGender({"e_num":e_num}, function(result){
                 console.log("ajax실행");
                 var ageGenderArr = [['나이', '남', '여']];
              
                 var m10 = 0;
                 var f10 = 0;
                 var m20 = 0;
                 var f20 = 0;
                 var m20 = 0;
                 var f20 = 0;
                 var m30= 0;
                 var f30 = 0;
                 var m40 = 0;
                 var f40 = 0;
                 var m50 = 0;
                 var f50 = 0;
                 var m60 = 0;
                 var f60 = 0;
              
                 
                 $.each(result, function(i, item){
                 if(item.age === "10" || item.age==="0"){
                        m10 += item.m_count;
                          f10 += item.f_count;
                    } else if(item.age === "20"){
                        m20 += item.m_count;
                          f20 += item.f_count;
                    } else if(item.age === "30"){
                        m30 += item.m_count;
                          f30 += item.f_count;
                    }else if(item.age === "40"){
                        m40 += item.m_count;
                          f40 += item.f_count;
                    } else if(item.age === "50"){
                        m50 += item.m_count;
                          f50 += item.f_count;
                    } else if(item.age === "60" || item.age ==="70" ||item.age ==="80" ){
                        m60 += item.m_count;
                          f60 += item.f_count;
                    }
                    
                    /*var ageGender=[item.age, item.m_count, item.f_count];
                     ageGenderArr.push(ageGender);*/
                  })
                  console.log("1번차트:"+ageGenderArr);
                  
                  
                   //var data = google.visualization.arrayToDataTable(ageGenderArr);
                   var data = google.visualization.arrayToDataTable([
                      ['나이', '남', '여'],
                      ["10대",m10, f10],
                      ["20대",m20, f20],
                      ["30대",m30, f30],
                      ["40대",m40, f40],
                      ["50대",m50, f50],
                      ["60대 이상",m60, f60]
       
                   ]);

                   var options = {
                     chart: {
                       title: '행사결과_성비',
                       subtitle: '우리 행사가 어느 나이대의 사람들에게 인기있었는지 알려줍니다. ',
                     }
                   };

                   var chart = new google.charts.Bar(document.getElementById('columnchart_material1'));

                   chart.draw(data, google.charts.Bar.convertOptions(options));
      
       });
       
      }      

      //2. 나이별_별점 그래프
      function drawChart2() {
         var e_num=$("input[name='e_num']").val();
        

       statistics.getScope({"e_num":e_num}, function(result){
                 console.log("ajax실행");
                 console.log('result :'+result)
//                 var scopeArr = [['나이', '평균별점']];
                 var s10 = 0;
                 var s20 = 0;
                 var s30= 0;
                 var s40 = 0;
                 var s50 = 0;
                 var s60 = 0;
              
                 
                 //result를 json({},{}로 불러와서 하나하나 배열에 넣어줌. )
                 $.each(result, function(i, item){
                    if(item.age === "10" || item.age==="0"){
                       s10 += item.review_scope;
                   } else if(item.age === "20"){
                       s20 += item.review_scope;
                   } else if(item.age === "30"){
                       s30 += item.review_scope;
                   }else if(item.age === "40"){
                       s40 += item.review_scope;
                   } else if(item.age === "50"){
                       s50 += item.review_scope;
                   } else if(item.age === "60" || item.age ==="70" ||item.age ==="80" ){
                       s60 += item.review_scope;
                   }
                 /*   var scope=[item.age,item.item.review_scope];
                     scopeArr.push(scope);*/
                 }) 
                  
                  
//                  console.log("2번차트:"+scopeArr);
                  
                   var data = google.visualization.arrayToDataTable([
                	    ['나이', '평균별점', { role: 'style' }],
                        ["10대",s10,"#efc810"],
                        ["20대",s20,"#efc810"],
                        ["30대",s30,"#efc810"],
                        ["40대",s40,"#efc810"],
                        ["50대",s50,"#efc810"],
                        ["60대 이상",s60,"#efc810"]
         
                     ]);

                   var options = {
                     chart: {
                       title: '행사결과_별점',
                       subtitle: '우리 행사가 어느 나이대의 사람들에게 인기있었는지 알려줍니다. ',
                     }
                   };

                   var chart2 = new google.charts.Bar(document.getElementById('columnchart_material2'));

                   chart2.draw(data, google.charts.Bar.convertOptions(options));
      
       });
       
      }      
      
      
      
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



      

      