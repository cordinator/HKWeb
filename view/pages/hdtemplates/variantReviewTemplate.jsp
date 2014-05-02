<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 2/7/14
  Time: 10:31 AM
--%>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>

  <script id="variantReviewTemplate" type="text/x-handlebars-template">
    <div class="rvw-prnt-cnt">
      <div class="vrnt-rvw-cnt" data-review-for="{{sv_id}}">
        <div class="cont-lft ratng-desc left-arrw">

          <div class="big-star-rtng mrgn-l-20">{{avgRatingRounded}}</div>
          <p class="fnt-sz10 txt-cntr">Average Rating</p>

          <p class="fnt-sz9 fnt-bold">(Based on {{ttl_rtng}} ratings)</p>

          {{#if total_reviews_count}}
          <a href="/beta/review/StoreVariantReview.action?storeVariantId={{varId}}" class="view-rvw-link"> View all
            {{total_reviews_count}} Reviews </a>
          {{/if}}

        </div>

        <ul class="cont-rht rtng-bars-cnt">
          {{#each rating}}
          <li class="hk-font-small tmargin3">

            <p class="txt-lft disp-inln"><span class="review-link-underline"> <strong>{{this.ratingKey}}
              star</strong></span></p>

            <div class="rating-bars">
              <div class="progress" style="width:{{this.ratingPercent}}%"></div>
            </div>
            <p class="txt-rgt disp-inln rtng-count">{{this.ratingCount}}</p>
          </li>
          {{/each}}
        </ul>
      </div>
    </div>
  </script>
</s:layout-definition>