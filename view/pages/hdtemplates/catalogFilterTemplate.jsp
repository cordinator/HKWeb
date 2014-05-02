<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <script id="catalogFilterTemplate" type="text/x-handlebars-template">

    <div class="hdr2" iname={{iNm}}>
      <span class="collapsible-hdr">
        <span class="icn icn-collapse"></span>
      </span>
      {{nm}}

    </div>
    <div class="collapsible-cntnt">

      <ul class="fltr-items scroll">
        {{#each flValues}}
        <li>
          {{#if selected}}
          <input checked="checked" class="filterChk" value={{flVal}} flInm={{flInm}} type="checkbox"/>
          <span class="fnt-sz10">{{val}}</span>
          <span class="cont-rht">{{nv}}</span>
          {{else}}
          <input class="filterChk" value={{flVal}} flInm={{flInm}} type="checkbox"/>
          <span class="fnt-sz10">{{val}}</span>
          <span class="cont-rht">{{nv}}</span>
          {{/if}}
        </li>
        {{/each}}
      </ul>
    </div>


  </script>
</s:layout-definition>