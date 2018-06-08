
$.ajaxSetup({
	headers: {
	    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	}
});


//创建编辑器
var editor = new wangEditor('content');

if(editor.config){
	editor.config.uploadImgUrl = '/article/img/upload';  

	// 自定义 header
	editor.config.uploadHeaders = {
	    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	};

	editor.create();
}


//关注  取消关注
$(".like-button").click(function(e){
	var target = $(e.target);
	var cur_like = target.attr('like-value');
	var user_id = target.attr('like-user');

	if(cur_like == 1){
		$.ajax({
			url: "/user/"+ user_id +"/unfan",
			method: 'POST',
			dataType: 'json',
			data: {},
			success: function(data){
				if(data.error !=0){
					return;
				}
				target.attr('like-value',0);
				target.text("关注");
			}
		})
	}else{
		$.ajax({
			url: "/user/"+ user_id +"/fan",
			method: 'POST',
			dataType: 'json',
			data: {},
			success: function(data){
				if(data.error !=0){
					return;
				}
				target.attr('like-value',1);
				target.text("取消关注");
			}
		})
	}
});