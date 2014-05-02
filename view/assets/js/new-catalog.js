/**
 * Created with IntelliJ IDEA.
 * User: Sachit
 * Date: 12/04/13
 * Time: 13:44
 * To change this template use File | Settings | File Templates.
 */


$.fn.collapsible = function(elementClass){
	return $(this).each(function(){

		//define
        var ele = $(this);
		var collapsibleHeading = ele.find(".collapsible-hdr");
		var collapsibleContent = ele.find(".collapsible-cntnt");
		//modify markup & attributes
		collapsibleHeading.children("span").addClass('collapsible-heading')
			.prepend('<span class="collapsible-heading-status"></span>')
			.wrapInner('<a href="#" class="collapsible-heading-toggle"></a>');
		collapsibleContent.addClass('collapsible-content');
		//events
		collapsibleHeading
			.bind('collapse', function(){
				$(this).children("span")
					.addClass('collapsible-heading-collapsed icn-expand') ;
					//.find('.collapsible-heading-status').text('Show ');

				collapsibleContent.slideUp(function(){
					$(this).addClass('collapsible-content-collapsed').removeAttr('style').attr('aria-hidden',true);
				});
			})
			.bind('expand', function(){
				$(this).children("span")
					.removeClass('collapsible-heading-collapsed icn-expand') ;
					//.find('.collapsible-heading-status').text('Hide ');
				collapsibleContent
					.slideDown(function(){
						$(this).removeClass('collapsible-content-collapsed').removeAttr('style').attr('aria-hidden',false);
					});
			})
			.click(function(){
				if( $(this).children("span").is('.collapsible-heading-collapsed') ){
					$(this).trigger('expand');
				}
				else {
					$(this).trigger('collapse');
				}
				return false;
			})
			.trigger('expand');
	});
};
