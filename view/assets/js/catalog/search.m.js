if (typeof (HK) == 'undefined') {
	HK = {};
}

HK.sortRange = [];
HK.priceRange = [];
HK.filterName = [];
HK.trackLoadMore = 0;
function getFilteredData(currentPage, itemsPerPage) {
	var urlFormed, urlToPush = "";
	urlFormed = "?".concat("txtQ=").concat(query);

	urlFormed = urlFormed.concat("&pageNo=").concat(currentPage);

	if (itemsPerPage) {
		urlFormed = urlFormed.concat("&perPage=").concat(itemsPerPage);
	}

	if (HK.sortRange.length > 0) {
		urlFormed = urlFormed.concat("&srtBy=").concat(HK.sortRange[0]).concat(
				"&srtType=").concat(HK.sortRange[1]);
	}
	var url = (CONTEXT_ROOT + "/api/search/results").concat(urlFormed);
	url = encodeURI(url);
	var spinner = document.getElementsByClassName('icn-loader-large')[0];
	spinner.style.display = "block";
	microAjax(
			url,
			function(data) {
				data = JSON.parse(data);
				var results = data.results;
				var catalog = results.catalog;
				if (catalog != null) {
					var totalVariants = catalog.totalVariants;
					var browseCategoryListing = catalog.browseCategoryListing;
					var variants = catalog.variants;
					var priceRange = catalog.priceRange;
					if (variants.length > 0) {
						spinner.style.display = "none";
						if (parseInt(totalVariants) < 24
								|| parseInt(totalVariants / 24) == HK.trackLoadMore) {
							document.getElementById('loadMore_H').style.display = "none";
						} else {
							document.getElementById('loadMore_H').style.display = "block";
						}
						showSearchData(browseCategoryListing);
						showCatalogData(variants, 1);
						showPriceData(priceRange);
					} else {
						spinner.style.display = "none";
						document.getElementById('loadMore_H').style.display = "none";
						document.getElementById('sortANDbrowse').style.display = "none";
						document.getElementById('variantResultView').innerHTML = "<div class='no-pd font20 semi_bold'>No Data Found</div>";

					}
				} else {
					spinner.style.display = "none";
					document.getElementById('loadMore_H').style.display = "none";
					document.getElementById('sortANDbrowse').style.display = "none";
					document.getElementById('variantResultView').innerHTML = "<div class='no-pd font20 semi_bold'>No Data Found</div>";
				}
			});
	return currentPage;
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

window.onload = function() {
	var browseBy = document.getElementById('BrowseBySearch_H');
	browseBy.onclick = function() {
		// to disable the sortBy
	    document.getElementsByClassName('sort_menu')[0].style.display = "none";
		document.getElementsByClassName('pd_mask')[0].style.display = "none";
		
		if (document.getElementById('filterResultSearch_H').style.display == "none") {
			document.getElementById('filterResultSearch_H').style.display = "block";
		} else {
			document.getElementById('filterResultSearch_H').style.display = "none";
		}

	}
	var currentPage = 1;
	var itemsPerPage = 24;
	var loadMore = document.getElementById('loadMore_H');
	if (query.length > 0) {
		getFilteredData(currentPage, itemsPerPage);
		loadMore.onclick = function() {
			getFilteredData(currentPage + 1, itemsPerPage);
			currentPage = currentPage + 1;
			HK.trackLoadMore = HK.trackLoadMore + 1;
		}
	} else {
		loadMore.style.display = "none";
		document.getElementById('sortANDbrowse').style.display = "none";
		document.getElementById('variantResultView').innerHTML = "<div class='no-pd font20 semi_bold'>No Data Found</div>";
	}

}

function showCatalogData(variants, currentPage) {
	var catalogDiv = '<div id = "load_more_DIV' + currentPage + '">';
	for ( var i = 0; i < variants.length; i++) {
		catalogDiv += '<a class="' + forAnchorClass(variants, i) + '" href="'
				+ variants[i].url + '">';

		catalogDiv += '<div class="pd_image left" style="background:url('
				+ forMedImg(variants, i)
				+ ')no-repeat center center;background-size:contain;"></div>';
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
	// This is to check  that we are in which loadmore event.
	document.getElementById('variantResultView').innerHTML = document
			.getElementById('variantResultView').innerHTML
			+ catalogDiv;
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

function forMedImg(variants, i) {
	var imgURl;
	if (variants[i].medImg != null) {
		imgURL = variants[i].medImg.slink;
	} else {
		imgURL = '';
	}
	return imgURL;
}

function toggleShowHide(classToToggle) {
	var elementToToggle = document.getElementsByClassName(classToToggle);
	if (elementToToggle) {
		var display = elementToToggle[0].style.display;
		if (display == "none") {
			elementToToggle[0].style.display = "block";
		} else {
			elementToToggle[0].style.display = "none";
		}
	}
}

function showSearchData(browseCategoryListing) {
	var anchor = '<div id = "browseCategoryListing">';
	for ( var i = 0; i < browseCategoryListing.length; i++) {
		anchor += '<a class="sel-brand list_item1 bd_btm list_no_checkBox" href="'
				+ browseCategoryListing[i].url + '">';
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

function showPriceData(priceRange) {

}
