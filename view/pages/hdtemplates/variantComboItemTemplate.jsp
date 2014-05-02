<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 9/26/13
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <script id="variantComboItemTemplate" type="text/x-handlebars-template">

    <li class="varnt-cont">

      <a class="img-box img-box-180" title="{{nm}}"
         href="{{url}}">
        <%--<img  class="lazy" data-original="{{m_link}}" alt="{{nm}}" src="<hk:vhostImage/>/assets/images/pixel.png"/>--%>
            <img data-original="" alt="{{nm}}" src="{{m_link}}"/>
      </a>
      <div class="mrgn-t-10">
        <a href="{{url}}">
          <span class="varnt-title">{{nm}}</span>
        </a>
      </div>

      <div class="varnt-detail">
        <div class="">
          {{#if discount}}
          <span class="strikethrough">Rs. {{mrp}}</span> | <span class="fnt-sz10">{{discount}}% off</span>
          {{/if}}
        </div>
        <div class="final-price">
          Rs. {{offer_pr}}
        </div>

      </div>

    </li>
  </script>
</s:layout-definition>