<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <script id="filteredByAttrViewTemplate" type="text/x-handlebars-template">
    {{#if filtered}}
    <span class="filter-label">{{nm}}</span>
    {{#each flValues}}
    {{#if selected}}
    <span class="filter-box"> {{val}} <span class="filterByAttrSpan" value={{flVal}} flInm={{flInm}}><span
        class="icn icn-close1 remove-varnt"></span></span></span>
    {{/if}}
    {{/each}}
    {{/if}}
  </script>
</s:layout-definition>