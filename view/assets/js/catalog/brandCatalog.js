if (typeof(HK) == 'undefined') {
    HK = {};
}

HK.BrandCatalogLoader = HK.BaseCatalogLoader.extend({

    url: function () {
        HK.shadow.show();
        var urlFormed, urlToPush = "";
        var params = {};


        var brandString = this.brandId + HK.CatalogLoaderConstants.BRAND_SEP;


        params.brands = brandString;
        urlToPush = urlToPush.concat("&").concat(HK.CatalogLoaderConstants.BRAND_PARAM).concat("=").concat(brandString);


        var filterString = this.filterString;
        if (filterString.length == 0) {
            _.each(this.currFilters.models, function (appliedFilter) {

                filterString += appliedFilter.get("iNm");
                filterString += ":";

                _.each(appliedFilter.get("flValues").models, function (appliedFilterValue) {
                    filterString += appliedFilterValue.get("flVal");
                    filterString += ",";
                });
                filterString += ";";
            });
        }
        params.fl = filterString;
        urlToPush = urlToPush.concat("&").concat(HK.CatalogLoaderConstants.FILTER_PARAM).concat("=").concat(filterString);


        params.pageNo = this.currPage;
        params.perPage = this.perPage;

        urlToPush = urlToPush.concat("&pageNo=").concat(this.currPage);
        urlToPush = urlToPush.concat("&perPage=").concat(this.perPage);


        urlFormed = "?brands=".concat(brandString).concat("&fl=").concat(filterString)
            .concat("&pageNo=").concat(this.currPage).concat("&srtBy=").concat(this.sortBy).concat("&srtType=").concat(this.sortType);
        if (this.perPage) {
            urlFormed = urlFormed.concat("&perPage=").concat(this.perPage);
        }
        if (this.minPrice != -999 && this.minPrice !=0) {
            urlFormed = urlFormed.concat("&minPrice=").concat(this.minPrice);
            params.minPrice = this.minPrice;
            urlToPush = urlToPush.concat("&minPrice=").concat(this.minPrice);
        }
        if (this.maxPrice != -999 && this.maxPrice !=0) {
            urlFormed = urlFormed.concat("&maxPrice=").concat(this.maxPrice);
            params.maxPrice = this.maxPrice;
            urlToPush = urlToPush.concat("&maxPrice=").concat(this.maxPrice);
        }


        var url = this.urlRoot.concat(urlFormed);
        /*console.log("en" + urlToPush);

         console.log(params);
         console.log(urlToPush);*/
        // History.pushState(params, null, urlToPush);

        return url;

    }




});


var catalogLoader = new HK.BrandCatalogLoader();


var allCategoriesView = new HK.CategoryCollectionView({collection: allCategories});

var variantsView = new HK.VariantsView({collection: allVariants});
var priceSliderView = new HK.PriceSliderView();


$(document).ready(function () {

    $("#sortByVariants").change(function () {

        var sortVariantValue = $(this).find(':selected');
        if (sortVariantValue != '') {
            var srtBy = sortVariantValue.data("srt-by");
            var srtType = sortVariantValue.data("srt-type");
            catalogLoader.onClickSorter(srtBy, srtType);
            $(this).blur();
        }

    });

    $("#refresh-all").click(function () {
        catalogLoader.reset();
    });

    fixCompareWidget();

    catalogLoader.loadFirst();
});

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
  }
});


