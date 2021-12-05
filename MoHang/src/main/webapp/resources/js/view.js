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
		var year = param.year;
		$.getJSON("/view/day/"+month+"/"+date+"/"+year+".json",
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
	function recommend(callback,error){
		$.ajax({
			type : 'post',
			url : '/view/recommend',
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
$(document).ready(function () {
	var slider_div = $('.slider-div');
	var str ="";
	var now = new Date(); // 현재 날짜 및 시간
	var year = now.getFullYear(); // 연도
	var month = now.getMonth() + 1; // 월
	var date = now.getDate(); // 일
	date = leadingZeros(date,2);
	var nowdate = year+"-"+month+"-"+date;
	

	//베스트 행사
	//행사정보랑 좋아요 테이블랑 그 조인해서 status 상태를 보면 알수있짢아 
	//1 누른상태 0 안누른거 
	eventService.view(function(list){
		for(var i=0, len = list.length||0;i<len;i++){
			list[i].list.e_startDate =moment(list[i].list.e_startDate).format("YYYY-MM-DD");
			list[i].list.e_endDate =moment(list[i].list.e_endDate).format("YYYY-MM-DD");
			console.log('nowdate:'+nowdate);
			if(nowdate<list[i].list.e_endDate){
					str += '<div class="eventbox">'
					str +=	'<div class="eventbox_in">'
			        str +=	 '<div class="eventbox_img">'
			        str +='		<a href=\"/event/eventDetail?e_num='+list[i].list.e_num+'\">'+'<img src=\"../resources/images/'+list[i].list.e_fname+'\"'
			        str +=     ' alt="" style="width: 290px; height: 190px; border: 1px solid #333; margin-left: 4px; border-radius: 10px;"></a>'
			        str +=	    '</div>'
		        //status 0
	        	if(list[i].likedVO.account_num!=0&&list[i].likedVO.like_status==0){
			        str +=       '<div class="heart">'
		            str +=        '<img src="../resources/images/빈하트.png" alt="" style="width: 16px; height: 16px;">'
		            str += 		   '<input type="hidden" name="e_num" value=\"'+list[i].list.e_num +'\"/>'		
		            str += 		   '<input type="hidden" name="like_status" value=\"'+list[i].likedVO.like_status +'\"/>'		
		            str +=			'</div>'
	        	}
		        
	        	//status 1
				
				if(list[i].likedVO.account_num!=0&&list[i].likedVO.like_status==1){
		        	str +=       '<div class="heart">'
		            str +=        '<img src="../resources/images/찬하트.png" alt="" style="width: 16px; height: 16px;">'
		            str += 		   '<input type="hidden" name="e_num" value=\"'+list[i].list.e_num +'\"/>'		
		            str += 		   '<input type="hidden" name="like_status" value=\"'+list[i].likedVO.like_status +'\"/>'		
		            str +=			'</div>'	
				}		
		            str +=           '<div class="eventbox_context">'
		            str +=            '<span>'+list[i].list.e_startDate+'~'+list[i].list.e_endDate+'</span>'
		            str +=			   '<p class="event_title">'+list[i].list.e_name+'</p>'
		            str +=				'</div>'
		            str +=				  '<div class="eventbox_context2">'
		            str +=    				'<span class="price">'+list[i].list.e_price+'원</span>'
		            str +=					 '<div class="none"></div>'
		            str += 					  '<img class="view" src="../resources/images/눈.png"><span>'+list[i].list.e_hitcount+'</span>'
					str +=				        '</div> </div></div>'
			}
		}
		$(slider_div[1]).slick('slickAdd',str);
		
	})
	$(function(){
	    var slider_div = $('.slider-div');
		var str ="";
	    //추천 행사
		eventService.recommend(function(list){
			for(var i=0, len = list.length||0;i<len;i++){
				list[i].list.e_startDate =moment(list[i].list.e_startDate).format("YYYY-MM-DD");
				list[i].list.e_endDate =moment(list[i].list.e_endDate).format("YYYY-MM-DD");
				if(nowdate<list[i].list.e_endDate){
						str += '<div class="eventbox">'
						str +=	'<div class="eventbox_in">'
				        str +=	 '<div class="eventbox_img">'
				        str +='		<a href=\"/event/eventDetail?e_num='+list[i].list.e_num+'\">'+'<img src=\"../resources/images/'+list[i].list.e_fname+'\"'
				        str +=     ' alt="" style="width: 290px; height: 190px; border: 1px solid #333; margin-left: 4px; border-radius: 10px;"></a>'
				        str +=	    '</div>'
		        //status 0
				    if(list[i].likedVO.account_num!=0&&list[i].likedVO.like_status==0){
				        str +=       '<div class="heart">'
			            str +=        '<img src="../resources/images/빈하트.png" alt="" style="width: 16px; height: 16px;">'
			            str += 		   '<input type="hidden" name="e_num" value=\"'+list[i].list.e_num +'\"/>'		
			            str += 		   '<input type="hidden" name="like_status" value=\"'+list[i].likedVO.like_status +'\"/>'		
			            str +=			'</div>'
		            }
		        
	        	//status 1
				    if(list[i].likedVO.account_num!=0&&list[i].likedVO.like_status==1){
			        	str +=       '<div class="heart">'
			            str +=        '<img src="../resources/images/찬하트.png" alt="" style="width: 16px; height: 16px;">'
			            str += 		   '<input type="hidden" name="e_num" value=\"'+list[i].list.e_num +'\"/>'		
			            str += 		   '<input type="hidden" name="like_status" value=\"'+list[i].likedVO.like_status +'\"/>'		
			            str +=			'</div>'	
				    }
			 	
			            str +=           '<div class="eventbox_context">'
			            str +=            '<span>'+list[i].list.e_startDate+'~'+list[i].list.e_endDate+'</span>'
			            str +=			   '<p class="event_title">'+list[i].list.e_name+'</p>'
			            str +=				'</div>'
			            str +=				  '<div class="eventbox_context2">'
			            str +=    				'<span class="price">'+list[i].list.e_price+'원</span>'
			            str +=					 '<div class="none"></div>'
			            str += 					  '<img class="view" src="../resources/images/눈.png"><span>'+list[i].list.e_hitcount+'</span>'
						str +=				        '</div> </div></div>'
				    }
			}
			$(slider_div[0]).slick('slickAdd',str);
		})
   })
   $(function(){
	   $(document).on('click','.heart',function(){
		   	
		    	var e_num =$(this).find("input").val();
		    	var like_status =$(this).find("input").next().val();
		    	console.log('test :'+like_status)
				$.ajax({
					type : 'post',
					url : '/event/like',
					data : {'e_num':e_num },
					success : function(result, status, xhr) {
						location.reload();
					},
					error : function(xhr, status, er) {
						
					}
				})
			
	   })
   })

})
