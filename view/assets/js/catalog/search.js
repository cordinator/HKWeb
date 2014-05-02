if (typeof(HK) == 'undefined') {
  HK = {};
}

HK.SearchCatalogLoader = HK.BaseCatalogLoader.extend({

  url: function() {
    HK.shadow.show();
    var urlFormed, urlToPush = "";
    var params = {};

    params.pageNo = this.currPage;
    params.perPage = this.perPage;

    urlToPush = urlToPush.concat("?txtQ=").concat(this.query);
    urlToPush = urlToPush.concat("&pageNo=").concat(this.currPage);
    urlToPush = urlToPush.concat("&perPage=").concat(this.perPage);

    urlFormed = "?txtQ=".concat(this.query)
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


    var url = this.searchUrlRoot.concat(urlFormed);
    urlToPush = this.appendUrlParams(urlToPush);
    /*console.log("en" + urlToPush);

    console.log(params);
    console.log(urlToPush);*/
    History.pushState(params, null, urlToPush);

    return url;

  }




});


var catalogLoader = new HK.SearchCatalogLoader();


var allCategoriesView = new HK.CategoryCollectionView({collection:allCategories});

var variantsView = new HK.VariantsView({collection:allVariants});
var priceSliderView = new HK.PriceSliderView();


$(document).ready(function() {

    $("#sortByVariants").change(function () {

        var sortVariantValue = $(this).find(':selected');
        if (sortVariantValue != '') {
            var srtBy = sortVariantValue.data("srt-by");
            var srtType = sortVariantValue.data("srt-type");
            catalogLoader.onClickSorter(srtBy, srtType);
          $(this).blur();
        }

    });

    $("#refresh-all").click(function() {
    catalogLoader.reset();
  });

  catalogLoader.loadFirst();
});


