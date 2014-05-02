<%@include file="/includes/taglibInclude.jsp"%>
<s:layout-definition>
	<div id="search" class="hk-search-bar">

				<s:form beanclass="com.hk.web.action.beta.search.SearchAction"
			method="get" id="globalSearch">
			<s:text name="txtQ" class="hk-search-box search ellip"
				placeholder="Search for a product, brand or category"
				data-provide="typeahead" autocomplete="off"
				onkeyup="javascript:autoComplete();" onClick="javascript:removeSortBy();"/>
				<input type="submit" class="search-icon" value="" />
		</s:form>

		<input type="hidden" id="variant-id" value="" /> <span
			class=" icn icn-search icn-search-img"></span>

		<div id="searchButton" class="search-menu">

			<div class="search-menu-label">
				<!--  <div class="search-hdr-txt">ALL CATEGORIES</div> -->
				<div class="icn-dwn-cs"></div>

			</div>
			<!--  ul id="searchbox" class="search-cat-cont">
        <li class="search-item">Nutrition</li>
        <li class="search-item">Sports & Fitness</li>
        <li class="search-item">Diabetes</li>
        <li class="search-item">Health Devices</li>
        <li class="search-item">Eye</li>
        <li class="search-item">Personal Care</li>
        <li class="search-item">Beauty</li>
        <li class="search-item">Parenting</li>
        <li class="search-item">Services</li>
      </ul -->
		</div>
		<div class="hk-search-box-result"></div>

	</div>
	<div id="output"></div>
	<script type="text/javascript">
	/*
	This method is to provide the autocomplete fuctionality of the jquery using pure javascript
	*/
	function removeSortBy(){
		// to disable the sortBy
		if(document.getElementsByClassName('sort_menu')[0]){
		    document.getElementsByClassName('sort_menu')[0].style.display = "none";
			document.getElementsByClassName('pd_mask')[0].style.display = "none";
		}
	}
  function autoComplete(){	
	  document.getElementById('globalSearch').style.border = "#009CFF solid 1px";
	  var elePos;
	  if(document.getElementsByName("txtQ")[0].value != "" ){	
		  elePos = 0; 
	  } else{ 
		  elePos = 1;
	  } 
	  
  var outp = document.getElementsByClassName("hk-search-box-result")[elePos];	
  var oldins;
  var posi = -1;
  var words = new Array();
  var input;
  var key;
  microAjaxAutoComplete();
  function microAjaxAutoComplete(){
	  var qstr = document.getElementsByName("txtQ")[elePos].value;
	  var autoCompleteItems = 10;
	  var acItems;
	  if(qstr.length > 1){
	   microAjax(CONTEXT_ROOT+'/api/ac/results'+ '?q=' + encodeURIComponent(qstr) + '&noRs=' + autoCompleteItems,function(data){
		  data = JSON.parse(data);
		  var results = data.results;
          acItems = results.acItems;
          var acVariants = results.acVariants;	
	      init(acItems);
	      if(acItems.length == 0){
		    	 clearOutput();
		     }
		 }); 	   
	  }else if(qstr.length < 2){
		  clearOutput(); 
	  }
		  sessionStorage.setItem("val", qstr);	  
  }

function setVisible(visi)
{
  var x = document.getElementById("search");
  var t = document.getElementsByName("txtQ")[elePos];
}
function init(suggestions)
{	
  lookAt(suggestions);
  setVisible("hidden");
  document.onkeydown = keygetter; //needed for Opera...
  document.onkeyup = keyHandler;
}
function lookAt(suggestions)
{
   var ins = document.getElementsByName("txtQ")[elePos].value;
    if (posi > -1);
   else if (ins.length > 1)
   {
    words = suggestions;
     if (words.length > 0)
     {
        clearOutput();
        for (var i=0;i < words.length; ++i){
        	addWord(words[i].nm, words[i].url);
        }
        
        setVisible("visible");
        input = document.getElementsByName("txtQ")[elePos].value;
     }
     else
     {
        setVisible("hidden");
        posi = -1;
     }
   }
   else
   {
    setVisible("hidden");
    posi = -1;
   }
   oldins = ins;
}
/* This method is used to display the final result to the page in the form of dropdown.*/
function addWord(word,urlFragment)
{  var valu = document.getElementsByName("txtQ")[elePos].value;
   var sp = document.createElement("div");
   var anchor = document.createElement("a");
       anchor.setAttribute('href',urlFragment);
       anchor.setAttribute('class',"anchorHighlight");
   var regEx = new RegExp(valu, "ig");   
   var tempValu='<span class="highlight">'+ valu +'</span>'; /* In order to highlight the enterd text by user */
	   word = word.replace(regEx, tempValu);
	   anchor.innerHTML= word;
	   sp.appendChild(anchor);
	   sp.onmouseover = mouseHandler;
	   sp.onmouseout = mouseHandlerOut;
	   sp.onclick = mouseClick;
   outp.appendChild(sp);
}
function clearOutput()
{
  while (outp.hasChildNodes())
  {
    noten=outp.firstChild;
    outp.removeChild(noten);
  }
   posi = -1;
}

function setColor (_posi, _color, _forg)
{
   outp.childNodes[_posi].style.background = _color;
   outp.childNodes[_posi].style.color = _forg;
}
function keygetter(event)
{
  if (!event && window.event) 
      event = window.event;
  if (event)
      key = event.keyCode;
  else
      key = event.which;
}
function keyHandler(event)
{
  if (document.getElementById("search").style.visibility == "visible")
  {
     var textfield = document.getElementsByName("txtQ")[elePos];
     if (key == 40)//key down
     { 
        if (words.length > 0 && posi <= words.length-1)
        {
          if (posi >=0)
            setColor(posi, "#fff", "black");
          else 
             input = textfield.value;
             setColor(++posi, "blue", "white");
             textfield.value = outp.childNodes[posi].firstChild.nodeValue;
        }
      }
      else if (key == 38)
      { //Key up
        if (words.length > 0 && posi >= 0)
         {
           if (posi >=1)
           {
              setColor(posi, "#fff", "black");
              setColor(--posi, "blue", "white");
              textfield.value = outp.childNodes[posi].firstChild.nodeValue;
           }
           else
           {
              setColor(posi, "#fff", "black");
              textfield.value = input;
              textfield.focus();
              posi--;
           }
         }
        }
         else if (key == 27)
         { // Esc
            textfield.value = input;
            setVisible("hidden");
            posi = -1;
            oldins = input;
          }
          else if (key == 8) 
          { // Backspace
            posi = -1;
            oldins=-1;
          } 
              }
   }
    var mouseHandler=function()
    {
      for (var i=0; i < words.length; ++i){
        setColor (i, "white", "black");       
      }
      //this.style.background = "blue";
      this.style.color= "white";
     }
     var mouseHandlerOut=function()
     {
       this.style.background = "white";
       this.style.color= "black";
     }
     var mouseClick=function()
     {
        document.getElementsByName("txtQ")[elePos].value = this.firstChild.nodeValue;
        setVisible("hidden");
        posi = -1;
        oldins = this.firstChild.nodeValue;
     }
  }
</script>
	<!--  <script id="ac-variants-template" type="text/x-handlebars-template">
    <a class="clearfix" href="{{targetPage}}" style="">
          <span class="img-box img-box-70 cont-lft mrgn-r-10" style="">
               <img src="{{img}}" alt=""/>
          </span>
          <span style="width:80%;">
               <span>{{label}}</span><br>
               <span class='txt-light'>Rs. {{op}}</span>
          </span>
    </a>
  </script> -->
</s:layout-definition>