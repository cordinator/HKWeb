<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>

  <script id="variantResultItemViewTemplate" type="text/x-handlebars-template">

    <div class="varnt-cont">

        {{#if freebieName}}
        <span class="offer-txt">OFFER</span>
        {{/if}}
      {{#if oos}}
      {{else}}
        {{#renderTagImg allTags "b1g1"}}
        {{/renderTagImg}}
      {{/if}}
      <div class="{{#if oos}} {{else}}{{#renderTagClass allTags 'b1g1'}} {{/renderTagClass}} {{#if freebieName}}tag-cntnr-35{{/if}} {{/if}}">
        <a class="img-box img-box-180 {{#if oos}} img-inactive{{/if}}"
           href="{{url}}">
            <%--<img alt="{{nm}}" class="lazy" data-original="{{img_url}}" src="<hk:vhostImage/>/assets/images/pixel.png"/>--%>
          <img alt="{{nm}}" data-original="" src="{{img_url}}"/>

        </a>
        {{#if oos}}
        <a class="oos-cntnr sz180" href="{{url}}">
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
          {{#if freebieName}}
          <div class="fnt-sz10" style="color:#333;text-decoration:underline">{{freebieName}} FREE</div>
          {{/if}}
          <div class="">
            {{#if discounted}}
            <span class="strikethrough">Rs. {{mrp}}</span> | <span class="fnt-sz10">{{discount}}% off</span>
            {{/if}}
          </div>

          <div class="final-price">
            Rs. {{offerPrice}}
          </div>

        </div>
        <div class="varnt-cmpare mrgn-bt-5">
          <a href="javascript:void(0)" varId="{{id}}" catPre={{catPre}} name="addToCompare" class="addToCompare">Add to
            Compare &raquo;</a>
        </div>
      </div>
      </div>
  </script>
</s:layout-definition>