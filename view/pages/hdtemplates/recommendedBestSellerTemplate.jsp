<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 12/27/13
  Time: 6:28 PM
  To change this template use File | Settings | File Templates.
--%>


<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>

  <script id="recommendedBestSellerTemplate" type="text/x-handlebars-template">

    <li class="carousel-varnt-cont">
      <a class="img-box img-box-150"
         href="{{itemURL}}">
        <img alt="{{itemTitle}}" src="{{itemImage}}"/>
      </a>

      <div class="mrgn-t-10">
        <a href="{{itemURL}}" title="{{itemTitle}}">
          <span class="varnt-title varnt-max-txt">{{itemTitle}}</span>
        </a>
        {{#if ratingPercent}}
        <div>Rating:
          <div class="rtng-star-s">
            <div class="rtng-usr" style="width:{{ratingPercent}}%"></div>
          </div>
        </div>
        {{/if}}
      </div>

      <div class="varnt-detail">
        {{#if discountPercent}}
        <div class="">
          <span class="strikethrough">Rs. {{itemMRP}}</span> |  <span class="fnt-sz10">{{discountPercent}}% off</span>
        </div>
        {{/if}}
        <div class="final-price">
          Rs. {{itemPrice}}
        </div>

      </div>
    </li>
  </script>
</s:layout-definition>

