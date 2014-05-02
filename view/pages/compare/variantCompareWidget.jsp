<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-definition>

  <div class="span16 alpha omega cmpr-cont clearfix" id="variantCompareGrid" style="display:none;">

    <span class="icn icn-close2" title="Close"></span>
    <div id="variantCompareView" class="cmpr-item-cont">

    </div>
  </div>


  <script id="variantCompareViewTemplate" type="text/x-handlebars-template">
    <div class="cmpr-btn-cntnr">
      <a class="btn btn-blue cmpr-btn" id="compButton1" href="${pageContext.request.contextPath}/beta/variant/StoreVariantCompare.action?variantIds={{#renderVariantIdsCommaSep variants}}{{/renderVariantIdsCommaSep}}"  target="_blank">Compare</a>
      <p class="clear-cnt" title="Remove All">
        Clear All
        <span class="icn icn-close1" >Clear All</span>
      </p>
    </div>

    {{#each variants}}
    <div class="cmpr-item">

      <div class="img-cont img-box img-box-70">
        <a href="{{storeVariantBasic.url}}"><img src="{{storeVariantBasic.primaryImage.xtlink}}" alt={{storeVariantBasic.primaryImage.altText}} /></a>
      </div>
      <p class="varnt-title">
          <a href="{{storeVariantBasic.url}}">{{storeVariantBasic.name}}</a>
      </p>
      <p class="clear-cnt" varId="{{storeVariantBasic.id}}" catPre={{storeVariantBasic.catPre}} title="Remove">
        Clear
      <span class="icn icn-close1" >Clear</span>
      </p>
    </div>
    {{/each}}


  </script>

  <script id="variantCompareEmptyViewTemplate" type="text/x-handlebars-template">
    <div class="cmpr-item">
      <div class="icn-add-img mrgn-cntr"></div>
      <p class="add-prdct">
        Add another product to compare
      </p>
    </div>
  </script>


</s:layout-definition>