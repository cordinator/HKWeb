<%@ page import="com.hk.constants.marketing.TagConstants" %>
<%@ page import="com.hk.constants.ui.EnumBannerConstants"%>
<%@ page import="com.hk.web.filter.WebContext"%>
<%@ page import="com.shiro.PrincipalImpl"%>
<%@ page import="org.apache.shiro.SecurityUtils"%>
<%@include file="/includes/taglibInclude.jsp"%>

<script type="text/javascript" src="<hk:vhostJs/>/assets/js/swipe.m.js"></script>
 
  
<s:useActionBean beanclass="com.hk.web.action.beta.home.HomeAction" event="pre" var="homeAction" />
<c:set var="seoData" value="${homeAction.homePage.seoContent}"/>	

<s:layout-render seoData="${seoData}" name="/templates/general.m.jsp" showOldHKLink="false" showMenu="true"
                 canonicalUrl="http://www.healthkart.com" pageType="<%=TagConstants.PageType.HOME%>">


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
  
  
	<c:set var="homePage" value="${homeAction.homePage}" />
	<c:set var="variantGroupList" value="${homePage.variantHeaders}" />
	<s:layout-component name="content">

		<div id="mySwipe"
			style="max-width: 500px; width: 100%; margin: 0px auto 20px; visibility: visible;"
			class="swipe">
			<div class="swipe-wrap">
				<c:set var="pageBanners" value="${homePage.pageBannerList}" />
				<c:forEach items="${pageBanners}" var="pageBanner">
					
					<c:forEach items="<%=EnumBannerConstants.getSlots()%>" var="slot">
						<c:set var="slotClassName" value='${slot.name}' />
						<c:set var="storePageBanners"
							value="${pageBanner.slotToBanner[slot.key]}" />

							<c:set var="len"
								value="${fn:length(storePageBanners.bannerSlotImages)}" />

							<c:forEach items="${storePageBanners.bannerSlotImages}"
									var="bannerImage" varStatus="counter">
									<div>
										<c:choose>
											<c:when test="${bannerImage.landingPage!=null}">
												<a href="${bannerImage.landingPage}" style="background:url(${bannerImage.olink})no-repeat center center;background-size:100%;"></a>
											</c:when>
											<c:otherwise>
											<a href="javascript:void(0);" style="background:url(${bannerImage.olink})no-repeat center center;background-size:100%;"></a>
											</c:otherwise>
										</c:choose>
									</div>
								</c:forEach>

					</c:forEach>

				</c:forEach>
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
    	<div class="wrapper pd_slider_outer shadow" id="${fn:replace(string2,' ', '_')}" >
    	<div class="pd_slider scroller">
    		<c:forEach items="${variantGroup.items}" var="variantDetails">
								<c:set var="variant"
									value="${variantDetails.variantBasicResponse}" />
								<s:layout-render name="/layouts/variantTileDefaultLayout.m.jsp"
									variantBasicResponse="${variant}"></s:layout-render>
							</c:forEach>		 
    	</div><!-- pd_slider ends -->
    	</div>	
    </div>
    </c:forEach>
		
		<div class="main-menu">
			<s:layout-render name="/includes/menuInclude.m.jsp" tempVar="HOME" showMenu="${showMenu}"/>
		</div>
		<%--<s:layout-render name="/layouts/embed/remarketingWithCustomParams.jsp"--%>
		<%--pageType="<%=EnumRemarketingConstants.HOME.getPageType()%>"--%>
		<%--gender="${gender}" orderCount="${orderCount}"--%>
		<%--/>--%>

		<%--<c:if test="${not isSecure }">--%>
		<%--<iframe--%>
		<%--src="http://www.vizury.com/analyze/analyze.php?account_id=VIZVRM112&param=e100&section=1&level=1&uid=${user_hash}"--%>
		<%--scrolling="no" width="1" height="1" marginheight="0" marginwidth="0"--%>
		<%--frameborder="0"></iframe>--%>
		<%--</c:if>--%>
	</s:layout-component>
	<s:layout-component name="scriptComponent">

<script type="text/javascript">
 function del_cookie(name)
 {
     document.cookie = name + '=; path=/;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
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

        {

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