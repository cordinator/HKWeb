<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>

  <script id="variantResultItemViewTemplate" type="text/x-handlebars-template">

 	<a class="pd_hldr left" href="{{url}}">

	<div class="pd_image left" style="background:url('{{img_url}}')no-repeat center center;background-size:contain;"></div>
	<div class="pd_info left">
 		<div class="pd_name font12">{{nm}}</div>
	{{#if nv}}
        <div class="varnt-availble">({{nv}} more variants available)</div>
    {{/if}}
	 {{#if ratingPercent}}
        <div>Rating:
          <div class="rtng-star-s">
            <div class="rtng-usr" style="width:{{ratingPercent}}%"></div>
          </div>
        </div>
        {{/if}}
		{{#if freebieName}}
          <div class="fnt-sz10" style="color:#333;text-decoration:underline">{{freebieName}} FREE</div>
        {{/if}}
        <div class="">
          {{#if discounted}}
          <div class="pd_old_price font12">Rs. {{mrp}}</div><div class="pd_discount font12">{{discount}}% off</div>
          {{/if}}
        </div>
		<div class=" font15"> Rs.{{offerPrice}}</div>
								
	</div>
		
	</a><!--pd_hldr ends --->

	
	{{#if oos}}
	<a class="pd_hldr left out_of_stock" href="{{url}}">

	<div class="pd_image left" style="background:url('{{img_url}}')no-repeat center center;background-size:contain;"><div class="out_mask"></div></div>
	<div class="pd_info left">
 		<div class="pd_name font12">{{nm}}</div>
	{{#if nv}}
        <div class="varnt-availble">({{nv}} more variants available)</div>
    {{/if}}
	 {{#if ratingPercent}}
        <div>Rating:
          <div class="rtng-star-s">
            <div class="rtng-usr" style="width:{{ratingPercent}}%"></div>
          </div>
        </div>
        {{/if}}
		{{#if freebieName}}
          <div class="fnt-sz10" style="color:#333;text-decoration:underline">{{freebieName}} FREE</div>
        {{/if}}
        <div class="">
          {{#if discounted}}
          <div class="pd_old_price font12">Rs. {{mrp}}</div><div class="pd_discount font12">{{discount}}% off</div>
          {{/if}}
        </div>
		<div class=" font15"> Rs.{{offerPrice}}</div>
								
	</div>
		
	</a><!--pd_hldr ends --->
	{{/if}}

  </script>
</s:layout-definition>
