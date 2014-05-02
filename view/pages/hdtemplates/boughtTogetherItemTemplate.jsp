<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>

  <script id="boughtTogetherItemTemplate" type="text/x-handlebars-template">

    <li class="varnt-cont">
      <a class="img-box img-box-180 {{#if oos}} img-inactive{{/if}}"
         href="{{url}}">
          <%--<img alt="{{pr_img.altText}}" class="lazy" data-original="{{pr_img.mlink}}" src="<hk:vhostImage/>/assets/images/pixel.png"/>--%>
        <img alt="{{pr_img.altText}}" src="{{pr_img.slink}}"/>
      </a>
      {{#if oos}}
      <a class="oos-cntnr sz180 " href="{{url}}">
        Out of Stock
      </a>
      {{/if}}
      <div class="mrgn-t-10">
        <a href="{{url}}">
          <span class="varnt-title">{{nm}}</span>
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
        {{#if nv}}
        <div class="varnt-availble">({{nv}} more variants available)</div>
        {{/if}}
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