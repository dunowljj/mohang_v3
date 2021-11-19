/**
 * 
 */
var eventService = (function () {
	function view(callback ,error) {
		$.getJSON("/view/list",
		function(data) {
			callback(data);
		}).fail(function(xhr,status,err) {
			if(error){
				error();
			}
		})
	}
	
	return {
		view : view
	};
})();

eventService.view(function(list){
	
})