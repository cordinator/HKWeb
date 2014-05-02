if (typeof(HK) == 'undefined') {
  HK = {};
}

HK.TextFilterView = Backbone.View.extend({
  el: $('#filteredByTextView'),


  initialize: function() {
    if (this.model) {
      this.model.bind("remove", this.close, this);
      var self = this;
      this.model.bind("change", function() {
        $('#filteredByTextView').html(new HK.FilterByTextElementView({model: self.model}).render().el);
      });
      this.model.bind("reset", this.close, this);
      this.model.bind("clear", this.close, this);
      this.model.bind("destroy", this.close, this);
    }
  },
  close: function() {
    $(this.el).unbind();
    $(this.el).empty();
  }
});

HK.FilterByTextElementView = Backbone.View.extend({
  tagName: "span",
  template : $('#filteredByTextViewTemplate').html(),

  initialize: function() {
    this.model = this.options.model;
  },

  events: {
    "click .textFilterSpan": "removeFilterByText"
  },

  removeFilterByText : function() {
    /*console.log('remove text');*/
    catalogLoader.resetTextFilter();
    catalogLoader.fetch();
  },

  render: function() {
    /*console.log('c');
    console.log(this.model.has("query"));*/
    if (this.model.has("query")) {
      var json = this.model.toJSON();
      var html = HK.UIHelper().renderToHtml(this.template, json);
      $(this.el).html($.trim(html));
    }else{
      $(this.el).html("");
       $(".hk-search-box").val("");
    }
    return this;
  }
});


HK.CategoryCollectionView = Backbone.View.extend({
  el: $('#categoryFilterView'),

  initialize: function() {
    if (this.collection) {
      this.collection.bind("add", function(category) {

        $('#categoryFilterView').append(new HK.CategoryFilterRowView({model: category}).render().el);
      });
      this.collection.bind("remove", this.render, this);
      this.collection.bind("reset", this.close, this);
      this.collection.bind("destroy", this.close, this);


    }
  },
  close: function() {
    $(this.el).unbind();
    $(this.el).empty();
  }
});

HK.CategoryFilterRowView = Backbone.View.extend({
  tagName: "li",
  template : $('#categoryFilterRowTemplate').html(),

  initialize: function() {
    this.model = this.options.model;
    this.model.bind("change", this.render, this);
    this.model.bind("destroy", this.close, this);

  },


  render: function() {
    var json = this.model.toJSON();
    var html = HK.UIHelper().renderToHtml(this.template, json);
    $(this.el).html($.trim(html));
    return this;
  }
});


HK.PriceSliderView = Backbone.View.extend({
  tagName: "span",
  template : $('#priceSliderViewTemplate').html(),

  initialize: function() {

  },

  close: function() {
    $(this.el).unbind();
    $(this.el).empty();
  },

  render: function() {

    var json = {};
    json.minPrice = catalogLoader.minPrice;
    json.maxPrice = catalogLoader.maxPrice;
    json.stepSize = Math.floor((catalogLoader.maxPrice - catalogLoader.minPrice) / 10);

    var html = HK.UIHelper().renderToHtml(this.template, json);
    if (json.minPrice != json.maxPrice) {
      $('#priceSliderView').html(html);
      $('#sl2').slider().on('slideStop', function(ev) {

        catalogLoader.onPriceSlider(ev.value[0], ev.value[1]);
      });

    } else {
      $('#priceSliderView').html('<div id="priceSliderView" class="slider-cntnr"><b class="cont-lft">Rs. ' + json.minPrice +
                                 '</b><b class="cont-rht">Rs. ' + json.minPrice +
                                 '</b><div class="slider slider-horizontal"><div class="slider-track"><div class="slider-handle round" style="left: 0%;cursor:auto;background-color:#eeeef4;background-image:none"></div><div class="slider-handle round" style="left: 94%;cursor:auto;background-color:#eeeef4;background-image:none"></div></div></div>');

    }

  }
});


HK.VariantsView = Backbone.View.extend({
  tagName: "span",
  el: $('#variantResultView'),

  initialize: function() {
    this.collection = this.options.collection;
    this.collection.bind("reset", this.close, this);
  },

  close: function() {
    $(this.el).unbind();
    $(this.el).empty();
  },

  render: function() {
    _.each(this.collection.models, function(variant) {
      variant.set('ratingPercent', 0);
      if (typeof variant.get('rating') == 'number') {
        variant.set('ratingPercent', (variant.get('rating') / 5) * 100);
      }
      $('#variantResultView').append(new HK.VariantItemView({model: variant}).render().el);

    });
  }
});

HK.VariantItemView = Backbone.View.extend({

  template : $('#variantResultItemViewTemplate').html(),


  initialize: function() {
    this.model = this.options.model;
    this.model.bind("change", this.render, this);
    this.model.bind("destroy", this.close, this);
  },

  close: function() {
    $(this.el).unbind();
    $(this.el).empty();
  },

  events: {
    "click .addToCompare": "addToCompare"
  },

  addToCompare : function(event) {
    var addtoCompareChkBox = $(event.currentTarget);
    var varId = addtoCompareChkBox.attr('varId');
    var catPre = addtoCompareChkBox.attr('catPre');


    HK.VariantComparison().addVariantToComparison(varId, catPre, $(addtoCompareChkBox));
  },

  render: function() {
    var json = this.model.toJSON();
    var html = HK.UIHelper().renderToHtml(this.template, json);
    $(this.el).html($.trim(html));

    return this;
  }
});


HK.FiltersView = Backbone.View.extend({
  el: $('#catalogFiltersView'),

  initialize: function() {
    if (this.collection) {
      this.collection.bind("add", function(filter) {

        $('#catalogFiltersView').append(new HK.FilterRowView({model: filter}).render().el);
      });
      this.collection.bind("remove", this.render, this);
      this.collection.bind("destroy", this.close, this);
      this.collection.bind("reset", this.close, this);


    }
  },
  close: function() {
    $(this.el).unbind();
    $(this.el).empty();
  }
});

HK.FilterRowView = Backbone.View.extend({
  tagName: "span",
  template : $('#catalogFilterTemplate').html(),

  initialize: function() {
    this.model = this.options.model;
    this.model.bind("change", this.render, this);
    this.model.bind("destroy", this.close, this);
  },

  events: {
    "change .filterChk": "filterByAttr"

  },

  filterByAttr : function(event) {

    var filterChkBox = $(event.currentTarget);
    var filterINm = filterChkBox.attr('flInm');
    var flValue = filterChkBox.attr('value');
    var currFilter = catalogLoader.currFilters.get(filterINm);
    var appliedFilterValue = new HK.CatalogFilterValue(
    {
      flVal: flValue, val:flValue
    });

    if (filterChkBox.is(':checked')) {
      if (currFilter) {
        var existingFilterValues = currFilter.get("flValues");
        if (!existingFilterValues.get(flValue)) {
          existingFilterValues.add(appliedFilterValue);
        }
      } else {
        var appliedFilter = allFilters.get(filterINm).clone();
        appliedFilter.unset("flValues");
        var appliedFilterValues = new HK.CatalogFilterValueCollection();
        appliedFilterValues.add(appliedFilterValue);
        appliedFilter.set("flValues", appliedFilterValues);

        catalogLoader.currFilters.add(appliedFilter);
      }
    } else {

      currFilter.get("flValues").remove(appliedFilterValue);

    }
    /*

     if (brandChkBox.is(':checked')) {
     catalogLoader.selectedBrands.push(value);
     } else {
     catalogLoader.selectedBrands.pop(value);
     }
     catalogLoader.fetch();*/
    catalogLoader.onClickFilter();

  },


  render: function() {
    var json = this.model.toJSON();
    json.flValues = this.model.get("flValues").toJSON();
    var html = HK.UIHelper().renderToHtml(this.template, json);
    $(this.el).attr('class', 'fltr-box-cont clr-cont').html($.trim(html));
    return this;
  }
});


HK.BrandCollectionView = Backbone.View.extend({
  el: $('#brandFilterView'),

  initialize: function() {
    if (this.collection) {
      this.collection.bind("add", function(brand) {

        $('#brandFilterView').append(new HK.BrandFilterRowView({model: brand}).render().el);
      });
      this.collection.bind("remove", this.render, this);
      this.collection.bind("reset", this.close, this);
      this.collection.bind("destroy", this.close, this);


    }
  },
  close: function() {
    $(this.el).unbind();
    $(this.el).empty();
  }
});

HK.BrandFilterRowView = Backbone.View.extend({
  tagName: "li",
  template : $('#brandFilterRowTemplate').html(),

  initialize: function() {
    this.model = this.options.model;
    this.model.bind("change", this.render, this);
    this.model.bind("destroy", this.close, this);

  },

  events: {
    "change .brandChk": "filterByBrand"

  },

  filterByBrand : function(event) {
    var brandChkBox = $(event.currentTarget);
    var value = brandChkBox.attr('value');
    value = parseInt(value);
    if (brandChkBox.is(':checked')) {
      catalogLoader.currSelectedBrands.push(value);
    } else {
      var index = $.inArray( value, catalogLoader.currSelectedBrands );
      catalogLoader.currSelectedBrands.splice(index, 1);
      /*console.log(catalogLoader.currSelectedBrands);*/
      /*catalogLoader.currSelectedBrands.pop(value);*/
    }
    catalogLoader.onClickFilter();

  },

  render: function() {
    var json = this.model.toJSON();
    var html = HK.UIHelper().renderToHtml(this.template, json);
    $(this.el).html($.trim(html));
    return this;
  }
});


HK.FilterByBrandView = Backbone.View.extend({
  el: $('#filteredByBrandView'),

  initialize: function() {
    if (this.collection) {
      this.collection.bind("add", function(brand) {
        $('#filteredByBrandView').append(new HK.FilterByBrandElementView({model: brand}).render().el);
      });
      this.collection.bind("remove", this.render, this);
      this.collection.bind("reset", this.close, this);
      this.collection.bind("destroy", this.close, this);


    }
  },
  close: function() {
    $(this.el).unbind();
    $(this.el).empty();
  }
});

HK.FilterByBrandElementView = Backbone.View.extend({
  tagName: "span",
  template : $('#filteredByBrandViewTemplate').html(),

  initialize: function() {
    this.model = this.options.model;
    this.model.bind("change", this.render, this);
    this.model.bind("destroy", this.close, this);

  },

  events: {
    "click .brandFilterSpan": "removeFilterByBrand"

  },

  removeFilterByBrand : function(event) {
    var brandFilterSpan = $(event.currentTarget);
    var value = brandFilterSpan.attr('value');
    value = parseInt(value);
    var index = $.inArray( value, catalogLoader.currSelectedBrands );
    catalogLoader.currSelectedBrands.splice(index, 1);
    /*catalogLoader.currSelectedBrands.pop(value);*/
    catalogLoader.onClickFilter();


  },

  render: function() {
    var json = this.model.toJSON();
    var html = HK.UIHelper().renderToHtml(this.template, json);
    $(this.el).html($.trim(html));
    return this;
  }
});


HK.FilteredByAttrView = Backbone.View.extend({
  el: $('#filteredByAttrView'),

  initialize: function() {
    if (this.collection) {
      this.collection.bind("add", function(filter) {

        $('#filteredByAttrView').append(new HK.FilteredByAttrElementView({model: filter}).render().el);
      });
      this.collection.bind("remove", this.render, this);
      this.collection.bind("destroy", this.close, this);
      this.collection.bind("reset", this.close, this);


    }
  },
  close: function() {
    $(this.el).unbind();
    $(this.el).empty();
  }
});

HK.FilteredByAttrElementView = Backbone.View.extend({
  tagName: "span",
  template : $('#filteredByAttrViewTemplate').html(),

  initialize: function() {
    this.model = this.options.model;
    this.model.bind("change", this.render, this);
    this.model.bind("destroy", this.close, this);
  },

  events: {
    "click .filterByAttrSpan": "removeFilterByAttr"

  },

  removeFilterByAttr : function(event) {

    var filterByAttrSpan = $(event.currentTarget);
    var filterINm = filterByAttrSpan.attr('flInm');
    var flValue = filterByAttrSpan.attr('value');
    var currFilter = catalogLoader.currFilters.get(filterINm);
    var appliedFilterValue = new HK.CatalogFilterValue(
    {
      flVal: flValue, val:flValue
    });

    currFilter.get("flValues").remove(appliedFilterValue);

    catalogLoader.onClickFilter();

  },


  render: function() {
    var json = this.model.toJSON();
    json.flValues = this.model.get("flValues").toJSON();
    var html = HK.UIHelper().renderToHtml(this.template, json);
    $(this.el).html($.trim(html));
    return this;
  }
});


HK.PagerView = Backbone.View.extend({
  tagName: "div",
  template:$("#pagerTemplate").html(),


  events: {
    "click a.pager-prev": "previousPage",
    "click a.pager-next": "nextPage",
    "click a.pager": "goToPage"
  },

  render: function() {
    var json = catalogLoader.pageInfo();
    var html = HK.UIHelper().renderToHtml(this.template, json);
    $(this.el).html($.trim(html));
    return this;
  },


  nextPage: function() {
    HK.utils.Scroll.toElement('#variantResultView', 500);
    catalogLoader.currPage = catalogLoader.currPage + 1;
    catalogLoader.fetch();
  },

  previousPage: function() {
    HK.utils.Scroll.toElement('#variantResultView', 500);
    catalogLoader.currPage = catalogLoader.currPage - 1;
    catalogLoader.fetch();
  },

  goToPage: function(event) {
    var pagerId = $(event.currentTarget).attr("id");
    var pageNo = pagerId.substring(pagerId.indexOf("-") + 1, pagerId.length);
    //alert(pageNo);
    HK.utils.Scroll.toElement('#variantResultView', 500);
    catalogLoader.currPage = pageNo;
    catalogLoader.fetch();

  }

});


HK.PagerCountView = Backbone.View.extend({
  tagName: "div",
  template:$("#pagerCountTemplate").html(),


  render: function() {
    var json = catalogLoader.pageInfo();
    var html = HK.UIHelper().renderToHtml(this.template, json);
    $(this.el).html($.trim(html));
    return this;
  },

  events: {
    "click a.resultCnt": "updateResultCount"

  },

  updateResultCount: function(event) {
    catalogLoader.currPage = 1;
    catalogLoader.perPage = $(event.currentTarget).attr("count");
    catalogLoader.fetch();
  }
});
