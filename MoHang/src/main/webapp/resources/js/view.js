/**
 * 
 */
console.log("Reply Module........");


var eventService = (function() {
	
	//베스트 행사
	function view(callback, error) {
		$.getJSON("/view/list.json",
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
		
		
	
	

	return {
		view : view,
		monthview : monthview,
		dayview : dayview
	};

})();
$(document).ready(function () {
	var slider_div = $('.slider-div');
	var str ="";
	eventService.view(function(list){
		for(var i=0, len = list.length||0;i<len;i++){
			list[i].e_startDate =moment(list[i].e_startDate).format("YYYY-MM-DD");
			list[i].e_endDate =moment(list[i].e_endDate).format("YYYY-MM-DD");
			str += '<div class="eventbox">'
			str +=	'<div class="eventbox_in">'
	        str +=	 '<div class="eventbox_img">'
	        str +=    '<a href="#"><img src="../resources/images/'+list[i].e_fname+'"'
	        str +=     ' alt="" style="width: 290px; height: 190px; border: 1px solid #333; margin-left: 4px; border-radius: 10px;"></a>'
	        str +=	    '</div>'
	        str +=       '<div class="heart">'
            str +=        '<img src="../resources/images/빈하트.png" alt="" style="width: 16px; height: 16px;">'
            str +=			'</div>'
            str +=           '<div class="eventbox_context">'
            str +=            '<span>'+list[i].e_startDate+'~'+list[i].e_endDate+'</span>'
            str +=			   '<p class="event_title">'+list[i].e_name+'</p>'
            str +=				'</div>'
            str +=				  '<div class="eventbox_context2">'
            str +=    				'<span class="price">'+list[i].e_price+'원</span>'
            str +=					 '<div class="none"></div>'
            str += 					  '<img class="view" src="../resources/images/눈.png"><span>0</span>'
			str +=				       '</div> </div></div>'
		}
		$(slider_div[1]).slick('slickAdd',str);
		
	})
	
})
