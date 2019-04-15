//设置落叶参数
$(function(){
	$.fn.snow({ 
		minSize: 5,		//落叶的最小尺寸
		maxSize: 50, 	//落叶的最大尺寸
		newOn: 3000		//落叶出现的频率 这个数值越小落叶越多
	});
});
(function($){
	
	$.fn.snow = function(options){
	
			var $flake 			= $('<div id="snowbox" />').css({'position': 'absolute', 'top': '-10px'}).html('&#9752;'),
				documentHeight 	= $(document).height(),
				documentWidth	= $(document).width(),
				defaults		= {
									minSize		: 5,		//落叶的最小尺寸
									maxSize		: 50,		//落叶的最大尺寸
									newOn		: 3000,		//落叶出现的频率
									flakeColor	: "#EE9A00"	//懒人建站 www.51xuediannao.com   整理
								},
				options			= $.extend({}, defaults, options);
			
			var interval		= setInterval( function(){
				var startPositionLeft 	= Math.random() * documentWidth - 100,
				 	startOpacity		= 0.5 + Math.random(),
					sizeFlake			= options.minSize + Math.random() * options.maxSize,
					endPositionTop		= documentHeight - 40,
					endPositionLeft		= startPositionLeft - 100 + Math.random() * 500,
					durationFall		= documentHeight * 10 + Math.random() * 5000;
				$flake.clone().appendTo('body').css({
							left: startPositionLeft,
							opacity: startOpacity,
							'font-size': sizeFlake,
							color: options.flakeColor
						}).animate({
							top: endPositionTop,
							left: endPositionLeft,
							opacity: 0.2
						},durationFall,'linear',function(){
							$(this).remove()
						}
					);
					
			}, options.newOn);
	
	};
	
})(jQuery);