<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp">
<s:useActionBean beanclass="com.hk.web.action.beta.pack.PackAction" var="packAction"/>
<s:layout-component name="content">
  <c:set var="requestParamSeperator" value="<%=RequestConstants.REQ_PARAM_SEP%>"/>
  <c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>"/>
  <c:set var="filterKeyValueSeperator" value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>"/>

  <div class="mainContainer">
    <div class="container clearfix pad-t-30">

      <div class="span4 alpha">
        <div class="brwse-cont">
          FILTER BY <span id="clear-all" onclick="clearAllFilters();">Reset all</span>
        </div>

        <div class="fltr-box-cont" id="cat-filter-div">
          <div class="hdr2">
            <span class="collapsible-hdr">
              <span class="icn icn-collapse"></span>
            </span>
            Category

            <a href="javascript:void(0)" class="clr-brands" id="clear-cat"> clear</a>
          </div>
          <div class="collapsible-cntnt">
            <ul class="fltr-items scroll">
              <c:forEach items="${packAction.primaryCategories}" var="categoriesValue">
                <li>
                  <input value="${categoriesValue.prefix}" class="filterChk cat-filter" type="checkbox"
                         onclick="buildFiltersAndFetch();"/>
                  <span class="fnt-sz10">${categoriesValue.name}</span>
                </li>
              </c:forEach>
            </ul>
          </div>
        </div>

        <div class="fltr-box-cont" id="brand-filter-div">
          <div class="hdr2">
            <span class="collapsible-hdr">
              <span class="icn icn-collapse"></span>
            </span>
            Brand

            <a href="javascript:void(0)" class="clr-brands" id="clear-brands"> clear</a>
          </div>
          <div class="collapsible-cntnt">
            <div class="head-sec">
              <div class="fltr-inpt-box">
                <input id="search-brands" type="text" placeholder="Search by Brand" autocomplete="off"/>
                <span class="icn icn-search icn-search-img"></span>
              </div>
            </div>
            <ul class="fltr-items scroll">
              <c:forEach items="${packAction.brands}" var="brandsValues">
                <li>
                  <input value="${brandsValues.id}" class="filterChk brand-filter" type="checkbox"
                         onclick="buildFiltersAndFetch();"/>
                  <span class="fnt-sz10">${brandsValues.displayName}</span>
                </li>
              </c:forEach>
            </ul>

          </div>
        </div>
      </div>

      <input type="hidden" value="${packAction.brandStr}" id="brand-str"/>
      <input type="hidden" value="${packAction.catPrefixes}" id="cat-prefixes"/>
      <s:link beanclass="com.hk.web.action.beta.pack.PackAction" event="pre" class="hide" id="pack-link"/>

      <div class="span12 selected-filter-div ">
        <span class="fnt-bold mrgn-r-5">Filters: </span>
      </div>
      <div class="span12 ">
        <c:forEach items="${packAction.packList}" var="pack">
          <s:layout-render name="/layouts/packLayout.jsp" pack="${pack}"/>
          <%--<hr>--%>
        </c:forEach>
      </div>
    </div>
  </div>
</s:layout-component>
<s:layout-component name="scriptComponent">
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/underscore-1.3.1.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/pack/pack.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/cart/cart.js"></script>
  <script type="text/javascript">

    <%--TODO: find a better way for implementing this--%>
    function buildFilterKeyVariantMap() {
      return {
        <c:forEach items="${packAction.packList}" var="pack" varStatus="packCtr">
        <c:set var="packId" value="${pack.id}"/>
        <c:forEach items="${pack.packStoreProducts}" var="packProduct" varStatus="packSpLoopCtr">
        <c:set var="packSpCtr" value="${packSpLoopCtr.index}"/>

        <c:forEach items="${packProduct.availableVariants}" var="availVariantMap" varStatus="ctr">
        "${packId}${filterSeperator}${packSpCtr}${filterSeperator}${availVariantMap.key}":"${availVariantMap.value}"
        <c:if test="${!ctr.last}">
        ,
          </c:if>
          </c:forEach>
          <c:if test="${!packSpLoopCtr.last}">
          ,
          </c:if>
          </c:forEach>
          <c:if test="${!packCtr.last}">
          ,
    </c:if>
    </c:forEach>
    }
    ;
    }

    function buildBrandFilter() {
      var selectedBrandFilters = $('input:checkbox.brand-filter:checked');
      var brandFilterStr = "";
      if (selectedBrandFilters.length > 0) {
        brandFilterStr += "brandStr=";

        selectedBrandFilters.each(function() {
          brandFilterStr += $(this).attr("value") + "${requestParamSeperator}";
        });
      }
      return brandFilterStr;
    }

    function buildCategoryFilter() {
      var selectedCatFilters = $('input:checkbox.cat-filter:checked');
      var catFilterStr = "";
      if (selectedCatFilters.length > 0) {
        catFilterStr += "catPrefixes=";

        selectedCatFilters.each(function() {
          catFilterStr += $(this).attr("value") + "${requestParamSeperator}";
        });
      }
      return catFilterStr;
    }

    function buildFiltersAndFetch() {
      var filterStr = "&z=1";
      var brandFilterStr = buildBrandFilter();
      var catFilterStr = buildCategoryFilter();

      if (brandFilterStr.length > 0) {
        filterStr += "&" + brandFilterStr;
      }

      if (catFilterStr.length > 0) {
        filterStr += "&" + catFilterStr;
      }

      var hrefAttr = $('a#pack-link').attr("href");
      window.location.href = hrefAttr + filterStr;
    }

    function handleFilterClear(filterValue) {
      $('input:checkbox[value=' + filterValue + ']').removeAttr("checked");
      $('input:checkbox[value=' + filterValue + ']').click();
    }

    function checkAlreadySelectedItems(allItems, selectedValues) {
      var selectedFilterDiv = $('div.selected-filter-div');
      _.each(selectedValues, function(item) {
        if (item.trim() != "") {
          var filterApplied = '[value=' + item + ']';
          var toBeCheckedItem = allItems.filter(filterApplied);
          toBeCheckedItem.attr("checked", "checked");

          selectedFilterDiv.append("<span class='filter-box'>" +
                                   toBeCheckedItem.parent('li').find('span').text() +
                                   " <span data-val='" + item + "' class='icn icn-close1 filter-remove'></span>" +
                                   "</span>");
        }
      });
    }

    function clearBrandFilters() {
      $('div#brand-filter-div input:checkbox').removeAttr("checked");
      buildFiltersAndFetch();
    }

    function clearCatFilters() {
      $('div#cat-filter-div input:checkbox').removeAttr("checked");
      buildFiltersAndFetch();
    }

    function clearAllFilters() {
      clearBrandFilters();
      clearCatFilters();
    }

    $('#clear-cat').click( function(){
        clearCatFilters();
    });
    $('#clear-brands').click( function(){
      clearBrandFilters();
    });

    $(document).ready(function() {
      //check already selected categories
      var catDiv = $('div#cat-filter-div');
      var selectedCategories = $('input:hidden#cat-prefixes').val().split("${requestParamSeperator}");
      checkAlreadySelectedItems(catDiv.find('input:checkbox.cat-filter'), selectedCategories);

      //check already selected brands
      var brandDiv = $('div#brand-filter-div');
      var selectedBrands = $('input:hidden#brand-str').val().split("${requestParamSeperator}");
      checkAlreadySelectedItems(brandDiv.find('input:checkbox.brand-filter'), selectedBrands);

      var keyVariantMap = buildFilterKeyVariantMap();
      HK.Pack().setKeyVariantMap(keyVariantMap);
      HK.Pack().setFilterSeperators('${filterSeperator}', '${filterKeyValueSeperator}');
      HK.Pack().markSelectedOptions();

      $('select.diff-attr').change(function() {
        HK.Pack().changeVariantInPack(this);
      });

      $('span.filter-remove').click(function() {
        var relatedCheckbox = $('input:checkbox[value=' + $(this).attr('data-val') + ']');
        relatedCheckbox.removeAttr("checked");
        buildFiltersAndFetch();
      });
      $(".fltr-box-cont").collapsible();
    });
  </script>
</s:layout-component>
</s:layout-render>