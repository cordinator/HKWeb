<%@include file="/includes/taglibInclude.jsp" %>
<%
  boolean showMenu = (Boolean) pageContext.getAttribute("showMenu");
%>
<s:layout-definition>
  <s:useActionBean beanclass="com.hk.web.action.beta.menu.StoreMenuAction" var="menuAction" event="pre"/>
  <c:set var="maxLeafElms" value="11"/>
  <div class="flyout-menu">
    <div id="dropDownButton" class="menu-hdr">
      <div class="hdr-title font-caps">Categories</div>
      <div class="icn-dwn-cs2"></div>
    </div>
    <c:set var="expandedMenu" value="${showMenu != null && showMenu == 'true' ? true : false}"/>
    <div id="dropDownbox1" class="dropDownboxHomePage ${expandedMenu ? '' : 'hide'}">
      <div class="brdr-t-blu-strip"></div>
      <ul class="gm gl">
        <c:forEach items="${menuAction.menuNodes}" var="menuNode" varStatus="count">
          <c:set var="menuNode" value="${hk:appendItrackerParamsForMenuNode(menuNode, expandedMenu)}"/>

          <c:choose>
            <c:when test="${count.index lt 3}">
              <li class="gm-mc gm-brdr-l-orange">
            </c:when>
            <c:when test="${count.index ge 3 and count.index le 7}">
              <li class="gm-mc gm-brdr-l-green">
            </c:when>
            <c:otherwise>
              <li class="gm-mc gm-brdr-l-blue">
            </c:otherwise>
          </c:choose>

          <%--<li class="gm-mc">--%>


          <a href="${menuNode.url}" class="gm-mc-nm">${menuNode.name}</a>
          <span style="">&raquo;</span>

          <div class="hide gm-sc-cntnr">
            <div class="brdr-t-blu-strip" style="position: relative;"></div>
            <h3>
              <a href="${menuNode.url}" class="gm-mc-nm">${menuNode.name}</a>
              <hr class="mrgn-b-25">
            </h3>

            <ul class="gm-sc-list">
              <div class="span3">
                <c:forEach items="${menuNode.childNodes}" var="l1child" varStatus="cntr">

                <c:if test="${cntr.index > 0 && cntr.index%2 ==0}">
              </div>
              <div class="span3">
                </c:if>

                <a href="${l1child.url}" class="gm-sc-nm">${l1child.name}&nbsp;&raquo;</a>

                <c:set var="leafElms"
                       value="${fn:length(l1child.childNodes)>maxLeafElms?maxLeafElms:fn:length(l1child.childNodes)}"/>
                  <%--<c:set var="seeMore" value="${fn:length(l1child.childNodes)>maxLeafElms?'true':'false'}"/>--%>
                <div class="gl gm-tc-list">

                  <c:forEach items="${l1child.childNodes}" var="l2child" end="${leafElms}" varStatus="counter">
                    <a href="${l2child.url}" class="gm-tc-nm">${l2child.name}</a>
                    <%--c:if test="${counter.last && seeMore}">
                    <a href="#" class="seeMore">See All in ${l1child.name}</a>
                    </c:if--%>
                  </c:forEach>
                </div>
                </c:forEach>
              </div>
            </ul>
          </div>
          </li>
        </c:forEach>
        <li class="gm-mc brdr-t gm-brdr-l-gray">
          <a href="http://www.healthkart.com/store/clearance/index.jsp" class="fnt-bolder fnt-ttl">Clearance Sale</a>
          <span style="">&raquo;</span>
        </li>
        <%--<li class="gm-mc gm-brdr-l-purple">--%>
          <%--<a href="http://www.healthkart.com/lp/allBrands/index.jsp" class="fnt-bolder fnt-ttl">Top Brands</a>--%>
          <%--<span style="">&raquo;</span>--%>
        <%--</li>--%>

          <%--<li class="gm-mc brdr-t">
            <s:link beanclass="com.hk.web.action.beta.brand.BrandListingAction" class="gm-mc-nm">Brands</s:link>
            <span style="">&raquo;</span>
          </li>--%>
      </ul>
        <%--<div class="seperator"></div>
      <div class="dropDownitem">Separated link</div>--%>
    </div>
  </div>
</s:layout-definition>