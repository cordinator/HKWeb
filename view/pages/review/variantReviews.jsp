<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp">

  <s:useActionBean beanclass="com.hk.web.action.beta.review.StoreVariantReviewAction" var="storeVariantAction"/>

  <s:layout-component name="content">
    <c:set var="HK_USER" value="<%=RoleConstants.HK_USER%>"/>
    <c:set var="HKUNVERIFIED" value="<%=RoleConstants.HK_UNVERIFIED%>"/>
    <div class="mainContainer">
      <div class="container clearfix">

        <%--breadcrumbs begins--%>
        <div class="hk-breadcrumb-cntnr mrgn-bt-10">
          <span>
            <a href="/" title="Home">Home</a>
          </span>
          <span>&raquo;</span>
          <span>
            <a href="${storeVariantAction.variantReviewAllResponse.storeVariantBasic.url}">${storeVariantAction.variantReviewAllResponse.storeVariantBasic.name}</a>
          </span>
          <span>&raquo;</span>
          <span class="fnt-bold">Reviews</span>
        </div>
        <%--breadcrumbs ends--%>

        <div class="ttl-cntnr mrgn-b-10">
            <span class="icn icn-sqre"></span>
            <h1 class=""> ${storeVariantAction.variantReviewAllResponse.storeVariantBasic.name}</h1>
            <span class="icn icn-sqre"></span>
          </div>
        <div class=row>
        <div class="span11  brdr-r pad-r-40">
            <div class="row">


              <div class="vrnt-rvw-cnt cont-lft rvw-box " data-review-for="13218" >
                <div class="cont-lft ">

                  <div class="big-star-rtng mrgn-l-20"><fmt:formatNumber maxFractionDigits="1" value="${storeVariantAction.avgRating}" /></div>
                  <p class="fnt-sz10 txt-cntr">Average Rating</p>
                  <p class="fnt-sz9 fnt-bold">(Based on ${storeVariantAction.totRating} ratings)</p>
                </div>

                <ul class="rtng-bars-cnt">
                 <%--//TODO# logic needs to be implemented from backend --%>
                <c:forEach begin="0" end="4" var="reviewRatingDomain">
                  <li class="hk-font-small tmargin3">
                    <p class="txt-lft disp-inln"><span class="review-link-underline"> <strong>${5-reviewRatingDomain} star</strong></span></p>
                    <div class="rating-bars">
                      <div class="progress" style="width:${storeVariantAction.reviewRatingTotMap[5-reviewRatingDomain]}%"></div>
                    </div>
                    <p class="txt-rgt disp-inln rtng-count">${storeVariantAction.reviewRatingMap[5-reviewRatingDomain]}</p>
                  </li>
                </c:forEach>

                </ul>
              </div>
              <div class="span5 cont-rht">
                <div class="ratng-cntnr">
                  <shiro:hasAnyRoles name="${HK_USER},${HKUNVERIFIED}">
                    <p>Have you used this product rate it now</p>
                    <div class="mrgn-t-10">
                      <ul class="hk-give-star">
                        <li class="user-rating" style="width:0%"></li>
                        <li><a title="Rate 1 star" class="star-1">1</a></li>
                        <li><a title="Rate 2 stars" class="stars-2">2</a></li>
                        <li><a title="Rate 3 stars" class="stars-3">3</a></li>
                        <li><a title="Rate 4 stars" class="stars-4">4</a></li>
                        <li><a title="Rate 5 stars" class="stars-5">5</a></li>
                      </ul>
                    </div>
                  </shiro:hasAnyRoles>
                  <div class="span3 alpha mrgn-t-35">
                    <s:link beanclass="com.hk.web.action.beta.review.StoreVariantReviewAction" event="reviewCrud"
                            class="btn btn-gray">
                      write a review
                      <s:param name="storeVariantId" value="${storeVariantAction.storeVariantId}"/>
                    </s:link>
                  </div>
                </div>
              </div>
            </div>

          <div class="alpha brdr-t pad-tb-30 clr-cont">
            <div class="alpha cont-lft">
              <s:form beanclass="com.hk.web.action.beta.review.StoreVariantReviewAction" id="reviewForm">
                <div class="disp-inln txt-small alpha omega mrgn-t-5">Sort By</div>
                <div class="disp-inln alpha omega">
                  <s:select name="reviewSortType" class="drp-dwn"
                            value="${storeVariantAction.variantReviewAllResponse.appliedSortTypeId}" id="reviewSort">
                    <c:forEach items="${storeVariantAction.variantReviewAllResponse.availableSortTypes}"
                               var="variantSort">
                      <s:option value="${variantSort.key}">${variantSort.value}</s:option>
                    </c:forEach>
                  </s:select>
                </div>
                <s:hidden name="storeVariantId" value="${storeVariantAction.storeVariantId}" id="storeVariantId"/>
              </s:form>
            </div>
            <div class="cont-rht alpha ">
              <s:layout-render name="/layouts/paginationResultCount.jsp" paginatedBean="${storeVariantAction}" noOfReviews = "${storeVariantAction.variantReviewAllResponse.totalResults}"/>
            </div>
          </div>


          <s:layout-render name="/layouts/reviewLayout.jsp"
                           variantReviews="${storeVariantAction.variantReviewAllResponse.variantReviews}"/>
          <s:layout-render name="/layouts/pagination.jsp" paginatedBean="${storeVariantAction}"/>
        </div>

        <div class="span4">
            <s:layout-render name="/layouts/variantBasicLayout.jsp"
                             storeVariantBasic="${storeVariantAction.variantReviewAllResponse.storeVariantBasic}"/>
        </div>
        </div>
      </div>
    </div>

      <c:if test= "${storeVariantAction.variantReviewAllResponse.storeVariantBasic.showNotifyMe eq true}">
        <s:layout-render name="/layouts/dialogLayout.jsp" dialogId ="notifyDialog" layoutType="notifyDialog" dialogTitle = "Notify Me" dialogBtn="notify-submit" user= "notifyUserName" email="notifyEmail" phone ="notifyPhone"  />
      </c:if>
      <%--do not delete overlayDiv this is for dialog box--%>
      <div id="overlayDIV" class="hide"></div>
  </s:layout-component>
  <s:layout-component name="scriptComponent">
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/review/review.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $('#reviewSort').change(function () {
          $('#reviewForm').submit();
        });
      });
    </script>
      <c:if test= "${storeVariantAction.variantReviewAllResponse.storeVariantBasic.showNotifyMe eq true}">
          <script type="text/javascript" src="<hk:vhostJs/>/assets/js/notify/notify.js?v=1.1"></script>
      </c:if>
  </s:layout-component>
</s:layout-render>