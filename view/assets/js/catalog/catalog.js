if (typeof(HK) == 'undefined') {
    HK = {};
}


HK.CatalogLoader = HK.BaseCatalogLoader.extend({


    url: function () {
        HK.shadow.show();
        var urlFormed, urlToPush = "";
        var params = {};

        var loadByCat = false;
        var navKey = this.getParamFromURL('navKey');


        if (this.catPrefixes && this.catPrefixes.length > 0) {
            loadByCat = true;
        }

        if (!loadByCat && this.catPrefixString != "") {
            loadByCat = true;
        }

        /*if (navKey.indexOf(HK.CatalogLoaderConstants.MENU_LANDING) != -1) {
         loadByCat = false;
         }*/

        if (loadByCat) {
            var catString = this.catPrefixString;


            if (catString.length == 0) {
                _.each(_.uniqIgnoreCase(this.catPrefixes), function (catPrefix) {
                    catString += catPrefix + "~";
                });
            }

            params.catPrefix = catString;
            urlToPush = urlToPush.concat("&").concat(HK.CatalogLoaderConstants.CAT_PARAM).concat("=").concat(catString);


            var brandString = this.brandString;

            /*console.log("url" + this.currSelectedBrands);*/
            if (brandString.length == 0) {
                _.each(_.uniq(this.currSelectedBrands), function (selBrand) {
                    if (brandString.indexOf(selBrand) == -1) {
                        brandString += selBrand + HK.CatalogLoaderConstants.BRAND_SEP;
                    }
                });
            }
            params.brands = brandString;
            urlToPush = urlToPush.concat("&").concat(HK.CatalogLoaderConstants.BRAND_PARAM).concat("=").concat(brandString);

            if (this.query) {
                params.query = this.query;
                urlToPush = urlToPush.concat("&").concat("txtQ").concat("=").concat(this.query);
            }

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


            // console.log(this.currFilters.toJSON());

            /*_.each(this.currFilters.models, function(model)
             {
             console.log(model.get("flValues").toJSON());
             });*/

            urlFormed = "?catPrefix=".concat(catString).concat("&brands=").concat(brandString).concat("&fl=").concat(filterString)
                .concat("&pageNo=").concat(this.currPage).concat("&srtBy=").concat(this.sortBy).concat("&srtType=").concat(this.sortType);

            if (this.query) {
                urlFormed = urlFormed.concat("&txtQ=").concat(this.query);
            }
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
        }
        else {
            params.pageNo = this.currPage;
            params.perPage = this.perPage;

            urlToPush = urlToPush.concat("&pageNo=").concat(this.currPage);
            urlToPush = urlToPush.concat("&perPage=").concat(this.perPage);

            urlFormed = "/".concat(navKey).concat("?pageNo=").concat(this.currPage);
            if (this.perPage) {
                urlFormed = urlFormed.concat("&perPage=").concat(this.perPage);
            }

        }
        var url = this.urlRoot.concat(urlFormed);
        /*console.log("en" + urlToPush);*/
        var currNavKey = this.getParamFromURL('navKey');
        urlToPush = '?'.concat("navKey=").concat(currNavKey).concat(urlToPush);


        urlToPush = this.appendUrlParams(urlToPush);

        /* var utmSource = this.getParamFromURL('utm_source');
         var utmMedium = this.getParamFromURL('utm_medium');
         var utmCampaign = this.getParamFromURL('utm_campaign');

         if (utmSource != "") {
         urlToPush = urlToPush.concat("&utm_source=").concat(utmSource);
         }
         if (utmMedium != "") {
         urlToPush = urlToPush.concat("&utm_medium=").concat(utmMedium);
         }
         if (utmCampaign != "") {
         urlToPush = urlToPush.concat("&utm_campaign=").concat(utmCampaign);
         }*/

        /*console.log(params);
         console.log(urlToPush);*/
        History.pushState(params, null, urlToPush);

        //window.location.href = urlToPush;

        return url;

    }




});


var catalogLoader = new HK.CatalogLoader();

var brandFilterView = new HK.BrandCollectionView({collection: allBrands});
var filterByBrandView = new HK.FilterByBrandView({collection: allBrands});
var allFiltersView = new HK.FiltersView({collection: allFilters});
var filterByAttrView = new HK.FilteredByAttrView({collection: allFilters});
var variantsView = new HK.VariantsView({collection: allVariants});
var priceSliderView = new HK.PriceSliderView();
var textFilterView = new HK.TextFilterView({model: textFilter});


$(document).ready(function () {
    catalogLoad();

});

function catalogLoad() {
    $("#search-brands").keyup(function (event) {
        var keyword = $(event.target).val();
        $("#brandFilterView").children().each(function () {
            if ($(this).text().toLowerCase().search(keyword.toLowerCase()) == -1) {
                $(this).hide();
            } else {
                $(this).show();
            }
        });
    });


    $("#refresh-all").click(function () {
        catalogLoader.reset();
    });

    $("#sortByVariants").change(function () {

        var sortVariantValue = $(this).find(':selected');
        if (sortVariantValue != '') {
            var srtBy = sortVariantValue.data("srt-by");
            var srtType = sortVariantValue.data("srt-type");
            catalogLoader.onClickSorter(srtBy, srtType);
            $(this).blur();
        }

    });

    fixCompareWidget();
    catalogLoader.loadFirst();
}

