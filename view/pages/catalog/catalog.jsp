<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp">
<s:useActionBean beanclass="com.hk.web.action.beta.catalog.CatalogAction" var="catalogAction"/>

<s:layout-component name="htmlHead">
  <link rel="stylesheet" type="text/css" href="<hk:vhostJs/>/assets/css/ui/jquery.ui.accordion.css"
        media="screen">
</s:layout-component>

<s:layout-component name="content">
<div class="wrap">
<c:set var="brandSeperator" value="<%=RequestConstants.BRAND_SEP%>"/>
<c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>"/>
<c:set var="filterKeyValueSeperator" value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>"/>
<div class="row-fluid">
<div class="span3">
  <h4 class="filterHead" id="browseHead">BROWSE BY</h4>

  <div id="browseContent">
    <c:set var="selCatPrefix" value="${catalogAction.selectedCatPrefix}"/>
    <ul id="menu" class="nav nav-list scrollbox">
      <c:forEach items="${catalogAction.categoryBrowseNodes}" var="categoryBrowseNode">
        <c:choose>
          <c:when test="${fn:toLowerCase(categoryBrowseNode.categoryPrefix) ne selCatPrefix}">
            <li class="nav-header" >
            <s:link beanclass="com.hk.web.action.beta.catalog.CatalogAction" event="filterResults">
              ${categoryBrowseNode.name} (${categoryBrowseNode.noOfVariants})
              <s:param name="selectedCatPrefix" value="${categoryBrowseNode.categoryPrefix}"/>
            </s:link>
          </c:when>
          <c:otherwise>
            <li class="nav-header active">
            <a href="#" class="selected">${categoryBrowseNode.name} (${categoryBrowseNode.noOfVariants})</a>
          </c:otherwise>
        </c:choose>

        <c:if test="${!empty categoryBrowseNode.children}">
          <ul class="navChild nav-list">
            <c:forEach items="${categoryBrowseNode.children}" var="firstLevelChild">
              <c:choose>
                <c:when test="${fn:toLowerCase(firstLevelChild.categoryPrefix) ne selCatPrefix}">
                  <li class="nav-header">
                  <s:link beanclass="com.hk.web.action.beta.catalog.CatalogAction" event="filterResults">
                    ${firstLevelChild.name} (${firstLevelChild.noOfVariants})
                    <s:param name="selectedCatPrefix" value="${firstLevelChild.categoryPrefix}"/>
                  </s:link>
                </c:when>
                <c:otherwise>
                  <li class="nav-header active">
                  <a href="#" class="selected">${firstLevelChild.name} (${firstLevelChild.noOfVariants})</a>
                </c:otherwise>
              </c:choose>

              <c:if test="${!empty firstLevelChild.children}">
                <ul class="navChildChild nav-list">
                  <c:forEach items="${firstLevelChild.children}" var="secondLevelChild">
                    <c:choose>
                      <c:when test="${fn:toLowerCase(secondLevelChild.categoryPrefix) ne selCatPrefix}">
                        <li class="nav-header">
                        <s:link beanclass="com.hk.web.action.beta.catalog.CatalogAction" event="filterResults">
                          ${secondLevelChild.name} (${secondLevelChild.noOfVariants})
                          <s:param name="selectedCatPrefix" value="${secondLevelChild.categoryPrefix}"/>
                        </s:link>
                      </c:when>
                      <c:otherwise>
                        <li class="nav-header active">
                        <a href="#" class="selected">${secondLevelChild.name} (${secondLevelChild.noOfVariants})</a>
                      </c:otherwise>
                    </c:choose>
                    </li>
                  </c:forEach>
                </ul>
              </c:if>
              </li>
            </c:forEach>
          </ul>
        </c:if>
        </li>
      </c:forEach>
    </ul>
  </div>

  <div>
    <h4 class="filterHead">Refine</h4>
    <button type="button" class="open-acc btn btn-link">Expand all</button>
    <button type="button" class="close-acc btn btn-link">Collapse all</button>
    <s:link beanclass="com.hk.web.action.beta.catalog.CatalogAction" event="filterResults" class="reset-filter btn btn-link">
      Reset all
      <s:param name="selectedCatPrefix" value="${catalogAction.selectedCatPrefix}"/>
    </s:link>

    <div id="accordion">
      <h3 class="title filterHead">Price</h3>

      <div class="accPriceContent smallFonts">
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
      </div>


      <h3 class="title filterHead">Brands</h3>

      <div>
        <div id="brandsHeadContent" class="smallFonts">
          <s:link beanclass="com.hk.web.action.beta.catalog.CatalogAction" event="filterResults" class="pull-right"
                  style="text-decoration:none;">
            clear
            <s:param name="minPrice" value="${catalogAction.minPrice}"/>
            <s:param name="maxPrice" value="${catalogAction.maxPrice}"/>
            <s:param name="selectedCatPrefix" value="${catalogAction.selectedCatPrefix}"/>
            <s:param name="filterStr" value="${catalogAction.filterStr}"/>
          </s:link>

          <div class="clear"></div>

          <input type="hidden" value="${catalogAction.selectedBrands}" id="selected-brands"/>

          <div>
            <c:forEach items="${catalogAction.brandListingItems}" var="brand">
              <s:link beanclass="com.hk.web.action.beta.catalog.CatalogAction" event="filterResults" class="sel-brand">
                <input type="checkbox" value="${brand.brandId}"/>
                <s:param name="minPrice" value="${catalogAction.minPrice}"/>
                <s:param name="maxPrice" value="${catalogAction.maxPrice}"/>
                <s:param name="selectedCatPrefix" value="${catalogAction.selectedCatPrefix}"/>
                <s:param name="filterStr" value="${catalogAction.filterStr}"/>
              </s:link>
              ${brand.brandName} (${brand.noOfVariants})
              <div class="clear"></div>
            </c:forEach>
          </div>
        </div>
      </div>

      <c:forEach items="${catalogAction.categoryFilters}" var="filter">
        <h3 class="title filterHead">${filter.filterName}</h3>

        <div>
          <div class="filter-div smallFonts" id="${filter.name}-content" filter-name="${filter.name}">

            <s:link beanclass="com.hk.web.action.beta.catalog.CatalogAction" event="filterResults"
                    class="resetFilter pull-right" style="text-decoration:none;">
              clear
              <s:param name="minPrice" value="${catalogAction.minPrice}"/>
              <s:param name="maxPrice" value="${catalogAction.maxPrice}"/>
              <s:param name="selectedCatPrefix" value="${catalogAction.selectedCatPrefix}"/>
              <s:param name="brandStr" value="${catalogAction.brandStr}"/>
            </s:link>


            <input type="hidden" value="${catalogAction.selectedFilters[filter.name]}"
                   class="selected-filter-values"/>

            <div class="filter-value-div smallFonts">
              <c:forEach items="${filter.filterValues}" var="filter">
                <s:link beanclass="com.hk.web.action.beta.catalog.CatalogAction" event="filterResults" class="filter-link">
                  <input type="checkbox" class="sel-value" value="${filter.filterValue}"/>
                  <s:param name="minPrice" value="${catalogAction.minPrice}"/>
                  <s:param name="maxPrice" value="${catalogAction.maxPrice}"/>
                  <s:param name="selectedCatPrefix" value="${catalogAction.selectedCatPrefix}"/>
                  <%--<s:param name="brandStr" value="${catalogAction.brandStr}"/>--%>
                </s:link>

                ${filter.value} (${filter.noOfVariants})
                <div class="clear"></div>
              </c:forEach>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>

</div>


<div class="span9">
  <p class="selectedCat"> ${catalogAction.selectedCatName} </p>

  <s:layout-render name="/layouts/paginationResultCount.jsp" paginatedBean="${catalogAction}"/>
  <s:layout-render name="/layouts/pagination.jsp" paginatedBean="${catalogAction}"/>

  <table>
    <c:forEach items="${catalogAction.variants}" var="variant" varStatus="ctr">
      <c:if test="${ctr.index%3 == 0}">
        <tr>
      </c:if>
      <td class="well whitebg noBorder" title=" + ${variant.sibblingVariants} more variations">
        <s:link beanclass="com.hk.web.action.beta.variant.StoreVariantAction" event="pre">
          <img src="${variant.mediumImageUrl}" alt="${variant.name}" width="210" height="210"/>

          <div class="clear"></div>
          <p class="productNametext"> ${variant.name}</p>

          <c:if test="${variant.discount > 0}">
            <p class="strike no-margin smallFonts">Rs.${variant.mrp}</p>
          </c:if>
          <p>
            <span class="productPrice">Rs. ${variant.offerPrice}</span>
            <c:if test="${variant.discount > 0}">
              <span class="smallFonts">${variant.discount}% off</span>
            </c:if>
              <%--<c:if test="${variant.sibblingVariants > 0}">
                <div class="clear"></div>
                <span class="smallFonts">+ ${variant.sibblingVariants} more variations</span>
              </c:if>--%>
          </p>
          <s:param name="storeVariantId" value="${variant.id}"/>
        </s:link>
      </td>
      <c:if test="${ctr.index%3 == 2 || ctr.last}">
        </tr>
      </c:if>
    </c:forEach>
  </table>
</div>
</div>
</div>
</s:layout-component>
<s:layout-component name="scriptComponent">
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/accordion.js"></script>
  <script type="text/javascript">

    function buildFilterAndFetch() {
      var filterString = "filterStr=";
      var filterDivList = $("div.filter-div");

      filterDivList.each(function() {
        var filterDiv = $(this);
        var filterName = filterDiv.attr("filter-name");
        var filterValues = filterDiv.find("div.filter-value-div").find('input:checkbox:checked');
        if (filterValues.length > 0) {
          filterString += filterName + "${filterKeyValueSeperator}";
          filterValues.each(function() {
            filterString = filterString + $(this).attr("value") + "${filterKeyValueSeperator}";
          });
          filterString += "${filterSeperator}";
        }
      });

      return filterString;
    }

    function buildBrandAndFetch(brandDiv) {
      var brands = brandDiv.find('input:checkbox:checked');
      var brandString = "";
      if (brands.length > 0) {
        brandString += "brandStr=";
        brands.each(function() {
          brandString = brandString + $(this).attr("value") + "${brandSeperator}";
        });
      }
      return brandString;
    }

    function toggleSelForFilter(filterDiv, selectAll) {
      var filterValues = $(filterDiv).find("div.filter-value-div").find('input:checkbox');
      if (filterValues.length > 0) {
        filterValues.each(function() {
          if (selectAll) {
            $(this).attr("checked", "checked");
          } else {
            $(this).removeAttr("checked");
          }
        });
      }
    }

    function _checkAlreadySelectedItems(allItems, selectedValues) {
      _.each(selectedValues, function(item) {
        var filterApplied = '[value=' + item + ']';
        allItems.filter(filterApplied).attr("checked", "checked");
      });
    }

    $(document).ready(function() {
      var accordionElem = $("#accordion");
      var expandAllBtn = $('button.open-acc');
      var collapseAllBtn = $('button.close-acc');
      var openParent = $('.active').parent("ul");
      $(".navChildChild").slideUp();
      openParent.slideDown();
      function initMenu() {
        $(".navChild").show();
        $(".current_page_item .navChild").show();


        $('#menu li a').click(
            function() {

              var checkElement = $(this).next();
              if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                $('#menu ul:visible').not(checkElement.parent().parent()).slideUp('normal');
                checkElement.slideUp('normal');
                return false;
              }
              if ((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                $('#menu ul:visible').not(checkElement.parent().parent()).slideUp('normal');
                checkElement.slideDown('normal');
                return false;
              }
            });
      }

      $(function() {
        initMenu();
      });

      $(function() {
        $("td").tooltip({
          'selector': '',
          'placement': 'bottom'
        });

        //check already selected brands
        var brandDiv = $('div#brandsHeadContent');
        var selectedBrands = $('input:hidden#selected-brands').val().split(",");
        _checkAlreadySelectedItems(brandDiv.find('input:checkbox'), selectedBrands);


        //check alredy selected filter values
        $('div.filter-div').each(function() {
          var selectedFilterValues = $(this).find('input:hidden.selected-filter-values').val().split(",");
          _checkAlreadySelectedItems($(this).find("div.filter-value-div").find('input:checkbox'), selectedFilterValues);
        });

        HK.Accordion().accordion(
            accordionElem,
            true,
            true
            );

        expandAllBtn.click(function () {
          HK.Accordion().accordionExpandAll(accordionElem);
        });
        collapseAllBtn.click(function () {
          HK.Accordion().accordionCollapseAll(accordionElem);
        });

        $(".resetFilter").click(function() {
          var filterDiv = $(this).parents('div.filter-div');
          toggleSelForFilter(filterDiv, false);

          var filterString = buildFilterAndFetch();
          var hrefAttr = $(this).attr("href");
          if (hrefAttr.indexOf("?") == -1) {
            hrefAttr = hrefAttr + "?" + filterString;
          } else {
            hrefAttr = hrefAttr + "&" + filterString;
          }

          $(this).attr("href", hrefAttr);
          return true;
        });

        $('.filter-link').click(function() {
          var filterString = buildFilterAndFetch();
          var brandString = buildBrandAndFetch(brandDiv);

          var hrefAttr = $(this).attr("href");
          if (hrefAttr.indexOf("?") == -1) {
            hrefAttr = hrefAttr + "?" + filterString;
          } else {
            hrefAttr = hrefAttr + "&" + filterString;
          }

          if (brandString.length > 0) {
            hrefAttr = hrefAttr + "&" + brandString;
          }

          $(this).attr("href", hrefAttr);
          window.location.href = hrefAttr;
          return true;
        });

        $('.sel-brand').click(function() {
          var brandString = buildBrandAndFetch(brandDiv);

          if (brandString.length > 0) {
            var hrefAttr = $(this).attr("href");
            if (hrefAttr.indexOf("?") == -1) {
              hrefAttr = hrefAttr + "?" + brandString;
            } else {
              hrefAttr = hrefAttr + "&" + brandString;
            }

            $(this).attr("href", hrefAttr);
            window.location.href = hrefAttr;
          }
          return true;
        });
      });
    });
  </script>
</s:layout-component>
</s:layout-render>