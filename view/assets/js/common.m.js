if (typeof(HK) == 'undefined') {
  HK = {};
}
if (typeof(CONTEXT_ROOT) == 'undefined') {
  CONTEXT_ROOT = '';
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
HK.CatalogLoaderConstants = {

		  SUB_CAT_PREFIX :"SCT-",
		  MENU_LANDING :"CL-",
		  BRAND_PREFIX :"BR-",
		  BRAND_SEP : "~",
		  BRAND_PARAM : "brands",
		  FILTER_PARAM : "fl",
		  CAT_PARAM : "catPrefix"
		};
HK.clickMenu = 0;
window.addEventListener("orientationchange", function() {
	document.getElementsByTagName('input')[0].style.display = 'none';

	setTimeout(function() {
		document.getElementsByTagName('input')[0].style.display = 'BLOCK';
	}, 100);

}, false);

var div1;
function del_cookie(name)
{
	document.cookie = name + '=; path=/;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}
function toggleMenu(e) {
	var divClass = e.currentTarget.className;
	//This is to enable the autocomplete search functionality both the places simultaneously
	document.getElementsByName("txtQ")[0].value = "";
	clearOutput(document.getElementsByClassName("hk-search-box-result")[0]);
	document.getElementsByName("txtQ")[1].value = "";
	clearOutput(document.getElementsByClassName("hk-search-box-result")[1]);
	if(document.getElementsByClassName('sort_menu')[0]){
	document.getElementsByClassName('sort_menu')[0].style.display = "none";
	document.getElementsByClassName('pd_mask')[0].style.display = "none";
	}
		 del_cookie("track1");
		 del_cookie("track2");
		 HK.clickMenu =1;
	//document.getElementsByClassName('mask')[0].style.height = (document.height - 40) + 'px';
	//  if(document.body.clientHeight > document.height){
	//  document.getElementsByClassName('mask')[0].style.minHeight = (document.body.clientHeight - 40 ) + 'px';
	//  }
	//  else{
	//   document.getElementsByClassName('mask')[0].style.minHeight = (document.height - 50 ) + 'px'; 
	//  }
	if (divClass == 'menu') {
		e.currentTarget.className = e.currentTarget.className + " selected";
		document.getElementsByClassName('menu_con')[0].style.display = 'block';
		document.getElementsByClassName('mask')[0].style.minHeight = document.body.scrollHeight
				+ 'px';
		document.getElementsByClassName('mask')[0].style.display = 'block';
		div1 = e.currentTarget.className;
		document.getElementsByClassName('user')[0].className = 'user';
		document.getElementsByClassName('account_con')[0].style.display = 'none';
	} else if (divClass == 'user') {
		e.currentTarget.className = e.currentTarget.className + " selected";
		document.getElementsByClassName('account_con')[0].style.display = 'block';
		document.getElementsByClassName('mask')[0].style.minHeight = document.body.scrollHeight
				+ 'px';
		document.getElementsByClassName('mask')[0].style.display = 'block';
		div1 = e.currentTarget.className;

		document.getElementsByClassName('menu')[0].className = 'menu';
		document.getElementsByClassName('menu_con')[0].style.display = 'none';
	} else if (divClass == "mask" || divClass.indexOf("selected") != -1) {
		document.getElementsByClassName('menu_con')[0].style.display = 'none';
		document.getElementsByClassName('menu')[0].className = 'menu';
		document.getElementsByClassName('account_con')[0].style.display = 'none';
		document.getElementsByClassName('user')[0].className = 'user';
		document.getElementsByClassName('mask')[0].style.display = 'none';
	}
}
function toggleMainmenu(e) {
	var main = e.currentTarget;
	var x = document.getElementById('lis_item_sub');
	if (x.style.display != 'none') {
		x.style.display = 'none';
		main.className = 'list_item  ellip';
	} else {
		x.style.display = 'block';
		main.className = main.className + ' open semi_bold';
	}
}

function toggleMainmenu1(e) {
	var main = e.currentTarget;
	var x = document.getElementById('list_item_sub2');
	if (x.style.display != 'none') {
		x.style.display = 'none';
		main.className = 'list_item  ellip';
	} else {
		x.style.display = 'block';
		main.className = main.className + ' open semi_bold';
	}
}

function togglesort(e) {
	var con = e.currentTarget.className;
	var con1 = document.getElementsByClassName('pd_mask')[0];
	var cnt = document.getElementsByClassName('sort_menu')[0];

	if (cnt.style.display != 'none') {
		con1.style.display = 'none';
		cnt.style.display = 'none';
		con = 'sort_hldr left font12';
	} else {
		con1.style.display = 'block';
		cnt.style.display = 'block';
		con = con + ' blue_text';
		con1.style.height = (document.height - 190) + 'px';
	}
}

function togglefilter(e) {

	var con = document.getElementsByClassName('filter-brand')[0];
	if (con.style.display != 'none') {
		con.style.display = 'none';
		e.currentTarget.className = 'list_item ellip';
	} else {
		con.style.display = 'block';
		e.currentTarget.className = e.currentTarget.className
				+ ' open semi_bold';
	}

}

/*------------------------------------------------------------*/

function selectfl(e) {
	var a = e.target.className;
	if (a.indexOf('disabled') != -1) {
		e.target.className = e.target.className + ' selected';
		document.getElementsByClassName('buy_now')[0].innerHTML = 'Notify Me';
		document.getElementsByClassName('buy_now')[0].className = document
				.getElementsByClassName('buy_now')[0].className
				+ ' notify_me';
	} else {
		document.getElementsByClassName('buy_now')[0].innerHTML = 'buy now';
		document.getElementsByClassName('buy_now')[0].className = 'font18 btn blue buy_now';
	}

}

// document.getElementsByClassName('pd_slider')[0].addEventListener('click',function(){
// var as = document.getElementsByClassName('pd_slider')[0];
// alert(as.children.length);
// });

/*
 * MicroAjax function. replaces $.ajax from jquery
 * 
 * */
function microAjax(url, callbackFunction) {

	if (!url)
		return;
	var postParam = (arguments[2] || "");
	var req = new XMLHttpRequest();
	req.onreadystatechange = function(obj) {

		if (req.readyState == 4) {
			// cDiv.style.display = 'none';
			// cDiv.removeEventListener("touchmove");
			if (callbackFunction)
				callbackFunction(req.responseText);
		}
	};
	if (postParam !== "") {
		req.open("POST", url, true);
		req.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
		req.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');
		//req.setRequestHeader('Connection', 'close');
	} else {
		req.open("GET", url, true);
	}
	req.send(postParam);

};
//to send the post parameter
function microajax(url, callbackFunction, data, reqType) {
	  if(!url)
	    return;
	  var postParam = data;
	  //(arguments[2] || "");
	  var req = new XMLHttpRequest();
	  req.onreadystatechange = function(obj) {
	    if(req.readyState == 4) {
	      if(callbackFunction)
	        callbackFunction(req.responseText)
	    }
	  };
	  if(postParam !== "") {
	    req.open(reqType, url, true);
	    req.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
	    req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	    //req.setRequestHeader('Connection', 'close');
	  } else {
	    req.open("GET", url, true);
	  }
	  req.send(postParam);
	}

/*-------------------------------------------toggle menu-------------------------------------*/
function clearOutput(outp) {
	if (outp) {
		while (outp.hasChildNodes()) {
			noten = outp.firstChild;
			outp.removeChild(noten);
		}
	}
}
function togglehomeMenu(id, e,event) {
	var ele = document.getElementById(id);
	if(event.getAttribute("hide") == "true"){
		hideAll(ele,event,'hide_H');
	}else{
		hideAll(ele,event,'hide_H2');
	}
	if (ele.style.display == 'none') {
		e.currentTarget.className = e.currentTarget.className + ' bold open';
		ele.style.display = 'block'
	} else {
		e.currentTarget.className = 'list_item  ellip ';
		ele.style.display = 'none';
	}
}
/*function togglehomeMenu1(id) {
	var cont = document.getElementsByClassName(id).length;
	for ( var i = 0; i < cont; i++) {
		if (document.getElementsByClassName(id)[i].style.display == 'none') {
			document.getElementsByClassName(id)[i].style.display = 'block'
		} else {
			document.getElementsByClassName(id)[i].style.display = 'none';
		}
	}
}*/
function togglehomeMenu1(id,event){
	var ele = document.getElementById(id);
	hideAll(ele,event,'hide_H');
	if (ele.style.display == 'none') {
		event.className = event.className + ' bold open';
		ele.style.display = 'block'
	} else {
		event.className = event.className.replace('open',' ');
		event.className = event.className.replace('bold',' ');
		ele.style.display = 'none';
	}
}

function toggleHomeMenuCategory(idToToggle) {
	var elementToToggle = document.getElementById(idToToggle);
	hideAll(elementToToggle,undefined,'hide_H');
	if (elementToToggle.style.display == "none") {
		elementToToggle.style.display = "block";
	} else {
		elementToToggle.style.display = "none";
	}

}
function hideAll(divToProtect,event,className) {
	var elementsToHide = document.getElementsByClassName(className);
	for ( var i = 0; i < elementsToHide.length; i++) {
		if (elementsToHide[i] != divToProtect) {
			elementsToHide[i].style.display = "none";
		}
	}
	var removeBold = document.getElementsByClassName('removeBold_H');
	for (  i = 0; i < removeBold.length; i++) {
		if (removeBold[i] != event) {
			removeBold[i].className = removeBold[i].className.replace('bold', ' ');
			removeBold[i].className = removeBold[i].className.replace('open', ' ');
		}
	}
	
}

function toggleShowHide(classToToggle, event) {
	var elementToToggle = document.getElementById(classToToggle);
	hideRestAll(elementToToggle, event);
	var display = elementToToggle.style.display;
	if (display == "none") {
		event.className += ' selected';
		elementToToggle.style.display = "block";

	} else {
		event.className = event.className.replace('selected', ' ');
		elementToToggle.style.display = "none";
	}

	document.body.scrollTop = event.offsetTop;

	var point1, point2, pointStartX1, pointStartX2, pointStartY1, pointStartY2, deltaX1, deltaX2, deltaY1, deltaY2;

	var i;

	var scroller1, scroller2 = null;

	if (document.getElementById('alsoBought') != null) {
		scroller2 = new iScroll("alsoBought", {

			bounce : true,

			momentum : true,

			//hScroll: true,

			vScroll : false,

			hScrollbar : false,

			vScrollbar : false,

			snap : true,

			onBeforeScrollStart : function(e) {

				//console.log("onBeforeScrollStart");

				point2 = e.touches[0];

				pointStartX2 = point2.pageX;

				pointStartY2 = point2.pageY;

				null;

			},

			onBeforeScrollMove : function(e) {

				//console.log(e);

				point2 = e.touches[0];

				//alert("onBeforeScrollMove");

				deltaX2 = Math.abs(point2.pageX - pointStartX2);

				deltaY2 = Math.abs(point2.pageY - pointStartY2);

				if (deltaX2 >= deltaY2) {

					e.preventDefault();

					// alert("horizontal");

				} else {

					//alert("vertical");

					null;

				}

			}

		});
		setTimeout(function() {

			scroller2.refresh();
		}, 100);

	}

}

function hideRestAll(divToProtect, event) {
	var elements = document.getElementsByClassName('hide_H');
	var divs = document.getElementsByTagName('div');
	for ( var i = 0; i < elements.length; i++) {
		if (elements[i] != divToProtect) {
			elements[i].style.display = "none";
		}
	}
	for ( var i = 0; i < divs.length; i++) {
		if (divs[i] != event) {
			divs[i].className = divs[i].className.replace('selected', ' ');
		}
	}
}
