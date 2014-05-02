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
 <a class="pd_hldr" {{#if oos}} img-inactive{{/if}} href="{{url}}"> 
    <div class="pd_image left " style="background: url('{{pr_img.slink}}')no-repeat left center;background-size: contain;"><div class="out_mask"></div></div>
    <div class="pd_info left">
      <div class="pd_name font12">
        {{nm}}
      </div>
      <div class="pd_summ">
  		{{#if ratingPercent}}
        <div class="">
          <div class="rtng-star-s">
            <div class="rtng-usr" style="width:{{ratingPercent}}%"></div>
          </div>
        </div>
	       {{/if}}
        {{#if nv}}
        <div class="varnt-availble">
          ({{nv}} more variants available)
        </div>
        {{/if}}
        {{#if discount}}
        <div class="pd_old_price font12">
          Rs. {{mrp}}
        </div>
        <div class="pd_discount font12">
          {{discount}}% off
        </div>
        {{/if}}
        <div class="font15">
          Rs. {{offer_pr}}
        </div>

      </div>
    </div>
    </a>


  </script>
</s:layout-definition>