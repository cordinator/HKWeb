<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp">
<s:useActionBean beanclass="com.hk.web.action.beta.variant.StoreVariantCompareAction" var="variantAction"/>
<s:layout-component name="content">
<div class="mainContainer">
<div class="container_16">
<c:set var="variantComparison" value="${variantAction.storeVariantComparison}"/>
<div class="span16 alpha omega">
  <div class="ttl-cntnr">
    <span class="icn icn-sqre"></span>

    <h1> Compare Products</h1>
    <span class="icn icn-sqre"></span>
  </div>
</div>
<div class="span16 alpha omega">

  <%--Compare Floating header begins--%>
<table id="cmpre-floating-hdr" class="cmpre-floating-tbl hide">
  <tbody>
  <tr>
    <td></td>
    <c:set var="blnkTdCtr" value="0"/>
    <c:forEach items="${variantComparison.variantCompareBasicInfoList}" var="variantinfo" varStatus="ctr">
      <c:set var="primaryImage" value="${variantComparison.primaryImageList[ctr.index]}"/>
      <td class=" ${ctr.last ? 'head-items last' : 'head-items'}">
        <c:set var="blnkTdCtr" value="${blnkTdCtr + 1}"/>
        <s:link class="icn icn-close2 remove-varnt"
                beanclass="com.hk.web.action.beta.variant.StoreVariantCompareAction"
                event="removeVariantsToCompare">
          &nbsp;
          <s:param name="storeVariantId" value="${variantinfo.id}"/>
        </s:link>
        <div class="varnt-title">
          <a href="${hk:getCompareVariantUrl(variantinfo)}">
              ${variantinfo.name}
          </a>
        </div>
      </td>
    </c:forEach>
    <c:forEach begin="${blnkTdCtr}" end="3">
      <td class="last-cell"></td>
    </c:forEach>

  </tr>
  <tr>
    <td></td>
    <c:set var="blnkTdCtr" value="0"/>
    <c:forEach items="${variantComparison.variantCompareBasicInfoList}" var="variantinfo" varStatus="ctr">
      <td>
        <c:set var="blnkTdCtr" value="${blnkTdCtr + 1}"/>
        <div class="varnt-title">
          <p class="mrgn-b-10 price">Rs. ${variantinfo.offerPrice}</p>
            <%--<c:choose>
              <c:when test="${variantinfo.oos && variantinfo.notifyMe}">
                <input type="submit" varid="${variantinfo.id}" oldVariantId="${variantinfo.oldVariantId}" qty="1"
                       class="notifyBtn btn btn-orange-mini mrgn-b-5" value="Notify Me"/>

                <p class="fnt-caps fnt-sz10 mrgn-t-10 fnt-bold"> Out of stock</p>
              </c:when>
              <c:when test="${variantinfo.oos}">
                <span class="fnt-sz14">Out of stock</span>
              </c:when>
              <c:otherwise>
                <input type="button" varid="${variantinfo.id}" data-scroll-to-top="true"
                       oldVariantId="${variantinfo.oldVariantId}" qty="1"
                       class="addToCart btn btn-blue-mini  mrgn-b-5"
                       value="Buy Now"/>

                <p class="fnt-caps fnt-sz10 mrgn-t-10 fnt-bold"> In stock</p>

              </c:otherwise>
            </c:choose>--%>
          <c:choose>
            <c:when test="${variantinfo.showNotifyMe}">
              <input type="submit" varId="${variantinfo.id}" qty="1" oldVariantId="${variantinfo.oldVariantId}"
                     class="notifyBtn btn btn-orange-mini mrgn-b-5 hide-if-nojs" value="Notify Me">
              <noscript>
                <s:link beanclass="com.hk.web.action.beta.notify.NotifyMeAction" class="notifyBtn btn btn-orange mrgn-b-5 disp-inln">
                  <s:param  name="storeVariantId" value="${variantinfo.id}" />
                  <s:param name="oldVariantId" value="${variantinfo.oldVariantId}"/>
                  <s:param name="variantLink" value="${hk:getCompareVariantUrl(variantinfo)}" />
                  Notify Me</s:link>
              </noscript>


              <p class="fnt-caps fnt-sz-10 mrgn-t-10 fnt-bold"> Out of stock</p>
            </c:when>
            <c:otherwise>
              <c:choose>
                <c:when test="${variantinfo.oos}">
                  <span class="fnt-sz14">Out of stock</span>
                </c:when>
                <c:otherwise>
                  <input type="submit" varid="${variantinfo.id}" data-scroll-to-top="true"
                         oldVariantId="${variantinfo.oldVariantId}" qty="1"  catPrefix="${variantinfo.catPrefix}"
                         class="addToCart btn btn-blue-mini  mrgn-b-5"
                         value="Buy Now"/>

                  <p class="fnt-caps fnt-sz10 mrgn-t-10 fnt-bold"> In stock</p>
                </c:otherwise>
              </c:choose>
            </c:otherwise>
          </c:choose>
        </div>
      </td>
    </c:forEach>
    <c:forEach begin="${blnkTdCtr}" end="3">
      <td class="last-cell"></td>
    </c:forEach>
  </tr>
  </tbody>
</table>
  <%--Compare Floating header ends--%>


<table class="cmpre-varnts-tbl" cellspacing="0" cellpadding="0">
<thead>
  <%--Compare Variant image section begins--%>
<tr>
  <th></th>
  <c:set var="blnkTdCtr" value="0"/>
  <c:forEach items="${variantComparison.variantCompareBasicInfoList}" var="variantinfo" varStatus="ctr">
    <c:set var="primaryImage" value="${variantComparison.primaryImageList[ctr.index]}"/>

    <th class="${ctr.last ? 'head-items last' : 'head-items'}">
      <s:link class="icn icn-close2 remove-varnt"
              beanclass="com.hk.web.action.beta.variant.StoreVariantCompareAction"
              event="removeVariantsToCompare">
        &nbsp;
        <s:param name="storeVariantId" value="${variantinfo.id}"/>
      </s:link>
      <c:set var="blnkTdCtr" value="${blnkTdCtr + 1}"/>
      <div class="img-box img-box-160">
        <a href="${hk:getCompareVariantUrl(variantinfo)}">
          <img src="${primaryImage.slink}" alt="${primaryImage.altText}"/>
        </a>
      </div>
    </th>
  </c:forEach>
  <c:forEach begin="${blnkTdCtr}" end="3" var="ctr">
    <th class="last-cell">
      <div class="add-varnt-cont">
          <%--<div class="icn-add-img mrgn-cntr"></div>--%>
        <div class="title">
          You can add upto four products
          at any given time
        </div>
      </div>
        <%-- TODO -Following items will be uncommented when following items becomes actionable --%>
        <%--
        <div class="add-varnt-parmtr cont-lft">
        <div class="varnt-title cont-lft">Brand</div>
        <select class="varnt-selct cont-rht">
        <option> - Select One -</option>
        <option>Whey</option>
        </select>
        </div>
        <div class="add-varnt-parmtr cont-lft">
        <div class="varnt-title cont-lft">Product</div>
        <select class="varnt-selct cont-rht">
        <option> - Select One -</option>
        <option>Whey</option>
        </select>
        </div>--%>
    </th>
  </c:forEach>


</tr>
  <%--Compare Variant image section ends--%>

  <%--Compare Variant name section begins--%>
<tr>
  <th></th>
  <c:set var="blnkTdCtr" value="0"/>
  <c:forEach items="${variantComparison.variantCompareBasicInfoList}" var="variantinfo" varStatus="ctr">
    <c:set var="primaryImage" value="${variantComparison.primaryImageList[ctr.index]}"/>
    <th class=" ${ctr.last ? 'head-items last' : 'head-items'}">
      <c:set var="blnkTdCtr" value="${blnkTdCtr + 1}"/>
      <div class="varnt-title">
        <a href="${hk:getCompareVariantUrl(variantinfo)}">
            ${variantinfo.name}
        </a>
      </div>
    </th>
  </c:forEach>
  <c:forEach begin="${blnkTdCtr}" end="3">
    <th class="last-cell"></th>
  </c:forEach>
</tr>
  <%--Compare Variant name section ends--%>

  <%--Price and Buy Now section begins--%>
<tr>
  <th class=""></th>
  <c:set var="blnkTdCtr" value="0"/>
  <c:forEach items="${variantComparison.variantCompareBasicInfoList}" var="variantinfo" varStatus="ctr">
    <c:set var="primaryImage" value="${variantComparison.primaryImageList[ctr.index]}"/>
    <th class=" ${ctr.last ? 'head-items last' : 'head-items'}">
      <c:set var="blnkTdCtr" value="${blnkTdCtr + 1}"/>
      <div class="varnt-title">
        <p class="mrgn-b-10 price">Rs. ${variantinfo.offerPrice}</p>

          <%--<c:choose>
            <c:when test="${variantinfo.oos && variantinfo.notifyMe}">

              <input type="submit" varid="${variantinfo.id}" qty="1" oldVariantId="${variantinfo.oldVariantId}"
                     class="notifyBtn btn btn-orange-mini mrgn-b-5" value="Notify Me"/>

              <p class="fnt-caps fnt-sz10 mrgn-t-10 fnt-bold"> Out of stock</p>
            </c:when>
            <c:when test="${variantinfo.oos}">
              <span class="fnt-sz14">Out of stock</span>
            </c:when>
            <c:otherwise>
              <input type="submit" varid="${variantinfo.id}" data-scroll-to-top="true"
                     oldVariantId="${variantinfo.oldVariantId}" qty="1"
                     class="addToCart btn btn-blue-mini   mrgn-b-5"
                     value="Buy Now"/>

              <p class="fnt-caps fnt-sz10 mrgn-t-10 fnt-bold"> In stock</p>

            </c:otherwise>
          </c:choose>--%>
        <c:choose>
          <c:when test="${variantinfo.showNotifyMe}">
            <input type="submit" varId="${variantinfo.id}" qty="1" oldVariantId="${variantinfo.oldVariantId}"
                   class="notifyBtn btn btn-orange-mini mrgn-b-5 hide-if-nojs" value="Notify Me">
            <noscript>
              <s:link beanclass="com.hk.web.action.beta.notify.NotifyMeAction" class="notifyBtn btn btn-orange mrgn-b-5 disp-inln">
                <s:param  name="storeVariantId" value="${variantinfo.id}" />
                <s:param name="oldVariantId" value="${variantinfo.oldVariantId}"/>
                <s:param name="variantLink" value="${hk:getCompareVariantUrl(variantinfo)}" />
                Notify Me</s:link>
            </noscript>


            <p class="fnt-caps fnt-sz10 mrgn-t-10 fnt-bold"> Out of stock</p>
          </c:when>
          <c:otherwise>
            <c:choose>
              <c:when test="${variantinfo.oos}">
                <span class="fnt-sz14">Out of stock</span>
              </c:when>
              <c:otherwise>
                <input type="submit" varid="${variantinfo.id}" data-scroll-to-top="true"
                       oldVariantId="${variantinfo.oldVariantId}" qty="1" catPrefix="${variantinfo.catPrefix}"
                       class="addToCart btn btn-blue-mini  mrgn-b-5"
                       value="Buy Now"/>

                <p class="fnt-caps fnt-sz10 mrgn-t-10 fnt-bold"> In stock</p>
              </c:otherwise>
            </c:choose>
          </c:otherwise>
        </c:choose>
      </div>
    </th>
  </c:forEach>
  <c:forEach begin="${blnkTdCtr}" end="3">
    <th class="last-cell"></th>
  </c:forEach>
</tr>
  <%--Price and Buy Now section ends--%>
</thead>
<tbody>
<tr class="varnt-specs-tr first-tr">
  <td class="border-td">Availability</td>
  <c:set var="blnkTdCtr" value="0"/>
  <c:forEach items="${variantComparison.variantCompareBasicInfoList}" var="availGrp">
    <td class="border-td">
        ${availGrp.oos ? 'No' : 'Yes'}
    </td>
    <c:set var="blnkTdCtr" value="${blnkTdCtr + 1}"/>
  </c:forEach>
  <c:if test="${blnkTdCtr < 4}">
    <c:forEach begin="${blnkTdCtr}" end="3">
      <td class="empty-item border-td"></td>
    </c:forEach>
  </c:if>
</tr>
<tr class="varnt-specs-tr bg-gray">
  <td class="border-td btm-brdr">Dispatch in</td>
  <c:set var="blnkTdCtr" value="0"/>
  <c:forEach items="${variantComparison.variantCompareBasicInfoList}" var="dispatchGrp">
    <td class="border-td">
        <%--${dispatchGrp.minDispatchDays} - ${dispatchGrp.maxDispatchDays} days--%>

      <c:choose>
        <c:when test="${dispatchGrp.dispatchDataAvail}">
          <c:choose>
            <c:when test="${dispatchGrp.jit eq true}">
              6 - 8
              DAYS
            </c:when>
            <c:otherwise>
              1 - 3
              DAYS
            </c:otherwise>
          </c:choose>
        </c:when>
        <c:otherwise>
          ${dispatchGrp.minDispatchDays}
          - ${dispatchGrp.maxDispatchDays}
          DAYS

        </c:otherwise>
      </c:choose>
      <c:set var="blnkTdCtr" value="${blnkTdCtr + 1}"/>
    </td>
  </c:forEach>
  <c:if test="${blnkTdCtr < 4}">
    <c:forEach begin="${blnkTdCtr}" end="3">
      <td class="empty-item border-td"></td>
    </c:forEach>
  </c:if>
</tr>
<c:forEach items="${variantComparison.variantGroups}" var="group">
  <tr>
    <td class="empty-row" colspan="5"></td>
  </tr>
  <tr group-name="${group.name}" class="specs-hdr-tr">
    <td colspan="5">
      <div class="varnt-specs-hdr"> ${group.displayName}</div>
    </td>
  </tr>
  <c:if test="${group.groupValues!=null}">
    <c:set var="grpSize" value="${fn:length(group.groupValues)}"/>
  </c:if>
  <c:forEach items="${group.groupValues}" var="groupValue" varStatus="ctr">
    <c:choose>
      <c:when test="${grpSize == 1}">
        <tr class="top-brdr btm-brdr varnt-specs-tr" group-value-name="${groupValue.name}">
      </c:when>
      <c:otherwise>
        <c:if test="${ctr.first}">
          <tr class="top-brdr varnt-specs-tr" group-value-name="${groupValue.name}">
        </c:if>
        <c:if test="${ctr.last}">
          <tr class="${ctr.index%2==0? 'varnt-specs-tr btm-brdr':'btm-brdr varnt-specs-tr bg-gray'}" group-value-name="${groupValue.name}">
        </c:if>
        <c:if test="${!(ctr.first || ctr.last)}">
          <tr class="${ctr.index%2==0? 'varnt-specs-tr ':' varnt-specs-tr bg-gray'}" group-value-name="${groupValue.name}">
        </c:if>
      </c:otherwise>
    </c:choose>
    <td class="border-td">${groupValue.displayName}</td>
    <c:set var="blnkTdCtr" value="0"/>
    <c:forEach items="${groupValue.values}" var="value">
      <td class="border-td">${value}</td>
      <c:set var="blnkTdCtr" value="${blnkTdCtr + 1}"/>
    </c:forEach>
    <c:if test="${blnkTdCtr < 4}">
      <c:forEach begin="${blnkTdCtr}" end="3">
        <td class="empty-item border-td"></td>
      </c:forEach>
    </c:if>
    </tr>
  </c:forEach>
</c:forEach>

</tbody>
</table>
</div>
</div>
</div>
<s:layout-render name="/layouts/dialogLayout.jsp" dialogId="notifyDialog" layoutType="notifyDialog"
                 dialogTitle="Notify Me" dialogBtn="notify-submit" user="notifyUserName" email="notifyEmail"
                 phone="notifyPhone"/>
<%--do not delete overlayDiv this is for dialog box--%>
<div id="overlayDIV" class="hide"></div>
</s:layout-component>
<s:layout-component name="scriptComponent">
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  <script type="text/javascript">

    /*Fixing the left nav*/
    function fixLeftNav() {
      var initialHeight = $(".cmpre-varnts-tbl thead tr:last .varnt-title").offset().top;
      $("#cmpre-floating-hdr").css("top", initialHeight);
      $(window).scroll(function (e) {
        if ($(window).scrollTop() > initialHeight) {
          $('#cmpre-floating-hdr').css({
            position: 'fixed',
            top: 0,
            display: 'table'
          });
        } else {
          $('#cmpre-floating-hdr').css({
            display: 'none'
          });
        }
      });
    }
    if ($(".cmpre-varnts-tbl thead tr:last .varnt-title").is(":visible")) {
      fixLeftNav();
    }

    /*Left nav fixing ends here*/
  </script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/notify/notify.js?v=1.1"></script>
</s:layout-component>
</s:layout-render>