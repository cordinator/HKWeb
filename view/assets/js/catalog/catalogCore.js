if (typeof(HK) == 'undefined') {
    HK = {};
}

HK.StoreVariant = Backbone.Model.extend();

HK.StoreVariantCollection = Backbone.Collection.extend({
    model: HK.StoreVariant
});

HK.CatalogBrand = Backbone.Model.extend({

    defaults: {
        selected: false
    }
});

HK.CatalogCategory = Backbone.Model.extend({


});

HK.CatalogBrandCollection = Backbone.Collection.extend({
    model: HK.CatalogBrand
});

HK.CatalogCategoryCollection = Backbone.Collection.extend({
    model: HK.CatalogCategory
});

HK.CatalogFilter = Backbone.Model.extend({
    idAttribute: "iNm"
});

HK.TextFilter = Backbone.Model.extend({

});

HK.CatalogFilterCollection = Backbone.Collection.extend({
    model: HK.CatalogFilter
});

HK.CatalogFilterValue = Backbone.Model.extend({
    idAttribute: "flVal",

    defaults: {
        selected: false
    }
});

HK.CatalogFilterValueCollection = Backbone.Collection.extend({
    model: HK.CatalogFilterValue
});

HK.CatalogLoaderConstants = {

    SUB_CAT_PREFIX: "SCT-",
    MENU_LANDING: "CL-",
    BRAND_PREFIX: "BR-",
    BRAND_SEP: "~",
    BRAND_PARAM: "brands",
    FILTER_PARAM: "fl",
    CAT_PARAM: "catPrefix",
    DEFAULT_SORT_BY: "rank",
    DEFAULT_SORT_TYPE: "asc"


};

HK.BaseCatalogLoader = Backbone.Model.extend({
    urlRoot: CONTEXT_ROOT + "/api/catalog/results",
    searchUrlRoot: CONTEXT_ROOT + "/api/search/results",

    getParamFromURL: function (paramName) {
        paramName = paramName.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
        var regexS = '[\\?&]' + paramName + "=([^&#]*)";
        var regex = new RegExp(regexS);
        var results = regex.exec(window.location.href);
        if (results == null)
            return "";
        else
            return results[1];
    },

    getAllParamsFromUrl: function () {
        var match,
            pl = /\+/g,  // Regex for replacing addition symbol with a space
            search = /([^&=]+)=?([^&]*)/g,
            decode = function (s) {
                return decodeURIComponent(s.replace(pl, " "));
            },
            query = window.location.search.substring(1);

        urlParams = new HK.HashMap();
        while (match = search.exec(query)) {
            //  urlParams[decode(match[1])] = decode(match[2]);
            urlParams.put(decode(match[1]), decode(match[2]));
        }


        return urlParams;
    },

    replaceCatalogParams: function (urlParams) {

        urlParams.remove('pageNo');
        urlParams.remove('perPage');
        urlParams.remove('maxPrice');
        urlParams.remove('minPrice');
        urlParams.remove('txtQ');
        urlParams.remove('navKey');
        urlParams.remove(HK.CatalogLoaderConstants.BRAND_PARAM);
        urlParams.remove(HK.CatalogLoaderConstants.CAT_PARAM);
        urlParams.remove(HK.CatalogLoaderConstants.FILTER_PARAM);

        return urlParams;
    },

    appendUrlParams: function (urlToPush) {
        this.getAllParamsFromUrl();
        var finalUrlParams = this.replaceCatalogParams(this.getAllParamsFromUrl());


        finalUrlParams.each(function (key, val) {
            urlToPush = urlToPush.concat("&").concat(key).concat("=").concat(val);
        });
        return urlToPush;
    },

    pageInfo: function () {
        return {
            total: this.total,
            page: this.currPage,
            perPage: this.perPage,
            pages: Math.ceil(this.total / this.perPage)
        };
    },

    initialize: function () {
        this.currPage = 1;
        this.perPage = 24;
        this.minPrice = -999;
        this.maxPrice = -999;
        this.currSelectedBrands = new Array();
        this.currFilters = new HK.CatalogFilterCollection();
        this.catPrefixes = new Array();
        this.sortBy = "RANK";
        this.sortType = "ASC";


        this.gatherParamsFromURL();

        this.renderPriceSlider = true;

    },

    gatherParamsFromURL: function () {
        var navKey = this.getParamFromURL('navKey');


        if (navKey.indexOf(HK.CatalogLoaderConstants.SUB_CAT_PREFIX) != -1) {
            var catPrefix = navKey.replace(HK.CatalogLoaderConstants.SUB_CAT_PREFIX, "");
            this.catPrefixes.push(catPrefix);
        }
        if (navKey.indexOf(HK.CatalogLoaderConstants.BRAND_PREFIX) != -1) {
            this.brandId = navKey.replace(HK.CatalogLoaderConstants.BRAND_PREFIX, "");
        }

        this.brandString = this.getParamFromURL(HK.CatalogLoaderConstants.BRAND_PARAM);
        this.filterString = this.getParamFromURL(HK.CatalogLoaderConstants.FILTER_PARAM);
        this.catPrefixString = this.getParamFromURL(HK.CatalogLoaderConstants.CAT_PARAM);


        var query = this.getParamFromURL('txtQ');

        if (query.length != 0) {
            /*console.log('a');*/
            this.query = query;
        } else if (query.length === 0) {
            this.query = '';
        }
        var minPrice = this.getParamFromURL("minPrice");
        if (minPrice.length != 0) {
            this.minPrice = minPrice;
        }

        var maxPrice = this.getParamFromURL("maxPrice");
        if (maxPrice.length != 0) {
            this.maxPrice = maxPrice;
        }

        var pageNo = this.getParamFromURL("pageNo");
        if (pageNo.length != 0) {
            this.pageNo = pageNo;
        }
        var perPage = this.getParamFromURL("perPage");
        if (perPage.length != 0) {
            this.perPage = perPage;
        }
        var sortBy = this.getParamFromURL("srtBy");
        if (sortBy.length != 0) {
            this.sortBy = sortBy;
        }
        var sortType = this.getParamFromURL("srtType");
        if (sortType.length != 0) {
            this.sortType = sortType;
        }

    },

    discardUrlParams: function () {
        this.brandString = "";
        this.filterString = "";
        this.catPrefixString = "";
        /*this.query = "";*/
        this.minPrice = -999;
        this.maxPrice = -999;
        this.pageNo = 1;
        this.perPage = 24;
    },

    onClickFilter: function () {
        this.discardUrlParams();
        catalogLoader.resetPager();
        this.renderPriceSlider = true;
        this.minPrice = -999;
        this.maxPrice = -999;


        catalogLoader.fetch();
    },

    onClickSorter: function (sortBy, sortType) {
        this.sortBy = sortBy;
        this.sortType = sortType;

        catalogLoader.fetch();
    },

    onPriceSlider: function (minPr, maxPr) {
        this.discardUrlParams();
        catalogLoader.minPrice = minPr;
        catalogLoader.maxPrice = maxPr;
        catalogLoader.resetPager();
        catalogLoader.renderPriceSlider = false;

        catalogLoader.fetch();
    },

    resetPager: function () {
        this.currPage = 1;
    },

    resetTextFilter: function () {
        /*textFilter = textFilter.unset("query",["silent"]);*/
        textFilter.clear();
        $(".hk-search-box").val("");
        this.query = "";
    },

    resetPriceRange: function () {
        this.minPrice = -999;
        this.maxPrice = -999;
    },

    loadFirst: function () {
        try {
            this.fetch();
        } catch (e) {
            HK.shadow.hide();
            if (typeof e === 'string') {
                HK.alert(e);
            } else {
                HK.alert(HK.errs.requestFail);
            }

            /*console.log(e);*/
        }
    },

    reset: function () {
        this.currSelectedBrands = new Array();
        this.currFilters = new HK.CatalogFilterCollection();


        this.resetTextFilter();
        this.resetPager();
        this.resetPriceRange();
        this.renderPriceSlider = true;
        this.firstLoad = true;

        this.fetch();
    },
    parse: function (response, xhr) {
        var errMsg = $('<h2 class="errorH1"></h2>'),
            errClass = '.errorH1';

        //Used to displat an alert and add msg on html when no result is returned or there is error
        function displayEmptyMsg(msg) {

            //$('#variantResultView').remove( errClass );
            setTimeout(function () {
                $('#variantResultView').append(errMsg.append(msg));
            }, 100);

            HK.shadow.hide();
            //HK.alert({content: msg, theme: HK.POPUP.THEME.ALERT});

        }

        if (HK.utils.Response.hasErr(response)) {
            displayEmptyMsg(HK.utils.Response.getErr(response));
            return false;
        } else {
            $('#variantResultView').remove(errClass);
        }

        if (typeof response.results.catalog.totalVariants === 'undefined' || response.results.catalog.totalVariants === 0) {
            displayEmptyMsg(HK.msgs.noProductFound);

        }
        allBrands.reset();
        allFilters.reset();
        allVariants.reset();
        allCategories.reset();
        //textFilter = new HK.TextFilter();

        var self = this;

        var resp = response.results;


        this.currPage = resp.catalog.pageNo;
        this.perPage = resp.catalog.perPage;
        this.total = resp.catalog.totalVariants;
        this.minPrice = resp.catalog.priceRange.minPrice;
        this.maxPrice = resp.catalog.priceRange.maxPrice;


        _.each(resp.catalog.catPrefixes, function (categoryPrefix) {
            catalogLoader.catPrefixes.push(categoryPrefix);
        });

        _.each(resp.catalog.brands, function (brand) {
            var catalogBrand = new HK.CatalogBrand({id: brand.brandId, iNm: brand.brandInternalName, nm: brand.brandName, nv: brand.noOfVariants, selected: brand.selected});
            allBrands.add(catalogBrand);
            if (brand.selected) {
                catalogLoader.currSelectedBrands.push(catalogBrand.id);
            }


        });
        catalogLoader.currSelectedBrands = _.uniq(this.currSelectedBrands);
        /*console.log("parsing" + catalogLoader.currSelectedBrands);*/

        _.each(resp.catalog.browseCategoryListing, function (category) {
            var catalogCategory = new HK.CatalogCategory({catPrefix: category.catPre, nm: category.nm, nv: category.np,
                //url:category.url.concat(self.brandId)

                url: function () {
                    var url = category.url;
                    if (self.brandId) {
                        url = url.concat("&brands=").concat(self.brandId);
                    }
                    if (self.query) {
                        url = url.concat("&txtQ=").concat(self.query);
                    }

                    return url;
                }
            });
            allCategories.add(catalogCategory);
        });

        if (resp.catalog.textQ) {
            textFilter.set("query", resp.catalog.textQ);
        } else {
            textFilter.clear();
        }

        _.each(resp.catalog.filters, function (filter) {
            var catalogFilter = new HK.CatalogFilter(
                {
                    nm: filter.filterName, iNm: filter.name, disOr: filter.displayOrder
                });

            var catalogFilterValues = new HK.CatalogFilterValueCollection();

            _.each(filter.filterValues, function (filterValue, index) {
                if (!catalogFilter.get('filtered') && filterValue.selected) {
                    catalogFilter.set('filtered', true);
                }
                var catalogFilterValue = new HK.CatalogFilterValue(
                    {
                        flVal: filterValue.filterValue, nv: filterValue.noOfVariants, val: filterValue.value, flInm: filter.name, selected: filterValue.selected
                    });
                catalogFilterValues.add(catalogFilterValue);
            });


            catalogFilter.set("flValues", catalogFilterValues);
            allFilters.add(catalogFilter);

        });


        _.each(resp.catalog.variants, function (variant) {
            var storeVariant = new HK.StoreVariant(
                {
                    id: variant.id,
                    nm: variant.name,
                    brName: variant.brandName,
                    catPre: variant.catPrefix,
                    offerPrice: variant.offerPrice,
                    mrp: variant.mrp,
                    discount: variant.discount,
                    rank: variant.rank,
                    rating: variant.rating,
                    nv: variant.siblingVariants,
                    url: variant.url,
                    oos: variant.oos || (!variant.orderEnabled),
                    freebieName: variant.freebieName

                });

            if (variant.medImg) {
                storeVariant.set("img_alt", variant.medImg.altText);
                storeVariant.set("img_caption", variant.medImg.caption);
                storeVariant.set("img_url", variant.medImg.slink);
            }
                if (variant.discount > 0) {
                storeVariant.set("discounted", true);
            }
          var allTags = new Array();
          if (variant.storeVariantTag) {
            _.each(variant.storeVariantTag.tagList, function (tag) {
              allTags.push(tag);
            });
          }

          if (variant.categoryTag) {
            _.each(variant.categoryTag.tagList, function (tag) {
              allTags.push(tag);
            });
          }

          if (variant.brandTag) {
            _.each(variant.brandTag.tagList, function (tag) {
              allTags.push(tag);
            });
          }
          storeVariant.set("allTags", allTags);
          allVariants.add(storeVariant);
        });

        variantsView.render();
        if (this.renderPriceSlider) {
            priceSliderView.render();
        }

        /* if (textFilterView) {
         textFilterView.render();
         }*/

        /* if (this.firstLoad) {
         this.firstLoad = false;
         }*/


        $(".fltr-box-cont").collapsible();
        $('img.lazy').show().lazyload({threshold: 1000});
        $('#topPager').html(new HK.PagerCountView().render().el);
        $('#bottomPager').html(new HK.PagerView().render().el);

        HK.shadow.hide();
    }
});

_.mixin({
    uniqIgnoreCase: function (array) {
        var lowerCaseCatPrefixes = new Array();
        _.each(array, function (catPrefix) {
            lowerCaseCatPrefixes.push(catPrefix.toLowerCase());
        });
        return _.uniq(lowerCaseCatPrefixes);
    }
});


Backbone.emulateHTTP = true;


var allBrands = new HK.CatalogBrandCollection();
var allCategories = new HK.CatalogCategoryCollection();
var allFilters = new HK.CatalogFilterCollection();
var allVariants = new HK.StoreVariantCollection();
var textFilter = new HK.TextFilter(); 



