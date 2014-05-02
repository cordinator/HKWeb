if (typeof(HK) == 'undefined') {
  HK = {};
}
var checkFilterFlag =0;
var filterNumberOfResults = 0;
HK.brandValue = [];
HK.tmpStr = []; 
HK.filterName = [];
HK.priceRange =[];
HK.sortRange =[];
var filterNameTemp = [];
var resetFlag = 0;
HK.flag = 0; // This is for the tracking of the filtered and unfiltered data.
HK.filterNot =[];
HK.alreadySelectedFilter = [];
var trackLoadMore1 = 0;
var trackLoadMore2=0;
HK.positionDiv=[];
var fixedBrand="";

function getFilteredData(currentPage, itemsPerPage){	
	HK.flag = 1;
	trackLoadMore1 =0;
	var brandString = "";
	if(HK.brandValue.length > 0){
		brandString = HK.brandValue.join('~');
	}
	if(fixedBrand !=""){
			brandString = fixedBrand +"~" + brandString;
	}
	
	   filterString = formFilterString();       
	  	    var urlFormed, urlToPush = "";
	  	    var params = {};
	  	    var loadByCat = false;
	  	    var navKey = HK.getParamFromURL('navKey');

	  	      params.pageNo = currentPage;
	  	      params.perPage = itemsPerPage;
	  	      
	  	    urlFormed = "&catPrefix=".concat(catPrefixStr).concat("&"+HK.CatalogLoaderConstants.BRAND_PARAM+"=").concat(brandString).concat("~&"+HK.CatalogLoaderConstants.FILTER_PARAM+"=").concat(filterString+",;")
	          .concat("&pageNo=").concat(currentPage);
	         
	  	      urlFormed = "?".concat('navKey=').concat(navKey).concat(urlFormed);
	  	      
	  	      if (params.perPage) {
	  	        urlFormed = urlFormed.concat("&perPage=").concat(params.perPage);
	  	      }
	  	      if(HK.priceRange.length > 0){
	  	    	urlFormed = urlFormed.concat("&minPrice=").concat(HK.priceRange[0]).concat("&maxPrice=").concat(HK.priceRange[1]);
	  	      }
	  	    if(HK.sortRange.length > 0){
	  	    	urlFormed = urlFormed.concat("&srtBy=").concat(HK.sortRange[0]).concat("&srtType=").concat(HK.sortRange[1]);
	  	      }
	  	      
	  	    var url = (CONTEXT_ROOT + "/api/catalog/results").concat(urlFormed);
	  	    	fetchFromURL(url,currentPage,itemsPerPage);
	           return currentPage;
}

function URL(currentPage, itemsPerPage){
	    HK.flag = 0;
	    trackLoadMore2=0;
	    var urlFormed, urlToPush = "";
	    var params = {};
	    var loadByCat = false;
	    var navKey = HK.getParamFromURL('navKey');

	      params.pageNo = currentPage;
	      params.perPage = itemsPerPage;

	      urlToPush = urlToPush.concat("&pageNo=").concat(params.pageNo);
	      urlToPush = urlToPush.concat("&perPage=").concat(params.perPage);
	      
	    	  urlFormed = "/".concat(navKey).concat("?pageNo=").concat(params.pageNo);
	      
	      	      
	      if (params.perPage) {
	        urlFormed = urlFormed.concat("&perPage=").concat(params.perPage);
	      }
	    var url = (CONTEXT_ROOT + "/api/catalog/results").concat(urlFormed);
	    var currNavKey = HK.getParamFromURL('navKey');
	    var utmSource = HK.getParamFromURL('utm_source');
	    var utmMedium = HK.getParamFromURL('utm_medium');
	    var utmCampaign = HK.getParamFromURL('utm_campaign');

	    urlToPush = '?'.concat("navKey=").concat(currNavKey).concat(urlToPush);

	    if (utmSource != "") {
	      urlToPush = urlToPush.concat("&utm_source=").concat(utmSource);
	    }
	    if (utmMedium != "") {
	      urlToPush = urlToPush.concat("&utm_medium=").concat(utmMedium);
	    }
	    if (utmCampaign != "") {
	      urlToPush = urlToPush.concat("&utm_campaign=").concat(utmCampaign);
	    }
	    
	    fetchFromURL(url,currentPage,itemsPerPage);
	    	
         return currentPage;
	  }

function fetchFromURL(url,currentPage,itemsPerPage){	
	
	var spinner = document.getElementsByClassName('icn-loader-large')[0];
	spinner.style.display ="block";
	microAjax( 
			url,
			function(data){
		  data = JSON.parse(data);
	  var results = data.results;
      var catalog = results.catalog;
      if(catalog !=null){
      var variants = catalog.variants;	
      
      // This is to show the total number of results can be filtered also
      var totalNumberOfResults = catalog.totalVariants; 
      if(checkFilterFlag == 1){
    	  filterNumberOfResults = totalNumberOfResults;
      } 
	  document.getElementsByClassName('load_more')[0].style.display = "block";
      if(parseInt(totalNumberOfResults) < parseInt(itemsPerPage) || parseInt(totalNumberOfResults/24)== trackLoadMore1 || parseInt(totalNumberOfResults/24)== trackLoadMore2){
    	  document.getElementsByClassName('load_more')[0].style.display = "none";
      }

      spinner.style.display ="none";
      if(parseInt(totalNumberOfResults)>0){
    	  HK.showCatalogData(variants,currentPage);
      }else{
    	  document.getElementsByClassName('load_more')[0].style.display = "none";
    	  document.getElementById('sortANDfilter').style.display = "none";
    	  document.getElementById('variantResultView').innerHTML = "<div class='no-pd font20 semi_bold'>No Data Found</div>";
      }
      }else{
    	  spinner.style.display ="none";
    	  document.getElementsByClassName('load_more')[0].style.display = "none";
    	  document.getElementById('sortANDfilter').style.display = "none";
    	  document.getElementById('variantResultView').innerHTML = "<div class='no-pd font20 semi_bold'>No Data Found</div>";
      }
		 });
}
function forAnchorClass(variants,i){
	var str;
	if(variants[i].oos){
		str = 'pd_hldr left out_of_stock';
		}else{
			str = 'pd_hldr left';
		}
	return str;
}

function OutOfStock(variants,i){
	var str2;
	if(variants[i].oos){
		str2 = '<div class="out_mask"></div>';
		}else{
			str2 = '';
		}
	return str2;
}

function forMedImg(variants,i){
	var imgURl;
	if(variants[i].medImg !=null){
		imgURL = variants[i].medImg.slink;
		}else{
			imgURL = '';
		}
	return imgURL;
}

 HK.showCatalogData = function(variants,currentPage){
	   	  var currentFlag = HK.flag;
	   var catalogDiv = '<div id = "load_more_DIV'+currentPage+'">' ;
	   for(var i=0 ; i<variants.length;i++){
	 	 catalogDiv += '<a class="'+forAnchorClass(variants,i)+'" href="'+variants[i].url+'" onclick="javascript:storePosition(this);">';

	 	catalogDiv += '<div class="pd_image left" style="background:url('+forMedImg(variants,i)+')no-repeat center center;background-size:contain;">'+OutOfStock(variants,i)+'</div>';
	 	catalogDiv += '<div class="pd_info left">';
	 	catalogDiv +='<div class="pd_name font12">'+variants[i].name+'</div>';
	 	if(variants[i].freebieName != ""){
	 		catalogDiv +='<span class="offer-text">OFFER</span>';
	 	}
		if(variants[i].siblingVariants){
			catalogDiv += '<div class="varnt-availble">('+variants[i].siblingVariants+' more variants available)</div>';
		}
		if(variants[i].rating){
			catalogDiv += '<div>Rating:';
			catalogDiv += '<div class="rtng-star-s">';
			catalogDiv += '<div class="rtng-usr" style="width:'+(variants[i].rating/5)*100+'%"></div>';
			catalogDiv += '</div>';
			catalogDiv += '</div>';
		}
			if(variants[i].freebieName){
				catalogDiv +=' <div class="fnt-sz10" style="color:#333;text-decoration:underline">'+variants[i].freebieName+' FREE</div>';
	        }
			catalogDiv +=' <div class="">';
	         if(variants[i].discount){
	        	 catalogDiv +=' <div class="pd_old_price font12">Rs. '+variants[i].mrp+'</div><div class="pd_discount font12">'+variants[i].discount+'% off</div>';
	          }
	         catalogDiv +='</div>';
	         catalogDiv +='<div class=" font15"> Rs.'+variants[i].offerPrice+'</div>';
									
	         catalogDiv +='</div>';
			
	         catalogDiv +='</a>';	         	        	         
	   }
	   // This is to check that we are in which loadmore event.
	   if(currentFlag != HK.flag){
		   document.getElementById('variantResultView').innerHTML ="";   
	   }
	   document.getElementById('variantResultView').innerHTML = document.getElementById('variantResultView').innerHTML + catalogDiv;
}

function imageURL(){
	var url = "/api/catalog/results?catPrefix=snt-pt-mg~&brands=&fl=pageNo=1&perPage=24";
    	fetchFromURL(url,1);
     return currentPage;
}
// To handle the back button of browser
window.onbeforeunload = function(evt){  
if (typeof evt == 'undefined')    
evt = window.event;   
    if(evt)   
    {  
    // TODO there should be some technique to update a traking variable here
	// only
    	document.cookie = "track1=;path=/; expires=Thu, 01 Jan 1970 00:00:01 GMT;"; 
    	document.cookie = "track2=;path=/; expires=Thu, 01 Jan 1970 00:00:01 GMT;";
    	del_cookie("brandValue");
    	del_cookie("filterValue");
    	del_cookie("position");
    	unique(HK.brandValue);
    	unique(HK.tmpStr);
    	if(parseInt(trackLoadMore1) != 0 && HK.clickMenu == 0){
    		document.cookie = "track1="+ trackLoadMore1+";path=/ ;expires=Thu, 01 Jan 2015 00:00:01 GMT;";   		
    	}else if(parseInt(trackLoadMore2) != 0 && HK.clickMenu == 0){
    		document.cookie = "track2="+ trackLoadMore2+";path=/ ;expires=Thu, 01 Jan 2015 00:00:01 GMT;";  
    		document.cookie = "brandValue="+ HK.brandValue.join('~')+";path=/ ;expires=Thu, 01 Jan 2015 00:00:01 GMT;";  
    		document.cookie = "filterValue="+ HK.tmpStr.join(';')+";path=/ ;expires=Thu, 01 Jan 2015 00:00:01 GMT;";
    	}   	
    		document.cookie = "position="+ HK.positionDiv[0]+":"+HK.positionDiv[1]+";path=/ ;expires=Thu, 01 Jan 2015 00:00:01 GMT;"; 
    } 
}  
function del_cookie(name)
{
	
	document.cookie = name + '=; path=/;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

function getCookie(c_name) {
    var i, x, y, ARRcookies = document.cookie.split(";");
    for (i = 0; i < ARRcookies.length; i++) {
        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
        x = x.replace(/^\s+|\s+$/g, "");
        if (x == c_name) {
            return unescape(y);
        }
    }
}
 function storePosition(event){
	 HK.positionDiv.splice(0,HK.positionDiv.length);
	 var position = event.getBoundingClientRect();
		var x = position.left;
		var y = position.top ;
		for(var i=0;i<2;i++){
			if(i == 0){
				HK.positionDiv.push(x);	
			}if(i == 1){
				HK.positionDiv.push(y);
			}			
		}
 }
 function showDivPos(){
	 debugger;
	 var posArray = getCookie("position");
	 posArray = posArray.split(":");
	 window.scrollTo(parseInt(posArray[0]),parseInt(posArray[1]));
	 del_cookie("position");
 }

// Above code with the Jquery is replaced by the native javascript.
window.onload = function(){
	var currentPage = 1;
	var currentPageNew = 1;
	var itemsPerPage = 24;
	
	var brId = HK.getParamFromURL('brands');
	if(brId){
		fixedBrand = brId;
	}
	 var loadMoreClicks1 = getCookie("track1"); 
	 if(loadMoreClicks1 === undefined ){
		 loadMoreClicks1 = "0";
	 }else{
		 if(!isNaN(loadMoreClicks1)){
			 trackLoadMore1 = parseInt(loadMoreClicks1); 
		 }
	 }
	 var loadMoreClicks2 = getCookie("track2");
	 if(loadMoreClicks2 === undefined ){
		 loadMoreClicks2 = "0";
	 }else{
		 if(!isNaN(loadMoreClicks2)){
			 trackLoadMore2 = parseInt(loadMoreClicks2); 
		 } 
	 }
	 
	 if(parseInt(loadMoreClicks1)>0){
			 currentPage = URL(currentPage,itemsPerPage*(parseInt(loadMoreClicks1)+1));			 
		currentPage = currentPage + parseInt(loadMoreClicks1);
		showDivPos();
	 }
	 if(parseInt(loadMoreClicks2)>0){
		 var arrBrand = getCookie("brandValue").split('~');
		 HK.brandValue=[];
		 for(var b=0;b<arrBrand.length;b++){
			 HK.brandValue[b] = parseInt(arrBrand[b]);
		 }
		 var arrFilter = getCookie("filterValue").split(';');
		 		HK.tmpStr = [];
		 for(b=0;b<arrFilter.length;b++){
			 HK.tmpStr[b] = arrFilter[b];
		 }
			 currentPageNew = getFilteredData(currentPageNew,itemsPerPage*(parseInt(loadMoreClicks2)+1));		
		 currentPageNew = currentPageNew + parseInt(loadMoreClicks2);
		 showDivPos();
	 }
	 	
		var numOfResult = document.getElementsByClassName('pagination-right')[0].id;
		var heading = document.getElementsByClassName('pd_heading left font14 semi_bold')[0];
		heading.innerHTML=heading.innerHTML.concat('('+ numOfResult +' results)');	
		
		// This is to check that if filters are already selected
		var counterCheck =0;
		var seeChecked = document.getElementsByClassName('seeCheck_H');
		var chklength = seeChecked.length;             
		for(k=0;k<chklength;k++)
		{		    	
		   if(seeChecked[k].checked){
			   counterCheck =1;
			   var value = seeChecked[k].value;
			   value = parseInt(value);
			   HK.brandValue.push(value); // brand is the only filter that
											// comes sometimes alredy selected
		   }
		} 
		// This is to make sure that brand image got clicked.
		var newNavKey = HK.getParamFromURL('navKey');
		newNavKey = newNavKey.replace(HK.CatalogLoaderConstants.SUB_CAT_PREFIX,"").toLowerCase();
		newNavKey = newNavKey.concat("~");
		if(counterCheck == 0 && newNavKey != catPrefixStr && parseInt(loadMoreClicks1)==0 && parseInt(loadMoreClicks2)==0){
			currentPage = getFilteredData(currentPage,itemsPerPage); 
		}else{
			if(parseInt(loadMoreClicks1)==0 && parseInt(loadMoreClicks2)==0){
			currentPageNew = getFilteredData(currentPageNew,itemsPerPage);
			}
			
		}				
		var loadMore = document.getElementsByClassName('btn grey font13')[0];
		loadMore.style.cursor = 'pointer';
		
		loadMore.onclick = function() {
			if(HK.flag == 0){	
				trackLoadMore2 =0;
					 URL(currentPage+1);	  
			   currentPage = currentPage +1;
			   trackLoadMore1 = trackLoadMore1 + 1;
			}
			if(HK.flag == 1){
				trackLoadMore1=0;
				getFilteredData(currentPageNew+1,itemsPerPage);
				currentPageNew = currentPageNew + 1;
				trackLoadMore2 = trackLoadMore2 +1;
			}
			
		}
		
		var applyButton = document.getElementsByClassName('btn blue right filter')[0];
		applyButton.style.cursor = 'pointer';

		applyButton.onclick = function applyClick(){
			onApplyClick();
		}
			function onApplyClick(){			
			if(resetFlag == 1){
				HK.brandValue = [];
				HK.tmpStr = [];
			}
			if(HK.filterNot.length >0){
				if(resetFlag == 0){
				document.getElementsByClassName('filter_hldr right font12')[0].style.color = "green";
				}
				else if(resetFlag == 1){
					document.getElementsByClassName('filter_hldr right font12')[0].style.color = "black";
				}
			}else{
				document.getElementsByClassName('filter_hldr right font12')[0].style.color = "black";
			}
			checkFilterFlag =1;
			currentPageNew =1;
			currentPage=1;	
			
			document.getElementsByClassName('page-hldr filter-result')[0].style.display = "none";
			document.getElementsByClassName('pd_list')[0].style.display = "block";			
			var element = document.getElementById('variantResultView');
			element.innerHTML = "";	
			hideAll('hide_H');
			currentPageNew = getFilteredData(currentPageNew,itemsPerPage);
			// This is to show the result directly onclick of apply.
			var position = element.getBoundingClientRect();
			var x = position.left;
			var y = position.top + screen.height;
			window.scrollTo(x,y);
		}
		
		var resetButton = document.getElementById('refresh-all');
		resetButton.style.cursor = 'pointer';
		// click event of the reset button
		resetButton.onclick = function(){
			var seeChecked = document.getElementsByClassName('seeCheck_H');
			var chklength = seeChecked.length;             
			for(k=0;k<chklength;k++)
			{		    	
			   if(seeChecked[k].checked){
				   seeChecked[k].checked = false;
			   }
			} 
			resetFlag =1;
			onApplyClick();
		}
		
		var cancelButton = document.getElementById('cancel-all');
		cancelButton.style.cursor = 'pointer';
		// click event of the cancel button
		cancelButton.onclick = function(){
			document.getElementsByClassName('page-hldr filter-result ')[0].style.display = "none";
			document.getElementsByClassName('pd_list')[0].style.display = "block";
		}
		var filterButton = document.getElementsByClassName('filter_hldr right font12')[0];
		filterButton.style.cursor = 'pointer';
		
		// click event of the filter button
		filterButton.onclick = function(){
			document.getElementsByClassName('page-hldr filter-result')[0].style.display = "block";
			document.getElementsByClassName('pd_list')[0].style.display = "none";
			var elements = document.getElementsByClassName('check_filter');
			for(var j=0;j<elements.length;j++){
				
				if(!searchStringInArray(elements[j].id,HK.filterNot) ){
					document.getElementById(elements[j].id).innerHTML = "";	
				}
			}
			if(HK.filterNot.length >0){
				showSelectedFilters();
			}
		}
	};
	// This is to show hide the div
	function toggleShowHide(classToToggle) {
		var elementToToggle = document.getElementById(classToToggle);
		hideRestAll(elementToToggle);
	    if (elementToToggle) {
	        var display = elementToToggle.style.display;
	        if (display == "none") {
	        	elementToToggle.style.display = "block";
	        } else {
	        	elementToToggle.style.display = "none";
	        }
	    }
	}
	
	function hideRestAll(divToProtect){	
			var elements = document.getElementsByClassName('hide_H');
			for(var i=0;i<elements.length;i++){
				if(elements[i] !== divToProtect){
					elements[i].style.display = "none";
				}
			}
	}
	function formClickEventArrayPrice(){
		HK.priceRange.splice(0,HK.priceRange.length);		
		HK.priceRange.push(document.getElementById('value-input-min').value);
		HK.priceRange.push(document.getElementById('value-input-max').value);
		
	}
	
	function formClickEventArrayBrand(event) {
		event = document.getElementsByClassName(event)[0];
		resetFlag = 0;
	    var value = event.value;
	    value = parseInt(value);
	    var appliedFilter = event.getAttribute('filterNot');
	    if(event.checked){
	    	HK.brandValue.push(value);
	    	HK.filterNot.push(appliedFilter);
	    }else{
	    	var index = HK.brandValue.indexOf(value);
	    	if(index != -1){
		    	HK.brandValue.splice(index, 1);		
	    	}
	    	var index2 = HK.filterNot.indexOf(appliedFilter);
	    	if(index2 != -1){
		    	HK.filterNot.splice(appliedFilter, 1);	
	    	}
	    }
	    return true;
	  }
	
	function formClickEventArrayFilter(event){	
		event = document.getElementsByClassName(event)[0];
		resetFlag = 0;
		var filterValue = event.name;
		var filterName = event.id;	
		var appliedFilter = event.getAttribute('filterNot');
	    if(event.checked ){	
	    	if(!searchStringInArray( filterName,filterNameTemp)){	
	    		filterValue = filterValue.replace("#","");
	    		HK.tmpStr.push(filterValue);	    			    		
	    	}else{	    		
	    		HK.tmpStr.push(filterValue);
	    	}	    	
	    	 filterNameTemp.push(filterName);
	    	 HK.filterName.push(filterName);
	    	 HK.filterNot.push(appliedFilter);
	    }else{
	    	var index = HK.tmpStr.indexOf(filterValue);
	    	if(index != -1){
	    		HK.tmpStr.splice(index, 1);	
	    	}
	    	var index2 = HK.tmpStr.indexOf(filterValue.replace("#",""));
	    	if(index2 != -1){
	    		HK.tmpStr.splice(index2, 1);	
	    	}
	    	var index3 = HK.filterNot.indexOf(appliedFilter);
	    	if(index3 != -1){
	    		HK.filterNot.splice(index3, 1);
	    	}
	    	var index4 = filterNameTemp.indexOf(filterName);
	    	if(index4 !=-1){
		    	filterNameTemp.splice(index4, 1);
	    	}

	    	
	    }
	    return true;
	  }
	// This is to find an item inside an array
	function searchStringInArray (str, strArray) {
	    for (var j=0; j<strArray.length; j++) {
	        if (strArray[j].match(str)) return true;
	    }
	    return false;
	}
	
	// This method is to process the HK.tmpStr array to form the correct
	// filterString value
	function formFilterString(){
		 HK.tmpStr.sort();
		 HK.tmpStr.reverse();
		var filterStr = HK.tmpStr.join(';');
		for(var i=0;i<HK.filterName.length;i++){
			filterStr = replaceAllSubStr('; '+HK.filterName[i] + '#:',',',filterStr);
		}
		filterStr = replaceAllSubStr(';',',;',filterStr);
		filterStr = replaceAllSubStr(' ','',filterStr);
		filterStr = replaceAllSubStr('#','',filterStr);
		return filterStr;
	};
	
	function replaceAllSubStr(Find,Replace,Str){
		var re = new RegExp(Find, 'g');			
		Str = Str.replace(re, Replace);
		return Str;
	}
	
	function getSortingParameters(event){
		document.getElementById('variantResultView').innerHTML ="";
		var sortBy = event.getAttribute("data-srt-by");
		var sortType = event.getAttribute("data-srt-type");
		HK.sortRange.splice(0,HK.sortRange.length);
		HK.sortRange.push(sortBy);
		HK.sortRange.push(sortType);
		
		document.getElementsByClassName('sort_menu')[0].style.display = "none";
		var currentPageNew =1,itemsPerPage=24;
		document.getElementsByClassName('pd_mask')[0].style.display = "none";
		 getFilteredData(currentPageNew,itemsPerPage);		
	}
	function showSelectedFilters(){
		if(resetFlag == 0){
			for(var i=0;i<HK.filterNot.length;i++){
				document.getElementById(HK.filterNot[i]).innerHTML = "applied";				
			}			
		}else if(resetFlag == 1){
			for(i=0;i<HK.filterNot.length;i++){
				document.getElementById(HK.filterNot[i]).innerHTML = "";				
			}
		}		
	}
	function hideAll(classToHide){
		var elementsToHide = document.getElementsByClassName(classToHide);	
		for(var i=0;i<elementsToHide.length;i++){
			elementsToHide[i].style.display = "none";
		}
	}
	 HK.getParamFromURL =  function(paramName) {
	    paramName = paramName.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
	    var regexS = '[\\?&]' + paramName + "=([^&#]*)";
	    var regex = new RegExp(regexS);
	    var results = regex.exec(window.location.href);
	    if (results == null)
	      return "";
	    else
	      return results[1];
	  }
	 
	 function unique(array) {
		    for (var c = [], d = {}, a = 0; a < array.length; a++) {
		        d[array[a]] || (c.push(array[a]), d[array[a]] = !0);
		    }
		    return c;
		}

	 // To update Filters as per the selected filters
	 function updateFilterValues(currentEvent,currentDiv){
		 HK.alreadySelectedFilter.splice(0, HK.alreadySelectedFilter.length);
		 var seeChecked = document.getElementsByClassName('seeCheck_H');
			var chklength = seeChecked.length;             
			for(k=0;k<chklength;k++)
			{		    
			   if(seeChecked[k].checked){
				   HK.alreadySelectedFilter.push(seeChecked[k].name);
				   HK.alreadySelectedFilter = unique(HK.alreadySelectedFilter);
			   }
			} 
		 var brandString = "";
		 if(HK.brandValue.length > 0){
				 brandString = HK.brandValue.join('~');
			}else{
				brandString = HK.brandValue.join('~');
			}	
			    filterString = formFilterString();
			  	    var urlFormed, urlToPush = "";
			  	    var params = {};
			  	    var loadByCat = false;
			  	    var navKey = HK.getParamFromURL('navKey');

			  	       var currentPage=1;
			  	       var itemsPerPage=24;

			  	    urlFormed = "&catPrefix=".concat(catPrefixStr).concat("&"+HK.CatalogLoaderConstants.BRAND_PARAM+"=").concat(brandString).concat("~&"+HK.CatalogLoaderConstants.FILTER_PARAM+"=").concat(filterString+",;")
			          .concat("&pageNo=").concat(currentPage);
			         
			  	      urlFormed = "?".concat('navKey=').concat(navKey).concat(urlFormed);
			  	      
			  	      if (itemsPerPage) {
			  	        urlFormed = urlFormed.concat("&perPage=").concat(itemsPerPage);
			  	      }
			  	      if(HK.priceRange.length > 0){
			  	    	urlFormed = urlFormed.concat("&minPrice=").concat(HK.priceRange[0]).concat("&maxPrice=").concat(HK.priceRange[1]);
			  	      }
			  	    if(HK.sortRange.length > 0){
			  	    	urlFormed = urlFormed.concat("&srtBy=").concat(HK.sortRange[0]).concat("&srtType=").concat(HK.sortRange[1]);
			  	      }
			  	      
			  	    var url = (CONTEXT_ROOT + "/api/catalog/results").concat(urlFormed);
			  	    var spinner = document.getElementsByClassName('icn-loader-large')[0];
			  	    spinner.style.display ="block";
		 microAjax( url,function(data){
				  data = JSON.parse(data);
				  var results = data.results;
				  var catalog = results.catalog;
				  if(catalog !=null){
				  var filters = catalog.filters;
				  var brands = catalog.brands;
				  updateFilterValuesHTML(brands,filters,currentDiv,currentEvent);	
				  spinner.style.display ="none";
				  }else{
					  spinner.style.display ="none";
					  document.getElementById('variantResultView').innerHTML = "<div class='no-pd font20 semi_bold'>No Data Found</div>";
				  }
				 });
		 return true;
	 }
	 
	 function updateFilterValuesHTML(brands,filters,currentDiv,currentEvent){		 
		 var div ='<div>';
		 for(var i=0;i<filters.length;i++){
	        if(filters[i].filterValues.length > 0)  {  
	       div += ' <div href="javascript:void(0);" class="list_item ellip font13" style="cursor:pointer" onClick ="toggleShowHide('+'\''+filters[i].filterName.replace(" ","_")+'ID'+'\''+');">'+filters[i].filterName+'<span class="check_filter" id="'+filters[i].filterName+'"></span></div>';
	         div +=  ' <div class="filter-list font13 hide_H" id="'+filters[i].filterName.replace(" ","_")+'ID'+'" >';
	                for(var j=0;j<filters[i].filterValues.length;j++){
	                     if(filters[i].filterValues[j].selected){
	                    
	                    	 div +=  '  <div href="javascript:void(0);" event="filterByAttr" class="list_item1 bd_btm" onClick="javascript:checkBox(\'anchorDiv_'+j+i+'\');formClickEventArrayFilter(\'anchorDiv_'+j+i+'\');updateFilterValues(\'anchorDiv_'+j+i+'\',\''+filters[i].filterName.replace(" ","_")+'ID'+'\''+');">';
	                    		 div +=  '   <input filterNot="'+filters[i].filterName+'" checked="checked" class="filterChk left seeCheck_H anchorDiv_'+j+i+'" id="'+filters[i].name+'" name =" '+filters[i].name+'#:'+filters[i].filterValues[j].filterValue+'" value="'+filters[i].filterValues[j].value+'" type="checkbox" onClick="javascript:checkBox(\'anchorDiv_'+j+i+'\');"/>';
	                                               
	                    			 div +=  '   <span class="left">'+filters[i].filterValues[j].value+'</span>';
	                    				 div +=  '    <span class="right">('+filters[i].filterValues[j].noOfVariants+')</span>';
	                    					 div +=  '      <div class="clear"></div>';
	                    						 div +=  '    </div>';
	                     
	                     }else{	                  
	                    	 div +=  '  <div href="javascript:void(0);" event="filterByAttr" class="list_item1 bd_btm" onClick="javascript:checkBox(\'anchorDiv_'+j+i+'\');formClickEventArrayFilter(\'anchorDiv_'+j+i+'\');updateFilterValues(\'anchorDiv_'+j+i+'\',\''+filters[i].filterName.replace(" ","_")+'ID'+'\''+');">';
                    		 div +=  '   <input filterNot="'+filters[i].filterName+'" class="filterChk left seeCheck_H anchorDiv_'+j+i+'" id="'+filters[i].name+'" name =" '+filters[i].name+'#:'+filters[i].filterValues[j].filterValue+'" value="'+filters[i].filterValues[j].value+'" type="checkbox" onClick="javascript:checkBox(\'anchorDiv_'+j+i+'\');"/>';
                                               
                    			 div +=  '   <span class="left">'+filters[i].filterValues[j].value+'</span>';
                    				 div +=  '    <span class="right">('+filters[i].filterValues[j].noOfVariants+')</span>';
                    					 div +=  '      <div class="clear"></div>';
                    						 div +=  '    </div>';
	                     }
	                    
	                  
	                }
	              
	                div +=  ' </div>';
	        }
		 }
		 div +=  ' </div>';
		 document.getElementById('filterWrapper').innerHTML = div;	
		 var all = document.getElementsByClassName('seeCheck_H');
		 for(var k=0;k<all.length;k++){
			 all[k].checked =false;
			 if(searchStringInArray (all[k].name, HK.alreadySelectedFilter) && all[k].name != ""){
				 all[k].checked =true; 
			 }
		 }
		 hideRestAll(document.getElementById(currentDiv));
	 }
	 
	 function checkBox(id){
		 var ele = document.getElementsByClassName(id)[0];
		 if(ele.checked){
			 ele.checked = false;			 
		 }else{
			 ele.checked = true;
		 }
		 return true;
	 }