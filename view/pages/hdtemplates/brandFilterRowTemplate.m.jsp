<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <script id="brandFilterRowTemplate" type="text/x-handlebars-template">

    {{#if selected}}
<a class="sel-brand list_item1 bd_btm" href="#">
    <input type="checkbox" checked="checked" value={{id}} class="brandChk" class="left"/>
    <span class="left">{{nm}}</span>
    <span class="right">{{nv}}</span>
	<div class="clear"></div>
</a>
    {{else}}
<a class="sel-brand list_item1 bd_btm" href="#">
    <input type="checkbox" value={{id}} class="left"/>
    <span class="left">{{nm}}</span>
    <span class="right">{{nv}}</span>
	<div class="clear"></div>
</a>
    {{/if}}
  </script>
</s:layout-definition>