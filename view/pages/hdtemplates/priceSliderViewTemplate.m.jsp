<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>


  <script id="priceSliderViewTemplate" type="text/x-handlebars-template">
    <b class="cont-lft">Rs. {{minPrice}}</b> <b class="cont-rht">Rs. {{maxPrice}}</b>
    <input type="text" class="span2" value="" data-slider-min="{{minPrice}}" data-slider-max="{{maxPrice}}"
           data-slider-step="{{stepSize}}"
           data-slider-value="[{{minPrice}},{{maxPrice}}]" id="sl2" style="">
  </script>
</s:layout-definition>