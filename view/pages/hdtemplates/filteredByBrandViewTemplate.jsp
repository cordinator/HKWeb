<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <script id="filteredByBrandViewTemplate" type="text/x-handlebars-template">
    {{#if selected}}
    <span class="filter-box"> {{nm}} <span class="brandFilterSpan" value={{id}}><span
        class="icn icn-close1 remove-varnt"></span></span></span>
    {{/if}}
  </script>
</s:layout-definition>