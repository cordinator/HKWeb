if (typeof(HK) == 'undefined') {
  HK = {};
};



HK.catalog = new HKCatalog();

//HKCatalog.prototype.settings.updateHistory = false;


//For every new event registered in HKCatalog make new entry here
HK.catalog.eventMapper[HK.catalog.events.filterModified] = ["prepareBrandsText", "preparePerPageText", "prepareSortByText"];
HK.catalog.eventMapper[HK.catalog.events.changePerPage] = ["prepareBrandsText","preparePerPageText", "prepareSortByText", "preparePriceText"];
HK.catalog.eventMapper[HK.catalog.events.sortVariants] = ["prepareBrandsText","preparePerPageText", "prepareSortByText","preparePriceText"];
HK.catalog.eventMapper[HK.catalog.events.priceRangeChanged] = ["prepareBrandsText","preparePerPageText", "prepareSortByText", "preparePriceText"];
HK.catalog.eventMapper[HK.catalog.events.loadMore] = [ "prepareBrandsText","preparePerPageText", "prepareSortByText", "preparePriceText", "prepareLoadMoreText"];
HK.catalog.eventMapper[HK.catalog.events.resetAll] = [];
//trigger events
$('body').on('change','input[type=checkbox]',function(e){
  $('body').trigger(HK.catalog.events.filterModified);
});
$('body').on('click','input[type=checkbox]',function(e){
  e.stopImmediatePropagation();
});
$('body').on('click','.fltr-items a',function(e){
  $(this).find('input[type=checkbox]').trigger('click');
});

$('body').on('click',HK.catalog.elms.loadMore,function(){
  $('body').trigger(HK.catalog.events.loadMore);
});

$('body').on('click',HK.catalog.elms.resetAll,function(){
  $(HK.catalog.elms.excludeOutOfStock).attr("checked",false);
  $('body').trigger(HK.catalog.events.resetAll);
});



$('body').on('click', HK.catalog.elms.sortItems ,function(){
  if($(this).hasClass(HK.catalog.elms.selectedSortItemClass)){
    return;
  } else {
    $(HK.catalog.elms.sortItems).removeClass(HK.catalog.elms.selectedSortItemClass);
    $(this).addClass(HK.catalog.elms.selectedSortItemClass);
    $(HK.catalog.elms.perPage).val($.trim($(this).find('a').text()));
    $('body').trigger(HK.catalog.events.changePerPage);
  }
});

$('body').on('change', HK.catalog.elms.sortByVariant ,function(){
  $('body').trigger(HK.catalog.events.sortVariants);
});



//Event handling
$('body').on(HK.catalog.events.filterModified,function(event){
  var reqURL = HK.catalog.createURL(event,'searchCatalog');
  HK.catalog.getBaseDataResetSlider(reqURL);
});

$('body').on(HK.catalog.events.changePerPage,function(event){
  var reqURL = HK.catalog.createURL(event,'searchCatalog');
  HK.catalog.getBaseData(reqURL);
});

$('body').on(HK.catalog.events.resetAll,function(event){
  var reqURL = HK.catalog.createURL(event,'searchCatalog');
  HK.catalog.getBaseDataResetSlider(reqURL);
});

$('body').on(HK.catalog.events.sortVariants,function(event){
  var reqURL = HK.catalog.createURL(event,'searchCatalog');
  HK.catalog.getBaseData(reqURL);
});

$('body').on(HK.catalog.events.priceRangeChanged,function(event, data){
  var minPrice = data.minSelectedPrice,
      maxPrice = data.maxSelectedPrice,
      reqURL = '';
  $(HK.catalog.elms.minSelectedPrice).val(minPrice);
  $(HK.catalog.elms.maxSelectedPrice).val(maxPrice);
  reqURL = HK.catalog.createURL(event,'searchCatalog');


  HK.catalog.getBaseData(reqURL);
});

$('body').on(HK.catalog.events.loadMore,function(event){
  var loadMoreBar = $(HK.catalog.elms.loadMore),
      url = '';
  url = HK.catalog.createLoadMoreURL(event, 'searchPagination');
  if( !loadMoreBar.hasClass('inactive') ) {

    loadMoreBar.text(loadMoreBar.data('loadingText')).addClass('inactive');

    var sCallback = function (data) {
      var pageNumber = Number($(HK.catalog.elms.loadMore).attr("data-curr-page")),
          perPage = Number( $(HK.catalog.elms.perPage).val()),
          startResult = Number( $(HK.catalog.elms.startResult).text() ),
          autoScrollCount = Number( loadMoreBar.data('autoScroll') );
      if ( autoScrollCount > 0 ) {
        loadMoreBar.data( 'autoScroll', autoScrollCount - 1);
      }
      if($.trim(data).length){
        $('#variantResultView').append(data);
        if ( ( $('.varnt-cont').length  + startResult -1 ) === ( pageNumber * perPage)  ) {
          $(HK.catalog.elms.loadMore).attr("data-curr-page",pageNumber+1);
          loadMoreBar.text( loadMoreBar.data('defaultText')).removeClass('inactive');
        } else {
          loadMoreBar.hide();
        }
        HK.catalog.clearPage();

      } else {
        $(HK.catalog.elms.loadMore).hide();
      }

    };
    var fCallback = function(){
      loadMoreBar.text(loadMoreBar.data('defaultText')).removeClass('inactive');
    };
    HK.catalog.getBaseData(url, sCallback, fCallback);
  }
});
var browseByTree = '';
$(document).ready(function(){
  browseByTree = $('.fltr-menu').html();
  HK.catalog.clearPage();
});


//misc events
$('body').on('click','.remove-varnt',function(){
  var _self = $(this),
      parent =_self.parent(),
      trgt = '';
  if(parent.hasClass('filterByAttrSpan')){
    trgt = $("[data-name='"+parent.attr('flinm')+"']").find("input[type=checkbox]"+"[value='"+parent.attr('value')+"']");
    trgt.attr("checked",false).change();
    //parent.parent().hide();
  } else if(parent.hasClass("brandFilterSpan")){
    trgt = $(".sel-brand input[type=checkbox]"+"[value='"+parent.attr('value')+"']");
    trgt.attr("checked",false).change();
    //parent.parent().hide();
  } else if(parent.hasClass("textFilterSpan")){
    trgt = $(HK.catalog.elms.searchBox);
    trgt.val('');
    parent.attr('value','');
    $('body').trigger(HK.catalog.events.filterModified);
  } else if(parent.hasClass('filterByOOS')){
    trgt = $("#excludeOOSFilterView").find("input[type=checkbox]");
    trgt.attr("checked",false).change();
  }
});
$(window).scroll( function () {
  if ( $(document).height() - $(window).scrollTop() < 1200 ) {
    if ( Number( $(HK.catalog.elms.loadMore).data('autoScroll') ) > 0 ) {
      $('body').trigger(HK.catalog.events.loadMore);
    }
  }
} );
//patch

//search feedback
$('body').on('click', '.search-feedback-response' ,function(){
  $('#searchRelevanceFeedback').html("Thank you for your feedback!");
});

