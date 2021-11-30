/**
 * 
 */
console.log("Reply Module........");


var eventService = (function() {
	
	//베스트 행사
	function view(callback, error) {
		$.getJSON("/view/best.json",
				function(data) {
					if (callback) {
						callback(data);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	//이달의 행사
	function monthview(param,callback,error){
		var year = param.year;
		var month = param.month;
		$.getJSON("/view/month/"+year+"/"+month+".json",
				function(data) {
					if (callback) {
						callback(data);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	//일로 검색
	function dayview(param,callback,error){
		var month = param.month;
		var date = param.date;
		$.getJSON("/view/day/"+month+"/"+date+".json",
				function (data) {
					if (callback) {
						callback(data);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	//추천 행사
	function recommend(param,callback,error){
		$.ajax({
			type : 'post',
			url : '/view/recommend',
			data : {'account_Interest':param },
			dataType : 'json',
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}	

	

	return {
		view : view,
		monthview : monthview,
		dayview : dayview,
		recommend : recommend
//		searchlist:searchlist
	};

})();
$(document).ready(function () {
	var slider_div = $('.slider-div');
	var str ="";
	//베스트 행사
	//행사정보랑 좋아요 테이블랑 그 조인해서 status 상태를 보면 알수있짢아 
	//1 누른상태 0 안누른거 
	eventService.view(function(list){
		for(var i=0, len = list.length||0;i<len;i++){
			list[i].e_startDate =moment(list[i].e_startDate).format("YYYY-MM-DD");
			list[i].e_endDate =moment(list[i].e_endDate).format("YYYY-MM-DD");
			str += '<div class="eventbox">'
			str +=	'<div class="eventbox_in">'
	        str +=	 '<div class="eventbox_img">'
	        str +='		<a href=\"/event/eventDetail?e_num='+list[i].e_num+'\">'+'<img src=\"../resources/images/'+list[i].e_fname+'\"'
	        str +=     ' alt="" style="width: 290px; height: 190px; border: 1px solid #333; margin-left: 4px; border-radius: 10px;"></a>'
	        str +=	    '</div>'
	        str +=       '<div class="heart">'
            str +=        '<img src="../resources/images/빈하트.png" alt="" style="width: 16px; height: 16px;">'
            str += 		   '<input type="hidden" name="e_num" value=\"'+list[i].e_num +'\"/>'		
            str +=			'</div>'
            str +=           '<div class="eventbox_context">'
            str +=            '<span>'+list[i].e_startDate+'~'+list[i].e_endDate+'</span>'
            str +=			   '<p class="event_title">'+list[i].e_name+'</p>'
            str +=				'</div>'
            str +=				  '<div class="eventbox_context2">'
            str +=    				'<span class="price">'+list[i].e_price+'원</span>'
            str +=					 '<div class="none"></div>'
            str += 					  '<img class="view" src="../resources/images/눈.png"><span>0</span>'
           
			str +=				        '</div> </div></div>'
		}
		$(slider_div[1]).slick('slickAdd',str);
		
	})
	$(function(){
	    var slider_div = $('.slider-div');
		var str ="";
	    //추천 행사
		var hidden = $("input[name=account_Interest]").val();
		eventService.recommend(hidden,function(list){
			console.log("list :" +list);
			for(var i=0, len = list.length||0;i<len;i++){
				list[i].e_startDate =moment(list[i].e_startDate).format("YYYY-MM-DD");
				list[i].e_endDate =moment(list[i].e_endDate).format("YYYY-MM-DD");
				str += '<div class="eventbox">'
				str +=	'<div class="eventbox_in">'
		        str +=	 '<div class="eventbox_img">'
		        str +='		<a href=\"/event/eventDetail?e_num='+list[i].e_num+'\">'+'<img src=\"../resources/images/'+list[i].e_fname+'\"'
		        str +=     ' alt="" style="width: 290px; height: 190px; border: 1px solid #333; margin-left: 4px; border-radius: 10px;"></a>'
		        str +=	    '</div>'
		        str +=       '<div class="heart">'
	            str +=        '<img src="../resources/images/빈하트.png" alt="" style="width: 16px; height: 16px;">'
	            str +=		   '<input type="hidden" name="e_num" value=\"'+list[i].e_num +'\"/>'
	            str +=			'</div>'
	            str +=           '<div class="eventbox_context">'
	            str +=            '<span>'+list[i].e_startDate+'~'+list[i].e_endDate+'</span>'
	            str +=			   '<p class="event_title">'+list[i].e_name+'</p>'
	            str +=				'</div>'
	            str +=				  '<div class="eventbox_context2">'
	            str +=    				'<span class="price">'+list[i].e_price+'원</span>'
	            str +=					 '<div class="none"></div>'
	            str += 					  '<img class="view" src="../resources/images/눈.png"><span>0</span>'
	            str +=				        '</div> </div></div>'
				
			}	
			$(slider_div[0]).slick('slickAdd',str);
		})
   })
   $(function(){
	   $(document).on('click','.heart',function(){
		    	var account_num =1;
		    	var e_num =$(this).find("input").val();
				$.ajax({
					type : 'post',
					url : '/event/like',
					data : {'account_num':account_num,'e_num':e_num },
					success : function(result, status, xhr) {
						console.log(result)
					},
					error : function(xhr, status, er) {
						
					}
				})
			
	   })
   })
})
