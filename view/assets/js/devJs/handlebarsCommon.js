if (typeof(HK) == 'undefined') {
    HK = {};
}


Handlebars.registerHelper('zeromod', function (num, den, rem, options) {
    if (num % den == rem) {
        return options.fn(this);
    }
    return options.inverse(this);
});

Handlebars.registerHelper('renderVariantIdsCommaSep', function (storeVariants) {
    var variantIds = "";
        for (var i = 0; i < storeVariants.length; i++) {
            variantIds+=storeVariants[i].storeVariantId+",";
        }
    var lastComma = variantIds.lastIndexOf(",");
    if(lastComma !=-1){
        variantIds = variantIds.substring(0,lastComma);
    }
    return variantIds;
});


Handlebars.registerHelper('pager', function (pageInfo) {
    var out = "";
    if (this.total > this.perPage) {
        out = out + "<ul>";
        //var k = this.page;

        out = out + "<li class='active'><a class='pager' style='cursor: pointer' id='pager-1'>first</a></li>";
        if (this.page == 1) {
            out = out + "<li  class='disabled'><a class='hide'>&laquo;</a></li>";
        } else {
            out = out + "<li ><a class='pager-prev'>&laquo;</a></li>";
            //out = out + "<li><a class='pager' id='pager-1'>first</li>";
        }

        //var start = (this.page - 1) * 10;
        //var endIdx = start + this.perPage  ;
        //var end = endIdx > this.total ? this.total : endIdx;

        /*for (var i = 1; (i < 5 && k <= this.pages); i++,k++) {*/
        /*for (var i = 1; (i < 10 && i <= this.pages); i++) {*/

        var pages = this.pages;
        for (var i = this.page; (i < (this.page + 8)) && (i <= this.pages); i++) {
            if (this.page == i) {
                out = out + "<li class='active'><a class='pager' id='pager-" + i + "'>" + i + "</a></li>";
            }
            else {
                out = out + "<li ><a class='pager' id='pager-" + i + "'>" + i + "</a></li>";
            }
        }

        if (this.page == this.pages) {
            out = out + "<li  class='disabled'><a class='hide'>&raquo;</a></li>";
        } else {
            //out = out + "<li><a class='pager' id='pager-" + this.pages + "'>last</li>";
            out = out + "<li ><a class='pager-next'>&raquo;</a></li>";
        }

        out = out + "<li class='active'><a class='pager' style='cursor: pointer' id='pager-" + pages + "'>" + "last" + "</a></li>";
        out += "</ul>";
        /*out += "<div > " + "Showing " + (start + 1) + "- " + end + " of " + this.total + " results</div>";*/
    }

    return out;
});


Handlebars.registerHelper('pagerCount', function (pageInfo) {
    var out = "<ul>";
    var perPage = this.perPage;

    var start = (this.page - 1) * perPage;
    var endIdx = start + this.perPage;

    var end = endIdx > this.total ? this.total : endIdx;


    out += "<span > " + "Showing " + (start + 1) + "- " + end + " of " + this.total + " results</span><span class='icn-sqre mrgn-lr-10'></span>";

    var itemCountArr = new Array();
    itemCountArr.push(24);
    itemCountArr.push(48);
    itemCountArr.push(72);

    out += "Show  ";

    _.each(itemCountArr, function (itemCount, idx) {
        if (itemCount == perPage) {
            out += "<span class='selectd-sort'><a class='resultCnt' count='" + itemCount + "'>" + itemCount + "</a></span> ";
        } else {
            out += "<span class='sort-items'><a class='resultCnt' count='" + itemCount + "'>" + itemCount + "</a></span> ";
        }

        if (idx != 2) {
            out += "|";
        }
    });

    out += "items per page";


    return out;
});

Handlebars.registerHelper('renderTagImg', function (arr, key) {

  if (arr.length > 0) {
    if (_.contains(arr, key)) {
      return "<span class='tag-img tag-img-50'><img src='" + HK.imgPath + "/assets/images/buy-1-get-1-50.png' alt='buy one get one'/></span>";
    }
  }

});
Handlebars.registerHelper('renderTagClass', function (arr, key) {

  if (arr.length > 0) {
    if (_.contains(arr, key)) {
      return "tag-cntnr-50";
    }
  }

});