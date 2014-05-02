<%@ page import="com.hk.constants.marketing.TagConstants" %>
<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.category.CategoryAction" var="categoryAction"/>
<c:set var="seoData" value="${categoryAction.categoryPage.seoContent}"/>
<%
  boolean isSecure = WebContext.isSecure();
  pageContext.setAttribute("isSecure", isSecure);

  PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
  if (principal != null) {
    pageContext.setAttribute("user_hash", principal.getUserHash());
    pageContext.setAttribute("gender", principal.getGender());
    pageContext.setAttribute("orderCount", principal.getOrderCount());
  } else {
    pageContext.setAttribute("user_hash", "guest");
    pageContext.setAttribute("gender", null);
    pageContext.setAttribute("orderCount", null);
  }
%>
<s:layout-render name="/templates/general.m.jsp"
                 seoData="${seoData}"
                 canonicalUrl="${categoryAction.categoryPage.canonicalUrl}"
                 pageType="<%=TagConstants.PageType.CATEGORY%>"
                 primaryCategory="${categoryAction.categoryPage.breadCrumbs[1].name}"
                 secondaryCategory="${categoryAction.categoryPage.breadCrumbs[2]!=null ? categoryAction.categoryPage.breadCrumbs[2].name: ''}"
                 tertiaryCategory="${categoryAction.categoryPage.breadCrumbs[3]!=null ? categoryAction.categoryPage.breadCrumbs[3].name: ''}"
                 navKey="${categoryAction.navKey}"
                 cTags="${categoryAction.categoryPage.categoryTag.tagList}"
    >
    
    <s:layout-component name="htmlHead">
<script type="text/javascript" src="<hk:vhostJs/>/assets/js/swipe.m.js"></script>

  <link rel="stylesheet" type="text/css" href="<hk:vhostJs/>/assets/css/pd_list.m.css"
        media="screen">
        <link rel="stylesheet" type="text/css" href="<hk:vhostJs/>/assets/css/filter.m.css"
        media="screen">
</s:layout-component>

  <s:layout-component name="content">

     
    <c:set var="variantGroupList" value="${categoryAction.categoryPage.variantHeaders}"/>
    <c:set var="categoryHeaderList" value="${categoryAction.categoryPage.categoryHeaders}"/>

      <h2 id="heading category page" class="pd_heading left font14 semi_bold ellip">
         <c:if test="${seoData.h1 != null}">
            ${seoData.h1}        
        </c:if>        
       </h2>
		<div id="mySwipe" style="max-width: 500px; width: 100%; margin: 0px auto 20px; visibility: visible;" class="swipe">
			<div class="swipe-wrap">
          <s:layout-render name="/layouts/bannerLayout.m.jsp" pageBanners="${categoryAction.categoryPage.pageBannerList}"/>
        </div>
        <div class="slider-circles"></div>
        </div>
        
            <c:forEach items="${variantGroupList}" var="variantGroup" varStatus="counter">
		
              <div class="best_seller">
                <div class="tcenter title font16">
		    		  <div class="circle"></div>
		    		  <span class="inline">${variantGroup.displayName}</span>
		    		  <div class="circle"></div>
		    	</div>
    	<c:set var="string1" value="swipe_"/>
		<c:set var="string2" value="${string1}${counter.index}"/>
   	
                <div class="wrapper pd_slider_outer shadow" id="${fn:replace(string2,' ', '_')}" style="height: 270px;">
			    	<div class="pd_slider scroller">
                  <c:forEach items="${variantGroup.items}" var="variantDetails">
                    <c:set var="variant" value="${variantDetails.variantBasicResponse}"/>
                      <s:layout-render name="/layouts/variantTileDefaultLayout.m.jsp" variantBasicResponse="${variant}"></s:layout-render>
                  </c:forEach>
                </div><!-- pd_slider ends -->
                </div>
              </div>
            </c:forEach>
        
                 <div class="page-hldr filter-result">
			<div class="page-hldr">
				<div class="font13 ">
										
					<c:set var="menuNode" value="${categoryAction.categoryPage.categoryMenuNodes}"/>
                  <c:forEach items="${menuNode}" var="l1child">
                      <a href="javascript:void(0);" class="list_item ellip removeBold_H" onclick="togglehomeMenu1('${fn:replace(l1child.name,' ','_')}',this);">${l1child.name} <span></span></a>
                      <c:set var="maxLeafElms" value="4"/>
                      <c:set var="leafElms"
                             value="${fn:length(l1child.childNodes)>maxLeafElms?maxLeafElms:fn:length(l1child.childNodes)}"/>
                      <c:set var="seeMore"
                             value="${fn:length(l1child.childNodes)>maxLeafElms?'true':'false'}"/>
           					<div id="${fn:replace(l1child.name,' ','_')}" class="filter-brand ${fn:replace(l1child.name,' ','_')} hide_H" style="display: none;">
                        <c:forEach items="${l1child.childNodes}" var="l2child" end="${leafElms}"
                                   varStatus="counter">
                          
                          <a href="${l2child.url}"
                             class="list_item1 bd_btm">${l2child.name}</a>
                          <c:if test="${counter.last && seeMore}">
                            <a href="${l1child.url}" class="list_item1 bd_btm">See All &raquo;</a>
                          </c:if>
                          
                        </c:forEach>
                        </div>
            
                  </c:forEach>
			    </div>


			</div>



		</div><!-- filter result -->
 

<script type="text/javascript">
 function del_cookie(name)
 {
     document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
 }
	 del_cookie("track1");
	 del_cookie("track2");

 var isIE10 = false;

 /*@cc_on

     if (/^10/.test(@_jscript_version)) {

         isIE10 = true;

     }

 @*/

 var iOS = navigator.userAgent.match(/(iPad|iPhone|iPod)/g);

 var ua = navigator.userAgent;

 var userAgent = navigator.userAgent.toLowerCase();

    if(isIE10){

      var a = document.getElementsByClassName('pd_slider_outer');

      for(var i=0;i < a.length;i++){

       a[i].style.overflowX = 'auto';


       }

     }else if( ua.indexOf("Android") >= 0 ){

        var androidversion = parseFloat(ua.slice(ua.indexOf("Android")+8)); 

        if (androidversion < 3.0)

        {alert(3);

         var script = document.createElement("script");

            script.type = "text/javascript";

            script.src = "<hk:vhostJs/>/assets/js/iscroll.js";

            document.head.appendChild(script);

            script.onload = function()

            { 

             var point, pointStartX, pointStartY, deltaX, deltaY;

             var i, scroller = [], len = document.getElementsByClassName('pd_slider').length;

             var scrollerArray = document.getElementsByClassName('scroller');

             for(i=0; i<scrollerArray.length; i++){

              var length = scrollerArray[i].children.length;

              scroller[i] = new iScroll("swipe_"+i, {

               bounce: true,

                        momentum: true,

                      //hScroll: true,

                  vScroll: false,

                  hScrollbar: false,

                  vScrollbar: false,

         snap:true,

                  onBeforeScrollStart: function(e) {

                   console.log("onBeforeScrollStart");

                      point = e.touches[0];

                      pointStartX = point.pageX;

                      pointStartY = point.pageY;

                      null;

                  },

                  onBeforeScrollMove: function(e) {

                   console.log(e);

                   point = e.touches[0];

                   //alert("onBeforeScrollMove");

                      deltaX = Math.abs(point.pageX - pointStartX);

                      deltaY = Math.abs(point.pageY - pointStartY);

                      if (deltaX >= deltaY) {

                       

                          e.preventDefault();

                         // alert("horizontal");

                      } else {

                       //alert("vertical");

                          null;

                          

                      }

                  }

              }); 

             }




             setTimeout(function(){

             for(i=0; i<len; i++){

               scroller[i].refresh();

             }

             }, 100);

            }

        }else{

         var a = document.getElementsByClassName('pd_slider_outer');

          for(var i=0;i < a.length;i++){

           a[i].style.overflowX = 'auto';

           a[i].style.webkitOverflowScrolling = 'touch';

           }

        }

    }

    

     else if(iOS){

  if(navigator.userAgent.match(/(iPad|iPhone|iPod|iPod touch);.*CPU.*OS (6|7)_\d/i) ? true : false){

  var a = document.getElementsByClassName('pd_slider_outer');
       for(var i=0;i < a.length;i++){
        a[i].style.overflowX = 'auto'; 
        a[i].style.overflowY = 'hidden';
        a[i].style.webkitOverflowScrolling = 'touch';    
   }

  }else{ 
	
          var script = document.createElement("script");

            script.type = "text/javascript";

            script.src = "<hk:vhostJs/>/assets/js/iscroll.js";

            document.body.appendChild(script);

            script.onload = function()

            { 

             var point, pointStartX, pointStartY, deltaX, deltaY;

             var i, scroller = [], len = document.getElementsByClassName('pd_slider').length;

             var scrollerArray = document.getElementsByClassName('scroller');

             for(i=0; i<scrollerArray.length; i++){

              var length = scrollerArray[i].children.length;

              scroller[i] = new iScroll("swipe_"+i, {

               bounce: true,

                        momentum: true,

                      //hScroll: true,

                  vScroll: false,

                  hScrollbar: false,

                  vScrollbar: false,

         snap:true,

                  onBeforeScrollStart: function(e) {

                   console.log("onBeforeScrollStart");

                      point = e.touches[0];

                      pointStartX = point.pageX;

                      pointStartY = point.pageY;

                      null;

                  },

                  onBeforeScrollMove: function(e) {

                   console.log(e);

                   point = e.touches[0];

                   //alert("onBeforeScrollMove");

                      deltaX = Math.abs(point.pageX - pointStartX);

                      deltaY = Math.abs(point.pageY - pointStartY);

                      if (deltaX >= deltaY) {

                       

                          e.preventDefault();

                         // alert("horizontal");

                      } else {

                       //alert("vertical");

                          null;

                          

                      }

                  }

              }); 

             }




             setTimeout(function(){

             for(i=0; i<len; i++){

               scroller[i].refresh();

             }

             }, 100);

            }
  }

  }else if(ua.indexOf("BlackBerry") >= 0 || ua.indexOf("BB10") >= 0){

   var a = document.getElementsByClassName('pd_slider_outer');

       for(var i=0;i < a.length;i++){

        a[i].style.overflowX = 'auto';

    a[i].style.webkitOverflowScrolling = 'touch';
    }

    }



</script>
        
     
        
 <script>

      var prev;
      var a = document.getElementsByClassName('swipe-wrap')[0].children.length;
          for(var i=0;i<a;i++)
          {
            var iDiv = document.createElement('div');
            iDiv.className = 'circle';
            document.getElementsByClassName('slider-circles')[0].appendChild(iDiv);
          }
      var elem = document.getElementById('mySwipe');
      window.mySwipe = Swipe(elem, {
           startSlide: 0,
           auto: 3000,
           continuous: true,
        // disableScroll: true,
        // stopPropagation: true,
        callback: function(index, element) {
          if(prev != undefined){
            document.getElementsByClassName('circle')[prev].className = 'circle';
          }
           document.getElementsByClassName('circle')[index].className = document.getElementsByClassName('circle')[index].className + ' selected ';
           prev = index;          
        },
        transitionEnd: function(index, element) {},
      });
      
    </script>
      

    

  </s:layout-component>

</s:layout-render>
