<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp">
<s:useActionBean beanclass="com.hk.web.action.beta.catalog.CatalogActionNew" var="catalogAction"/>

<s:layout-component name="htmlHead">
  <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/assets/css/ui/jquery.ui.accordion.css"
        media="screen">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
        media="screen">
</s:layout-component>

<s:layout-component name="content">
  <script type="text/javascript">
    var menuNodeId = "${catalogAction.menuNodeId}";
    var fromMenu = ${catalogAction.fromMenu};
    var clickCatPrefix = "${catalogAction.clickCatPrefix}";
  </script>
  <div class="wrap">
    <c:set var="brandSeperator" value="<%=RequestConstants.BRAND_SEP%>"/>
    <c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>"/>
    <c:set var="filterKeyValueSeperator" value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>"/>
    <div class="row-fluid">
      <div class="span3">
        <h4 class="filterHead" id="browseHead">BROWSE BY</h4>
        <ul>
          <c:forEach items="${catalogAction.categoryBrowseNodeList}" var="categoryBrowseNode">
            <li class="dropDownitemHomePage">
              <s:link beanclass="com.hk.web.action.beta.catalog.CatalogActionNew" event="clickCategoryNode">
                ${categoryBrowseNode.name}
                <s:param name="clickCatPrefix" value="${categoryBrowseNode.categoryPrefix}"/>
                <s:param name="menuNodeId" value="${catalogAction.menuNodeId}"/>
              </s:link>
              <ul>
                <c:forEach items="${categoryBrowseNode.children}" var="l1child">
                  <li class="dropDownitemHomePage">
                    <s:link beanclass="com.hk.web.action.beta.catalog.CatalogActionNew" event="clickCategoryNode">
                      ${l1child.name}
                      <s:param name="clickCatPrefix" value="${l1child.categoryPrefix}"/>
                      <s:param name="menuNodeId" value="${catalogAction.menuNodeId}"/>
                    </s:link>
                    <ul>
                      <c:forEach items="${l1child.children}" var="l2child">
                        <li class="dropDownitemHomePage">
                          <s:link beanclass="com.hk.web.action.beta.catalog.CatalogActionNew" event="clickCategoryNode">
                            ${l2child.name}
                            <s:param name="clickCatPrefix" value="${l2child.categoryPrefix}"/>
                            <s:param name="menuNodeId" value="${catalogAction.menuNodeId}"/>
                          </s:link>
                          <ul>
                            <c:forEach items="${l2child.children}" var="l3child">
                              <s:link beanclass="com.hk.web.action.beta.catalog.CatalogActionNew" event="clickCategoryNode">
                                ${l3child.name}
                                <s:param name="clickCatPrefix" value="${l3child.categoryPrefix}"/>
                                <s:param name="menuNodeId" value="${catalogAction.menuNodeId}"/>
                              </s:link>
                            </c:forEach>
                          </ul>
                        </li>
                      </c:forEach>
                    </ul>
                  </li>
                </c:forEach>
              </ul>
            </li>
          </c:forEach>
        </ul>


        <div>
          <h4 class="filterHead">Refine</h4>
          <button type="button" class="open-acc btn btn-link">Expand all</button>
          <button type="button" class="close-acc btn btn-link">Collapse all</button>
          <s:link beanclass="com.hk.web.action.beta.catalog.CatalogAction" event="filterResults"
                  class="reset-filter btn btn-link">
            Reset all
            <%--<s:param name="selectedCatPrefix" value="${catalogAction.selectedCatPrefix}"/>--%>
          </s:link>

          <div id="accordion">
            <h3 class="title filterHead">Price</h3>

              <%-- <div class="accPriceContent smallFonts">
                <s:link beanclass="com.hk.web.action.beta.catalog.CatalogAction" event="filterResults">
                  Reset<br/>
                  <s:param name="selectedCatPrefix" value="${catalogAction.selectedCatPrefix}"/>
                  <s:param name="brandStr" value="${catalogAction.brandStr}"/>
                  <s:param name="filterStr" value="${catalogAction.filterStr}"/>
                </s:link>
                  ${catalogAction.priceRange.minPrice} to ${catalogAction.priceRange.maxPrice}
                <div class="clear"></div>
                <c:set var="priceDivide"
                       value="${(catalogAction.priceRange.maxPrice - catalogAction.priceRange.minPrice)/4}"/>
                <c:forEach var="i" begin="1" end="4">
                  <s:link beanclass="com.hk.web.action.beta.catalog.CatalogAction" event="filterResults">
                    Filter under ${catalogAction.priceRange.minPrice + priceDivide*i}
                    <s:param name="minPrice" value="${catalogAction.priceRange.minPrice}"/>
                    <s:param name="maxPrice" value="${catalogAction.priceRange.minPrice + priceDivide*i}"/>
                    <s:param name="selectedCatPrefix" value="${catalogAction.selectedCatPrefix}"/>
                    <s:param name="brandStr" value="${catalogAction.brandStr}"/>
                    <s:param name="filterStr" value="${catalogAction.filterStr}"/>
                  </s:link>
                  <div class="clear"></div>
                </c:forEach>
              </div>--%>


            <h3 class="title filterHead">Brands</h3>

            <div>
              <div id="brandsHeadContent" class="smallFonts">
                <s:link beanclass="com.hk.web.action.beta.catalog.CatalogAction" event="filterResults" class="pull-right"
                        style="text-decoration:none;">
                  clear
                  <%--                  <s:param name="minPrice" value="${catalogAction.minPrice}"/>
                <s:param name="maxPrice" value="${catalogAction.maxPrice}"/>
                <s:param name="selectedCatPrefix" value="${catalogAction.selectedCatPrefix}"/>
                <s:param name="filterStr" value="${catalogAction.filterStr}"/>--%>
                </s:link>

                <div class="clear"></div>

                <div id="brandFilterView" style="background-color:darkgray;">
                  <div id="brandFilterRowTemplate" style="display:none;">

                    <div style="float:left;">
                      {{#if selected}}
                      <input type="checkbox" checked="checked" value={{id}} class="brandChk"/> {{nm}}
                      {{val}}
                      {{else}}
                      <input type="checkbox" value={{id}} class="brandChk"/> {{nm}}
                      {{/if}}

                    </div>
                    <div style="float:right;">
                      {{nv}}
                    </div>
                    <br/>
                  </div>

                </div>
              </div>
            </div>


            <div id="catalogFiltersView" style="background-color:darkgray;">
            </div>

            <div id="catalogFilterTemplate" style="display:none;">
              <h3 class="title filterHead" iname={{iNm}}>{{nm}}</h3>

              {{#each flValues}}
              <div style="float:left;">
                {{#if selected}}
                <input checked="checked" class="filterChk" value={{flVal}} flInm={{flInm}} type="checkbox"/> {{val}}
                {{else}}
                <input class="filterChk" value={{flVal}} flInm={{flInm}} type="checkbox"/> {{val}}
                {{/if}}

              </div>
              <div style="float:right;">
                {{nv}}
              </div>
              <br/>
              {{/each}}
            </div>


          </div>
        </div>

      </div>

      <div class="span9">
          <%--<p class="selectedCat"> ${catalogAction.selectedCatName} </p>--%>

        <div id="topPager" style="background-color:#FCFCFC"></div>

        <div id="filteredByBrandView"></div>


        <div id="filteredByAttrView"></div>


        <table>
          hh
          <div id="variantResultView"></div>
        </table>

        <div id="bottomPager" style="background-color:#FCFCFC"></div>
      </div>
    </div>
  </div>
</s:layout-component>
<s:layout-component name="scriptComponent">


  <script id="pagerTemplate" type="text/x-handlebars-template">

    <div class="pagination pagination-centered">
      {{#pager }}{{/pager}}
    </div>
  </script>

  <script id="filteredByBrandViewTemplate" type="text/x-handlebars-template">
    {{#if selected}}
    {{nm}} <span class="brandFilterSpan" value={{id}}>clear</span>
    {{/if}}
  </script>

  <script id="filteredByAttrViewTemplate" type="text/x-handlebars-template">
    {{#if filtered}}

    {{nm}} :
    {{#each flValues}}
    {{#if selected}}
    {{val}} <span class="filterByAttrSpan" value={{flVal}} flInm={{flInm}}>clear</span>
    {{/if}}
    {{/each}}
    {{/if}}
  </script>

  <script id="variantResultViewTemplate" type="text/x-handlebars-template">
    {{#each variants}}
    {{#zeromod @index 3 0}}
    <tr>
      {{/zeromod}}
      <td>

        <img src="{{img_url}}" alt="{{nm}}" width="210" height="210"/>

        <div class="clear"></div>
        <p class="productNametext"> {{nm}} {{id}}</p>

        {{#if discounted}}
        <p class="strike no-margin smallFonts">Rs.{{mrp}}</p>
        {{/if}}
        <p>
          <span class="productPrice">Rs. {{offerPrice}}</span>
          {{#if discounted}}
          <span class="smallFonts">{{discount}}% off</span>
          {{/if}}

        </p>
      </td>
      {{#zeromod @index 3 2}}
    </tr>
    {{/zeromod}}
    {{/each}}

  </script>

  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/backbone.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/handlebars.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/common.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/catalog/catalogView.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/catalog/catalog.js"></script>
</s:layout-component>
</s:layout-render>