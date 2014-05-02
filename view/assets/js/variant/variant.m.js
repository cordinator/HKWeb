
var headIndex = [];
	
window.onload =function(){
	for(var k=0;k<document.getElementsByClassName("diff-attr").length;k++){
		headIndex.push(document.getElementsByClassName("diff-attr")[k]);
	}
	storePreSelectedVariants();
	// variant bought together in native JS. and remove dependency on boughtTogrtherTemplate.m.jsp
	microAjax(CONTEXT_ROOT+HK.urls.boughtTogether + "browse/" + HK.vpc.variantId + "/boughtTogether", 
			function (responseData){
		var responseData = JSON.parse(responseData);
		var arrayList = responseData.results.bt_var_lst;
	    var btVariantSize = responseData.results.ttl_bt_var;
	    	 var variantContainer = document.getElementById('btCont');
	    	 removeClassName(variantContainer, 'loader');
	    	 if (arrayList.length > 0) {
	             for (var i = 0, len = arrayList.length; i < len; i++) {
	                 if (i in arrayList) {
	                     var content = showBoughtTogetherItemTemplate(arrayList[i].bt_var);
	                     variantContainer.innerHTML = content +variantContainer.innerHTML ;
	                 }
	             }
	         }
	         else {
	        	 document.getElementsByClassName('also_bought_h')[0].style.display = 'none';
	        	 clearOutput(document.getElementById('alsoBought'));
	        	 clearOutput(document.getElementById('btCont'));
	         }
	    
	});
		
	microAjax(CONTEXT_ROOT+HK.urls.variantOffer + HK.vpc.oldVariantId + "/combos",
			function(responseData){
		var responseData = JSON.parse(responseData);
		var arrayList = responseData.results.combos;
	    var comboVariantSize = arrayList.length;
	       
	    var offersContainer = document.getElementById('offersCont');
	    removeClassName(offersContainer, 'loader');
	    if(arrayList.length > 0){
	    	document.getElementById('combo_offer_H').style.display ="block"; 
	        for (var i = 0, len = arrayList.length; i < len; i++) {
	            if (i in arrayList) {
	                var content = showVariantComboItemTemplate(arrayList[i]);
	                offersContainer.innerHTML = content + offersContainer.innerHTML;
	            }
	        }
	        document.getElementById('offers').style.display ="block";
	    }
	    else {
	    	clearOutput(document.getElementById('offers'));
	        clearOutput(document.getElementById('offersCont'));
	    }
	});
	
	microAjax(CONTEXT_ROOT+HK.urls.variantOffer + HK.vpc.oldVariantId +   "/freeVariant",
			function(responseData){
		var responseData = JSON.parse(responseData);
		var freebieResponse = responseData.results;
        var freebieContainer = document.getElementById('freebieName');
        removeClassName(freebieContainer, 'loader');
        var freebieName = freebieResponse.nm;
        if (freebieName  != null) {
        	document.getElementById('offer_box_H').style.display = "block";
            var freebieHtml = "Free " + freebieName;
            freebieContainer.innerHTML = freebieHtml + freebieContainer.innerHTML;
        }
        else {
        	
        }
	});
	variantCombination();
	
}

/*function notifyMe(event){
	var storeVariantId = event.varId;
	document.forms[0].action="/beta/notify/NotifyMe.action?storeVariantId="+storeVariantId;
  	document.forms[0].method="post";
  	document.forms[0].submit();
}*/
function forImageText(var_item){
	if(var_item.oos){ 
		return "img-inactive"; 
		}
	return "";
}
function showBoughtTogetherItemTemplate(var_item){
	
	var div='';
	
	div += '<a class="pd_hldr"'+ forImageText(var_item)+'href="'+var_item.url+'"> ';
	div += ' <div class="pd_image left " style="background: url(\''+var_item.pr_img.s_link +'\')no-repeat left center;background-size: contain;"><div class="out_maks"></div></div>';
	div += ' <div class="pd_info left">';
		div += ' <div class="pd_name font12">';
	div += var_item.nm +'  </div>';
		div += '  <div class="pd_summ">';
	  		if(var_item.rating){
	div += '  <div class="">';
		div += '  <div class="rtng-star-s">';
			div += '   <div class="rtng-usr" style="width:'+(var_item.rating/5)*100+'%"></div>';
				div += ' </div>';
					div += '  </div>';
	  		}	      
	        if(var_item.nv){
	        div += '   <div class="varnt-availble">';	          
	        div += '('+var_item.nv +'more variants available)</div>';
	        }
	        if(var_item.discount){
	        div += ' <div class="pd_old_price font12">';
	        div += 'Rs. '+ var_item.mrp +'</div>';
	        	div += ' <div class="pd_discount font12">';
	         
	          div += var_item.discount+'% off</div>';
	        }
	        	div += ' <div class="font15">';
	         
	        	div += ' Rs. '+var_item.offer_pr+' </div>';

	        		div += ' </div>';
	        			div += ' </div>';
	        				div += ' </a>';	
	    return div;
}
function showVariantComboItemTemplate(combo_item){
	var div = '';
	div += '<a class="pd_hldr" '+forImageText(combo_item)+'href="'+combo_item.url+'"> ';
		div += ' <div class="pd_image left " style="background: url(\''+combo_item.m_link+'\')no-repeat left center;background-size: contain;"><div class="out_mask"></div></div>';
	div += ' <div class="pd_info left">';
		div += ' <div class="pd_name font12">';
	div += combo_item.nm+' </div>';
		div += '  <div class="pd_summ">';
	  		if(combo_item.rating){
	div += '   <div class="">';
		div += '    <div class="rtng-star-s">';
			div += '    <div class="rtng-usr" style="width:'+(combo_item.rating/5)*100+'%"></div>';
				div += '  </div>';
					div += '  </div>';
	  		}
	        if(combo_item.nv){
	        div += '   <div class="varnt-availble">';
	      div += ' ('+combo_item.nv +'more variants available) </div>';
	        }
	        if(combo_item.discount){
	        div += '  <div class="pd_old_price font12">';	         
	        div += '   Rs. '+combo_item.mrp+'</div>';
	        	div += ' <div class="pd_discount font12">';	          
	          div +=  combo_item.discount+'% off </div>';
	        }
	        	div += ' <div class="font15">';	          
	        	div += 'Rs.'+combo_item.offer_pr+' </div>';

	        		div += ' </div>';
	        			div += ' </div>';
	        				div += '  </a>';
	       div += '';
	       return div;
}
function removeClassName(element, classToRemove){
	if(element){
	   if ( element.className ){
	      var arrList = element.className.split(' ');
	      var strClassUpper = classToRemove.toUpperCase();
	      for ( var i = 0; i < arrList.length; i++ ){
	         if ( arrList[i].toUpperCase() == strClassUpper ){
	            arrList.splice(i, 1);
	            i--;
	         }
	      }
	      element.className = arrList.join(' ');
	   }
	}
	}

function checkInt(str){
	if(str !=null){
		for(var i=0;i<str.length;i++){
			if(str.charCodeAt(i) >=48 && str.charCodeAt(i) <= 57){
				return true;
			} 
		}
	}
	return false;
}
function forVariant(event){
	var attrName = event.getAttribute("attr-val-name");
	var keyString="";
	var Whey1 = getCookie('1whey');
	var Whey2 = getCookie('2whey');
	if(!checkInt(attrName) && headIndex.length>0){
		 keyString = headIndex[0].getAttribute("attr-name")+':'+attrName+';'+headIndex[1].getAttribute("attr-name")+':'+Whey2+';';
	}else if(Whey2 != attrName && headIndex.length>0){
		 keyString = headIndex[0].getAttribute("attr-name")+':'+Whey1+';'+headIndex[1].getAttribute("attr-name")+':'+attrName+';';
	}
	var currentURL = document.URL;
	if(HK.getParamFromURL("navKey")){
	currentURL = currentURL.substring(0,currentURL.indexOf('VRNT-')+ 5);
	if(HK.vpc.availableVariant[keyString] == undefined){
		currentURL = currentURL + event.getAttribute('default-variant');
	}else{
		currentURL = currentURL + HK.vpc.availableVariant[keyString];
	}
	}else{
		currentURL = currentURL +"?navKey=VRNT-"+event.getAttribute("default-variant");
	}
	
	location.href = currentURL;
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
function storePreSelectedVariants(){
	var index =1;
	var getSelectedLi = document.getElementsByTagName('li');
	for(var i=0;i<getSelectedLi.length;i++){
		if(getSelectedLi[i].getAttribute('class') && getSelectedLi[i].getAttribute('class').indexOf('selected-val') != -1){
			var name = getSelectedLi[i].getAttribute('attr-val-name');
			document.cookie = index+'whey='+name +'; path=/;expires=Thu, 01 Jan 2015 00:00:01 GMT;';	
			index = index+1;
		}
	}
}
function del_cookie(name)
{ 
	document.cookie = name + '=; path=/;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

function availability(){
	var li = document.getElementsByTagName('li');
	var indexString = "";
	if(headIndex.length >0){
	for(var i=0;i<li.length;i++){
		if(checkInt(li[i].getAttribute('attr-val-name'))){
			indexString = headIndex[0].getAttribute("attr-name")+':'+getCookie('1whey')+';'+headIndex[1].getAttribute("attr-name")+':'+li[i].getAttribute('attr-val-name')+';';
			if(HK.vpc.availableVariant[indexString] == undefined){
				li[i].className = li[i].className + 'inactive';
			}
		}else{
			indexString = headIndex[0].getAttribute("attr-name")+':'+li[i].getAttribute('attr-val-name')+';'+headIndex[1].getAttribute("attr-name")+':'+getCookie('2whey')+';';
			if(HK.vpc.availableVariant[indexString] == undefined){
				li[i].className = li[i].className + 'inactive';
			}
		}
	}
}
}

function variantCombination(){
	var li = document.getElementsByTagName('li');
	
    for(key in HK.vpc.availableVariant){    	
    	if(HK.vpc.availableVariantOOS[key] == "true" && searchStringInArray(getCookie('1whey'),filterKeyString(key))){
    		for(var i=0;i<li.length;i++){
    		   if(checkInt(li[i].getAttribute('attr-val-name')) && searchStringInArray(li[i].getAttribute('attr-val-name'),filterKeyString(key)) && li[i].getAttribute('class').indexOf('selected-val') == -1){    			    
    				li[i].className = li[i].className + " oostock";
    			}    		   
    	}
    }
    	if(HK.vpc.availableVariantOOS[key] == "true" && searchStringInArray(getCookie('2whey'),filterKeyString(key))){
    		for(var i=0;i<li.length;i++){   			
    		   if(!checkInt(li[i].getAttribute('attr-val-name')) && searchStringInArray(li[i].getAttribute('attr-val-name'),filterKeyString(key)) && li[i].getAttribute('class').indexOf('selected-val') == -1){    			    
    				li[i].className = li[i].className + " oostock";
    			}  			
    	}
    }
	}
    availability();
}
    function filterKeyString(key){
    	var tempNames=key.split(';');
    	var names=[];
    	for(var i=0;i<tempNames.length;i++){
    		if(tempNames[i].split(':')[1] != undefined)
    		  names.push(tempNames[i].split(':')[1]);
    	}
    	return names;   	
    }
    function searchStringInArray (str, strArray) {
	    for (var j=0; j<strArray.length; j++) {
	        if (strArray[j].match(str)) return true;
	    }
	    return false;
	}

