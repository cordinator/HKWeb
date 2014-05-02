<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>

  <script id="brandFilterRowTemplate" type="text/x-handlebars-template">

    {{#if selected}}
    <input type="checkbox" checked="checked" value={{id}} class="brandChk"/>
    <span class="fnt-sz10">{{nm}}</span>
    <span class="cont-rht">{{nv}}</span>
    {{else}}
    <input type="checkbox" value={{id}} class="brandChk"/>
    <span class="fnt-sz10">{{nm}}</span>
    <span class="cont-rht">{{nv}}</span>
    {{/if}}
  </script>
</s:layout-definition>