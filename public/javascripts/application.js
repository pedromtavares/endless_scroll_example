// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
	$('ul').endlessScroll({
		fireOnce: true,
		fireDelay: 500,
		ceaseFire: function(){
			return $('#infinite-scroll').length ? false : true;
		},
	  callback: function(){
	    $.ajax({
		  url: '/posts',
		  data: {
				last: $(this).attr('last')
			},
			dataType: 'script'
		 });
	  }
	});

	$("img.loading").ajaxStart(function(){
		$(this).removeClass('none');
	}).ajaxComplete(function(){
		$(this).addClass('none');
	});
});