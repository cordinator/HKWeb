<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@ page import="com.hk.constants.marketing.TagConstants" %>
<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.variant.StoreVariantAction" var="variantAction"/>
<c:set var="seoData" value="${variantAction.variantPage.seoContent}"/>
 

<s:layout-render name="/templates/general.m.jsp"
                 seoData="${seoData}"
                 canonicalUrl="${variantAction.variantPage.canonicalUrl}"
                 pageType="<%=TagConstants.PageType.STORE_VARIANT%>"
                 primaryCategory="${variantAction.variantPage.breadCrumbs[1].name}"
                 secondaryCategory="${variantAction.variantPage.breadCrumbs[2]!=null ? variantAction.variantPage.breadCrumbs[2].name : ''}"
                 tertiaryCategory="${variantAction.variantPage.breadCrumbs[3]!=null ? variantAction.variantPage.breadCrumbs[3].name : ''}"
                 quaternaryCategory="${variantAction.variantPage.breadCrumbs[4]!=null ? variantAction.variantPage.breadCrumbs[4].name : ''}"
                 breadCrumbs="${variantAction.variantPage.breadCrumbs}"
                 brand="${variantAction.storeVariantDetail.brandName}"
                 variantId="${variantAction.storeVariantDetail.id}"
                 productId="${variantAction.storeVariantDetail.storeProductId}"
                 variantOfferPrice="${variantAction.storeVariantDetail.offerPrice}"
                 variantMrp="${variantAction.storeVariantDetail.mrp}"
                 variantDiscount="${variantAction.storeVariantDetail.discount}"
                 variantName="${variantAction.storeVariantDetail.name}"
                 variantImageM="${variantAction.storeVariantDetail.primaryImage.slink}"
                 variantImageS="${variantAction.storeVariantDetail.primaryImage.xxtlink}"
                 oldVariantId="${variantAction.storeVariantDetail.oldVariantId}"
                 navKey="${variantAction.navKey}"
                 oos="${variantAction.storeVariantDetail.oos}"
                 svTags="${variantAction.storeVariantDetail.storeVariantTag.tagList}"
                 cTags="${variantAction.storeVariantDetail.categoryTag.tagList}"
                 bTags="${variantAction.storeVariantDetail.brandTag.tagList}"
    >
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
<%!
//update the new version at point 1 and update the previous version at point 2.
String generateRandomString(boolean flag){
	  String random = "version1.0.1"; //1
	  if(flag){
	  	  return random;
	  }else{
		  return "version1.0.0"; //2
	  }
}
%>
<s:layout-component name="htmlHead">
<link href="<hk:vhostCss/>/assets/css/pd_detail.m.css" media="screen" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery-1.9.1.min.js"></script>
 <%--    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery-ui.min.js"></script> --%>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/common.m.js"></script> 
</s:layout-component>
<s:layout-component name="content">
<c:set var="variant" value="${variantAction.storeVariantDetail}"/>
<c:set var="attrDefaultVariantMap" value="${variantAction.attrDefaultVariantMap}"/>
<c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>"/>
<c:set var="filterKeyValueSeperator" value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>"/>
<c:set var="versionNumber" value="<%=generateRandomString(true)%>"/> 

<div class="mainContainer" id="variant-page">
<div class="container ">
<%-- <s:layout-render name="/layouts/breadCrumbLayout.jsp" breadCrumbs="${variantAction.variantPage.breadCrumbs}"/> --%>
<%-- <s:layout-render name="/pages/compare/variantCompareWidget.jsp"/> --%>

<div class="pd_detail_con">
<div class="pd_detail">
	<h1 class="font14 semi_bold tcenter">${ variant.name==null  ? (seoData !=null ? seoData.h1 : '') : variant.name}</h2>
	<div class="font10 tcenter mt10">
		<c:if test="${variant.rating>0}">
		<span style="line-height: 16px;">Rated: </span>
	      <div class="rtng-star">
	        <div class="rtng-usr" itemprop="ratingValue" content="${variant.rating}"
	             style="width:${(variant.rating/5) * 100}%"></div>
	      </div>
	
	    </c:if> (<span itemprop="reviewCount">${variant.variantReviewResponse.totalResults}</span> reviews )</span>
    </div>
    
	<div class="slider_con">
	<div id="mySwipe" style="width: 100%; max-width:180px;margin: 0px auto; visibility: visible;" class="swipe slider_image ">
	
	<div class="swipe-wrap">
			        <c:forEach items="${variant.images}" var="image">
			          <div  style="background: url('${image.llink}')no-repeat center center; background-size: contain;width:100%;height:180px;"></div>
			        </c:forEach>
	</div>
	</div>
	<c:if test="${fn:length(variant.images)>1}">
		 <span class="backward_arrow" onclick="mySwipe.prev()"></span>
		 <span class="forward_arrow" onclick="mySwipe.next()"></span>
	 </c:if>
	</div>
	<div class="clear"></div>


	    <c:choose>
      <c:when test="${variant.discount > 0}">
        <div class="tcenter"><span class="dark_grey font14"><strike>RS. ${variant.mrp}</strike></span> <span class="font20 semi_bold ml10">Now Rs. ${variant.offerPrice}</span></div>
        <div class="tcenter blue_text font12 mt10">YOU SAVE ${variant.discount}%</div>

      </c:when>
      <c:otherwise>
        <div class="tcenter"><span class="font20 semi_bold ml10">Now Rs. ${variant.offerPrice}</span></div>
      </c:otherwise>
    </c:choose>
    
    	<%-- <meta itemprop="price" content="${variant.offerPrice}"/>
    <meta itemprop="priceCurrency" content="INR"/> --%>
	
		
	    <div id="offer_box_H" class="offer-box" style="display:none">
		      <span class="offer-txt font14 bold">OFFER</span>
		      <div class="freebie-txt" >
		      	<p id="freebieName" class="font14 bold ellip"></p>
		        <p class="font12">Till Stock Lasts</p>
		      </div>
		      <div class="clear"></div>
		    </div>

        <c:choose>
      <c:when test="${variant.showNotifyMe}">
      <s:link beanclass="com.hk.web.action.beta.notify.NotifyMeAction" class="font18 btn blue buy_now notify_me">
             <s:param  name="storeVariantId" value="${variant.id}" />
             <s:param name="oldVariantId" value="${variant.oldVariantId}"/>
             <s:param name="variantLink" value="${variantAction.storeVariantDetail.url}" />
             Notify Me</s:link>
      

        <p class="pd10 tcenter font16 bold"> Out of stock</p>
      </c:when>
      <c:otherwise>
        <c:choose>
          <c:when test="${variant.oos}">
            <p class="pd10 tcenter font16 bold"> Out of stock</p>
          </c:when>
          <c:otherwise>
            <a href="javascript:void(0)" varId="${variant.id}" qty="1" oldVariantId="${variant.oldVariantId}"
                   class="${variant.contactLensLayout eq true ? 'addToCartWithExtOp' : 'addToCart'} font18 btn blue buy_now"
                   >Buy Now</a>

<!--<div class="fnt-caps mrgn-t-5">Instock</div> -->
			    	  <c:choose>
					    <c:when test="${variant.dispatchDataAvail}">
					      <c:choose>
					        <c:when test="${variant.jit eq true}">
					          <div class="pd10 tcenter font12 dispatch-in">DISPATCHED IN 6 - 8
					            DAYS
					          </div>
					        </c:when>
					        <c:otherwise>
					          <div class="pd10 tcenter font12 dispatch-in">DISPATCHED IN 1 - 3
					            DAYS
					          </div>
					        </c:otherwise>
					      </c:choose>
					
					    </c:when>
					    <c:otherwise>
					      <div class=" pd10 tcenter font12 dispatch-in"> DISPATCHED IN ${variant.minDispatchDays}
					        - ${variant.maxDispatchDays}
					        DAYS
					      </div>
					    </c:otherwise>
					  </c:choose>
					  
          </c:otherwise>
        </c:choose>
      </c:otherwise>
    </c:choose>

    
</div><!-- product detail page -->

<%-- beauty/lens/normal layout begins--%>
<c:choose>
  <c:when test="${variant.contactLensLayout eq true}">
    <s:layout-render name="/layouts/lensLayout.m.jsp" variant="${variant}"/>

  </c:when>
  <c:otherwise>
      <div class="flavour_size_con">
        <c:forEach items="${variant.attributes}" var="attribute">
          <c:set var="selectedValue" value="${variant.selectedAttributes[attribute.name]}"/>
          <div class="diff-attr mt10" attr-name="${attribute.name}">
            <label class="font14 bold" for="${attribute.displayName}">${attribute.displayName}
                     <span class="blue_text">
                         <c:forEach items="${attribute.attrValues}" var="attrValue" varStatus="ctr">
                           <c:set var="attrValCombination"
                                  value="${attribute.name}${filterKeyValueSeperator}${attrValue.internalValue}"/>
                           <c:if test="${fn:toLowerCase(attrValue.internalValue) eq selectedValue}">
                             <c:choose>
                               <c:when test="${attrValue.optionValueType == 50}">
                                 ${attrValue.imageDTO.caption}
                               </c:when>
                               <c:otherwise>
                                 ${attrValue.displayValue}
                               </c:otherwise>
                             </c:choose>
                           </c:if>
                         </c:forEach>
                     </span>
            </label>
            <ul>
              <c:forEach items="${attribute.attrValues}" var="attrValue" varStatus="ctr">
                <c:set var="attrValCombination"
                       value="${attribute.name}${filterKeyValueSeperator}${attrValue.internalValue}"/>
                <c:choose>
                  <c:when test="${attrValue.optionValueType == 50}">
                    <li attr-val-name="${attrValue.internalValue}"
                        default-variant="${attrDefaultVariantMap[attrValCombination]}"
                        class="img-beauty-circle-45 diff-attr-val grey_box ${fn:toLowerCase(attrValue.internalValue) eq selectedValue ? ' selected-val attr-val' : ''} ${fn:length(attribute.attrValues) eq "1" ? 'hide jugadDisplay' : ''}"
                        onClick = "javascript:forVariant(this);">
                        <img alt="${attrValue.imageDTO.altText}" src="${attrValue.imageDTO.olink}"/>
                    </li>
                  </c:when>
                  <c:otherwise>
                    <li attr-val-name="${attrValue.internalValue}"
                        default-variant="${attrDefaultVariantMap[attrValCombination]}"
                        class="diff-attr-val grey_box font13 ${fn:toLowerCase(attrValue.internalValue) eq selectedValue ? ' selected-val attr-val' : ''} ${fn:length(attribute.attrValues) eq "1" ? 'hide jugadDisplay' : ''}"
                        onClick = "javascript:forVariant(this);">
                        ${attrValue.displayValue}
                    </li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </ul>
          </div>
        </c:forEach>
      </div>
    
  </c:otherwise>
</c:choose>

  <%-- beauty/lens/normal layout ends--%>
  
<!--  <div class="list_item font14 ellip slect_item_h also_bought_h" onClick = "toggleShowHide('comboOffer',this);">Combo offers with this product</div>

 <div  class="wrapper" id="comboOffer">
 <div class="pd_slider scroller" id="offersCont">
 
 </div>
 </div> -->

 <div class="container" id="ProductInfoBlock" >
<c:if test="${variantAction.displayNavBar}">   
      <div  id="ProductDetailsBlock">
        <div id="detailsContainer">
          <div id="offers" class="hide">
              <div class="combo_offer_H list_item font14 ellip" id ="combo_offer_H" onClick = "toggleShowHide('comboOffer',this);" style="display:none">Combo offers with this product</div>
           		<div  class="best_seller wrapper hide_H" id="comboOffer">
				 <div class="pd_slider scroller" id="offersCont">
				 
				 </div>
				 </div>
          </div>

        </div>
		</div>
</c:if>
</div>
  

<div class="list_item font14 ellip slect_item_h also_bought_h" onClick = "toggleShowHide('alsoBought',this);">Also bought</div>
  
 <div id="alsoBought" style="display:none" class="best_seller alsobought_slider hide_H wrapper" >   
 <div id="btCont" class="pd_slider scroller">
 		
 </div>
</div>

<div class="list_item font14 ellip slect_item_h item_detail_h" onClick = "toggleShowHide('item_detail',this);">Details</div>

<div class="pd10 font12 hide_H" id="item_detail" style="display:none">
 <c:forEach items="${variant.groups}" var="group">
              <table id="traits">
                <tr group-name="${group.name}" class="specs-hdr-tr">
                  <th colspan="5">
                    <div class="varnt-specs-hdr uppercase"> ${group.displayName}</div>
                  </th>
                </tr>
                <c:forEach items="${group.groupValues}" var="groupValue" varStatus="ctr">
                  <c:if test="${ctr.first}">
                    <tr class="top-brdr varnt-specs-tr" group-value-name="${groupValue.name}">
                  </c:if>
                  <c:if test="${ctr.last}">
                    <tr class="${ctr.index%2==0? 'varnt-specs-tr btm-brdr':'btm-brdr varnt-specs-tr bg-gray'}" group-value-name="${groupValue.name}">
                  </c:if>
                  <c:if test="${!(ctr.first || ctr.last)}">
                    <tr class="${ctr.index%2==0? 'varnt-specs-tr':' varnt-specs-tr bg-gray'}" group-value-name="${groupValue.name}">
                  </c:if>
                  <td class="border-td" colspan="1">${groupValue.displayName}</td>
                  <td colspan="4">
                    <c:choose>
                      <c:when test="${groupValue.optionValueType == 50}">
                        <div class="img-beauty-circle-25">
                          <img alt="${groupValue.imageDTO.altText}" src="${groupValue.imageDTO.olink}"/>
                        </div>
                      </c:when>
                      <c:otherwise>
                        ${groupValue.value}
                      </c:otherwise>
                    </c:choose>

                  </td>
                  </tr>
                </c:forEach>
              </table>
            </c:forEach>
            
            
             <c:if test="${variant.description ne null}">
				<div class="mt15 uppercase semi_bold">details</div>
            </c:if>
            <div >
               ${variant.description}
            </div>
            
          
</div>

  <c:forEach items="${variantAction.slotToContent}" var="slotContent" varStatus="loop">
              <div id="${slotContent.key}" class="">
                <div class="list_item font14 ellip slect_item_h buyer_guide_h" onClick = "toggleShowHide('buyer_guide${loop.index}',this);">${variantAction.slotKeyToSlotName[slotContent.key]}</div>
              </div>
              <div class="font12 pd10 hide_H" id="buyer_guide${loop.index}" style="width:100%;overflow-x:auto;display:none">
                  ${slotContent.value.value}
              </div>
            </c:forEach>
            
            <div class="list_item font14 ellip slect_item_h item_reviews_h" onClick = "toggleShowHide('pd10',this);">Reviews</div>
            <div class="pd10 hide_H" id="pd10" style="display:none">
            <div class="rate_now">
    		 	<p>Have you used this product Rate it now</p>
    		 	<p class="mt3"><img src="<hk:vhostImage/>/assets/img/rating_grey.png" alt="rating" height="12px"></p>
    		 	<%-- <s:link beanclass="com.hk.web.action.beta.review.StoreVariantReviewAction"
                        event="reviewCrud"
                        class="btn grey font14">Write a review
                  <s:param name="storeVariantId" value="${variantAction.storeVariantDetail.id}"/>
                </s:link> --%>
    		 </div>
    		 
    		 <s:layout-render name="/layouts/reviewLayout.m.jsp"
                           variantReviews="${variantAction.storeVariantDetail.variantReviewResponse.variantReviews}"/>
          <c:if test="${fn:length(variantAction.storeVariantDetail.variantReviewResponse.variantReviews) > 0}">
          <div class="clear"></div>
            <div class="load_more">
              <s:link beanclass="com.hk.web.action.beta.review.StoreVariantReviewAction"
                      class="btn grey font13">View More
                <s:param name="storeVariantId" value="${variantAction.storeVariantDetail.id}"/>
              </s:link>
            </div>

          </c:if>
          
        
          
           </div>



</div> <!-- pd_detail_con ends -->



</div>
</div>






<%-- <c:if test="${variant.showNotifyMe}"> --%>
<%--   <s:layout-render name="/layouts/dialogLayout.jsp" dialogId="notifyDialog" layoutType="notifyDialog" --%>
<%--                    dialogTitle="Notify Me" dialogBtn="notify-submit" user="notifyUserName" email="notifyEmail" --%>
<%--                    phone="notifyPhone"/> --%>
<%-- </c:if> --%>
<%-- <s:layout-render name="/layouts/dialogLayout.jsp" catId="${variant.catPrefix}" dialogId="speakToNutritionistDialog" --%>
<%--                  layoutType="speakToNutritionistLayout" dialogTitle="Speak To A Fitness Expert " --%>
<%--                  dialogBtn="speakToNutritionist-submit" user="speakToUserName" email="speakToEmail" --%>
<%--                  phone="speakToPhone"/> --%>

<%--do not delete overlayDiv this is for dialog box--%>
<div id="overlayDIV" class="hide"></div>
</s:layout-component>
<s:layout-component name="scriptComponent">
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/review/review.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/swipe.m.js"></script>
  <%-- <script type="text/javascript" src="<hk:vhostJs/>/assets/js/handlebars.js"></script> --%>
  <%-- <script type="text/javascript" src="<hk:vhostJs/>/assets/js/compare/compare.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery.elevatezoom.js"></script> --%>
   <script>
      var elem = document.getElementById('mySwipe');
      window.mySwipe = Swipe(elem, {
           startSlide: 0,
           auto: false,
           continuous: true,
        // disableScroll: true,
        // stopPropagation: true,
        callback: function(index, element) {
        },
        transitionEnd: function(index, element) {},
      });
    </script>
  <script>
    /*
     This object provides a way for author to store page related info, to be used by other methods
     This type of object can be used to store dynamic information generated by jsps
     vpc : variant page config
     */
    HK.vpc = {};
    HK.vpc.showCarousel = false;
    <c:if test="${fn:length(variant.images)>3}">
    HK.vpc.showCarousel = true;
    </c:if>

    HK.vpc.filterKeyValueSeperator = '${filterKeyValueSeperator}';

    HK.vpc.filterSeperator = '${filterSeperator}';
    HK.vpc.filterValueSeparator = '~';
    HK.vpc.variantId = "${variant.id}";
    HK.vpc.oldVariantId = "${variant.oldVariantId}";

    HK.vpc.availableVariant = {};
    HK.vpc.availableVariantOOS = {};
      <c:forEach items="${variant.availableVariants}" var="availVariantMap" varStatus="ctr">
    HK.vpc.availableVariant["${availVariantMap.key}"] = HK.utils.getTextBeforeSeparator("${availVariantMap.value}",HK.vpc.filterValueSeparator);
    HK.vpc.availableVariantOOS["${availVariantMap.key}"] = HK.utils.getTextAfterSeparator("${availVariantMap.value}",HK.vpc.filterValueSeparator);
      </c:forEach>
  </script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/variant/variant.m.js?${versionNumber}"></script>
  <s:layout-render name="/pages/hdtemplates/variantComboItemTemplate.m.jsp"/>
  <s:layout-render name="/pages/hdtemplates/boughtTogetherItemTemplate.m.jsp"/>
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

      var a = document.getElementsByClassName('wrapper');

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
             var point1, point2 , pointStartX1, pointStartX2, pointStartY1, pointStartY2, deltaX1, deltaX2, deltaY1, deltaY2;

             var i;
//, scroller = [], len = document.getElementsByClassName('pd_slider').length;

             //var scrollerArray = document.getElementsByClassName('scroller');

            // for(i=0; i<scrollerArray.length; i++){
var scroller1, scroller2;
            //  var length = scrollerArray[i].children.length;
if(document.getElementById('comboOffer') != null){
              scroller1 = new iScroll("comboOffer", {

               bounce: true,

                        momentum: true,

                      //hScroll: true,

                  vScroll: false,

                  hScrollbar: false,

                  vScrollbar: false,

         snap:true,

                  onBeforeScrollStart: function(e) {

                   console.log("onBeforeScrollStart");

                      point1 = e.touches[0];

                      pointStartX1 = point1.pageX;

                      pointStartY1 = point1.pageY;

                      null;

                  },

                  onBeforeScrollMove: function(e) {

                   console.log(e);

                   point1 = e.touches[0];

                   //alert("onBeforeScrollMove");

                      deltaX1 = Math.abs(point1.pageX - pointStartX1);

                      deltaY1 = Math.abs(point1.pageY - pointStartY1);

                      if (deltaX1 >= deltaY1) {

                       

                          e.preventDefault();

                         // alert("horizontal");

                      } else {

                       //alert("vertical");

                          null;

                          

                      }

                  }

              }); 
 setTimeout(function(){
               scroller1.refresh();


             }, 100);

}

           



            

            }

        }else{

         var a = document.getElementsByClassName('wrapper');

          for(var i=0;i < a.length;i++){

           a[i].style.overflowX = 'auto';

           a[i].style.webkitOverflowScrolling = 'touch';

           }

        }

    }

    

     else if(iOS){

  if(navigator.userAgent.match(/(iPad|iPhone|iPod|iPod touch);.*CPU.*OS (6|7)_\d/i) ? true : false){

  var a = document.getElementsByClassName('wrapper');
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

   var a = document.getElementsByClassName('wrapper');

       for(var i=0;i < a.length;i++){

        a[i].style.overflowX = 'auto';

    a[i].style.webkitOverflowScrolling = 'touch';
    }

    }



</script>
        

	<script>
	
	for(var i=0;i< document.getElementsByClassName('font12 pd10').length;i++){
		document.getElementsByClassName('font12 pd10')[i].style.width = document.body.clientWidth +'px';
		document.getElementsByClassName('font12 pd10')[i].style.overflowX = 'auto';
		document.getElementsByClassName('font12 pd10')[i].style.boxSizing = 'border-box';
	}
	</script>
  <c:if test="${variant.showNotifyMe}">
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/notify/notify.js"></script>
  </c:if>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.m.js?${versionNumber}"></script>
</s:layout-component>
</s:layout-render>
