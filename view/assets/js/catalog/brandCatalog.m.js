if (typeof (HK) == 'undefined') {
	HK = {};
}

HK.sortRange = [];
HK.priceRange = [];
HK.trackLoadMore = 0;

function getFilteredData(currentPage, itemsPerPage) {
	HK.flag = 1;
	var brandString = "";
	filterString = "";
	var urlFormed, urlToPush = "";
	var params = {};
	var loadByCat = false;
	var navKey = HK.getParamFromURL('navKey');
	var brandValue = navKey.replace(HK.CatalogLoaderConstants.BRAND_PREFIX, "");
	params.pageNo = currentPage;
	params.perPage = itemsPerPage;

	urlFormed = "".concat("&brands=").concat(brandValue).concat("~&fl=")
			.concat(filterString + ",;").concat("&pageNo=").concat(currentPage);

	urlFormed = "?".concat(urlFormed);

	if (params.perPage) {
		urlFormed = urlFormed.concat("&perPage=").concat(params.perPage);
	}
	if (HK.priceRange.length > 0) {
		urlFormed = urlFormed.concat("&minPrice=").concat(HK.priceRange[0])
				.concat("&maxPrice=").concat(HK.priceRange[1]);
	}
	if (HK.sortRange.length > 0) {
		urlFormed = urlFormed.concat("&srtBy=").concat(HK.sortRange[0]).concat(
				"&srtType=").concat(HK.sortRange[1]);
	}
	var url = (CONTEXT_ROOT + "/api/catalog/results").concat(urlFormed);
	var spinner = document.getElementsByClassName('icn-loader-large')[0];
	spinner.style.display = "block";
	microAjax(url, function(data) {
		data = JSON.parse(data);
		var results = data.results;
		var catalog = results.catalog;
		if (catalog != null || parseInt(catalog.totalVariants) >0) {
		var totalVariants = catalog.totalVariants;
		var browseCategoryListing = catalog.browseCategoryListing;
		var variants = catalog.variants;
		var priceRange = catalog.priceRange;
		/*var minPrice = catalog.priceRange.minPrice;
		var maxPrice = catalog.priceRange.maxPrice;
		document.getElementById('exTO').innerHTML = minPrice;
		document.getElementById('exFR').innerHTML = maxPrice;
		document.getElementById('minPriceRange').value = minPrice;
		document.getElementById('maxPriceRange').value = maxPrice;*/
			spinner.style.display = "none";
			if (parseInt(totalVariants) < 24
					|| parseInt(totalVariants / 24) == HK.trackLoadMore) {
				document.getElementById('loadMore_H').style.display = "none";
			} else {
				document.getElementById('loadMore_H').style.display = "block";
			}
			showBrandData(browseCategoryListing, brandValue);
			HK.showCatalogData(variants, 1);
			// showPriceData(priceRange);
		}else{
			spinner.style.display = "none";
			document.getElementById('loadMore_H').style.display = "none";
			document.getElementById('sortANDbrowse').style.display = "none";
			document.getElementById('variantResultView').innerHTML = "<div class='no-pd font20 semi_bold'>No Data Found</div>";
		}
	});
}

window.onload = function() {
	var browseBy = document.getElementById('BrowseBy');
	browseBy.onclick = function() {
		// to disable the sortBy
	    document.getElementsByClassName('sort_menu')[0].style.display = "none";
		document.getElementsByClassName('pd_mask')[0].style.display = "none";
		
		if (document.getElementById('filterResult_H').style.display == "none") {
			document.getElementById('filterResult_H').style.display = "block";
		} else {
			document.getElementById('filterResult_H').style.display = "none";
		}

	}
	var currentPage = 1;
	var itemsperPage = 24
	getFilteredData(currentPage, itemsperPage); // values are hardcoded because they are fix

	var loadMore = document.getElementById('loadMore_H');
	loadMore.onclick = function() {
		getFilteredData(currentPage + 1, itemsperPage);
		currentPage = currentPage + 1;
		HK.trackLoadMore = HK.trackLoadMore + 1;
	}
};

function toggleShowHide(classToToggle) {
	var elementToToggle = document.getElementsByClassName(classToToggle);
	hideRestAll(elementToToggle);
	if (elementToToggle) {
		var display = elementToToggle[0].style.display;
		if (display == "none") {
			elementToToggle[0].style.display = "block";
		} else {
			elementToToggle[0].style.display = "none";
		}
	}
}
function hideRestAll(divToProtect) {
	var elements = document.getElementsByClassName('hide_H');
	for ( var i = 0; i < elements.length; i++) {
		if (elements[i] !== divToProtect) {
			elements[i].style.display = "none";
		}
	}
}
function showPriceData(priceRange) {
	//TODO code to get the two price values 
	HK.priceRange.splice(0, HK.priceRange.length);
	HK.priceRange.push(document.getElementById('value-input-min').value);
	HK.priceRange.push(document.getElementById('value-input-max').value);
}

function getSortingParameters(event) {
	document.getElementById('variantResultView').innerHTML = "";
	var sortBy = event.getAttribute("data-srt-by");
	var sortType = event.getAttribute("data-srt-type");
	HK.sortRange.splice(0, HK.sortRange.length);
	HK.sortRange.push(sortBy);
	HK.sortRange.push(sortType);

	document.getElementsByClassName('sort_menu')[0].style.display = "none";
	var currentPageNew = 1, itemsPerPage = 24;
	document.getElementsByClassName('pd_mask')[0].style.display = "none";
	getFilteredData(currentPageNew, itemsPerPage);
}
function showBrandData(browseCategoryListing, brandValue) {
	var anchor = '<div id = "browseCategoryListing">';
	for ( var i = 0; i < browseCategoryListing.length; i++) {
		anchor += '<a class="sel-brand list_item1 bd_btm list_no_checkBox" href="'
				+ browseCategoryListing[i].url
				+ '&brands='
				+ brandValue
				+ '" onClick="linkBrand(this)">';
		anchor += '<span class="left">' + browseCategoryListing[i].nm
				+ '</span>';
		anchor += '<span class="right">' + browseCategoryListing[i].np
				+ '</span>';
		anchor += '<div class="clear"></div>';
		anchor += '</a>';
	}
	document.getElementById('categoryFilterView').innerHTML = document
			.getElementById('categoryFilterView').innerHTML
			+ anchor;
}

function forAnchorClass(variants, i) {
	var str;
	if (variants[i].oos) {
		str = 'pd_hldr left out_of_stock';
	} else {
		str = 'pd_hldr left';
	}
	return str;
}

function OutOfStock(variants, i) {
	var str2;
	if (variants[i].oos) {
		str2 = '<div class="out_mask"></div>';
	} else {
		str2 = '';
	}
	return str2;
}

function forMedImg(variants, i) {
	var imgURl;
	if (variants[i].medImg != null) {
		imgURL = variants[i].medImg.s_link;
	} else {
		imgURL = '';
	}
	return imgURL;
}

HK.showCatalogData = function(variants, currentPage) {
	var currentFlag = HK.flag;
	var catalogDiv = '<div id = "load_more_DIV' + currentPage + '">';
	for ( var i = 0; i < variants.length; i++) {
		catalogDiv += '<a class="' + forAnchorClass(variants, i) + '" href="'
				+ variants[i].url
				+ '" onclick="javascript:storePosition(this);">';

		catalogDiv += '<div class="pd_image left" style="background:url('
				+ forMedImg(variants, i)
				+ ')no-repeat center center;background-size:contain;">'
				+ OutOfStock(variants, i) + '</div>';
		catalogDiv += '<div class="pd_info left">';
		catalogDiv += '<div class="pd_name font12">' + variants[i].name
				+ '</div>';
		if (variants[i].freebieName != "") {
			catalogDiv += '<span class="offer-text">OFFER</span>';
		}
		if (variants[i].siblingVariants) {
			catalogDiv += '<div class="varnt-availble">('
					+ variants[i].siblingVariants
					+ ' more variants available)</div>';
		}
		if (variants[i].rating) {
			catalogDiv += '<div>Rating:';
			catalogDiv += '<div class="rtng-star-s">';
			catalogDiv += '<div class="rtng-usr" style="width:'
					+ (variants[i].rating/5)*100 + '%"></div>';
			catalogDiv += '</div>';
			catalogDiv += '</div>';
		}
		if (variants[i].freebieName) {
			catalogDiv += ' <div class="fnt-sz10" style="color:#333;text-decoration:underline">'
					+ variants[i].freebieName + ' FREE</div>';
		}
		catalogDiv += ' <div class="">';
		if (variants[i].discount) {
			catalogDiv += ' <div class="pd_old_price font12">Rs. '
					+ variants[i].mrp
					+ '</div><div class="pd_discount font12">'
					+ variants[i].discount + '% off</div>';
		}
		catalogDiv += '</div>';
		catalogDiv += '<div class=" font15"> Rs.' + variants[i].offerPrice
				+ '</div>';

		catalogDiv += '</div>';

		catalogDiv += '</a>';
	}
	// This is to check that we are in which loadmore event.
	if (currentFlag != HK.flag) {
		document.getElementById('variantResultView').innerHTML = "";
	}
	document.getElementById('variantResultView').innerHTML = document
			.getElementById('variantResultView').innerHTML
			+ catalogDiv;
}
HK.getParamFromURL = function(paramName) {
	paramName = paramName.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
	var regexS = '[\\?&]' + paramName + "=([^&#]*)";
	var regex = new RegExp(regexS);
	var results = regex.exec(window.location.href);
	if (results == null)
		return "";
	else
		return results[1];
}
