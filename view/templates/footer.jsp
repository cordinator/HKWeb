<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
     <%
        StringBuilder reqUrl = new StringBuilder(request.getContextPath());
        reqUrl.append("?");
        String queryString = request.getQueryString();
        if (queryString != null) {
            reqUrl.append(queryString);
            reqUrl.append("&");
        }
        reqUrl.append("view=mobile");
        pageContext.setAttribute("pageURL", reqUrl);
    %>
  <s:useActionBean beanclass="com.hk.web.action.beta.menu.StoreMenuAction" var="menuAction" event="pre"/>
  <div class="container clearfix">
    <div class="ftr-main-txt">
      <span class="fnt-bold"> authentic products</span>
      <span class="mrgn-lr-10">|</span>
      <span class="fnt-bold"> free delivery on orders over rs. 499</span>
      <span class="mrgn-lr-10">|</span>
      <span class="fnt-bold">secure payment system</span>
    </div>

    <div class="ftr-link-cntnr clearfix">
      <div class="span3 alpha">
        <h4>Healthkart</h4>
        <ul>
          <li><s:link beanclass="com.hk.web.action.beta.hk.AboutUsAction">About Us</s:link></li>
          <li><s:link beanclass="com.hk.web.action.beta.hk.CareersAction">Careers</s:link></li>
          <li><s:link beanclass="com.hk.web.action.beta.hk.TermsConditionsAction">Terms & Conditions</s:link></li>
          <li><a href="http://www.healthkart.com/resources">Blog</a></li>
          <li><s:link beanclass="com.hk.web.action.beta.brand.BrandListingAction">Brand Directory</s:link> </li>
          <li><a href="${pageContext.request.contextPath}/core/loyaltypg/LoyaltyIntroduction.action" rel="nofollow">Loyalty</a></li>
          <li><a href="${pageURL}">View Mobile Site</a></li>
        </ul>
      </div>
      <div class="span3 alpha">
        <h4>Can We Help You</h4>
        <ul>
          <li><a href="${pageContext.request.contextPath}/core/user/MyAccount.action">Your Account</a></li>
          <li><s:link beanclass="com.hk.web.action.beta.hk.FAQAction"><s:param name="reftag" value="delivery"/>Delivery Policies</s:link></li>
          <li><s:link beanclass="com.hk.web.action.beta.hk.FAQAction"><s:param name="reftag" value="return"/>Returns Policy</s:link></li>
          <li><s:link beanclass="com.hk.web.action.beta.hk.FAQAction">FAQs and Help</s:link></li>
          <li><s:link beanclass="com.hk.web.action.beta.hk.ContactUsAction">Contact Us</s:link></li>
        </ul>
      </div>
      <c:set var="menuBreakPoint" value="${fn:length(menuAction.menuNodes)/2}"/>
      <div class="span3 alpha">
        <h4>Categories</h4>
        <ul>
          <c:forEach items="${menuAction.menuNodes}" var="menuNode" end="${menuBreakPoint}">
            <li><a href="${menuNode.url}">${menuNode.name}</a></li>
          </c:forEach>
        </ul>
      </div>
      <div class="span3 alpha">
        <h4>More categories</h4>
        <ul>
            <c:forEach items="${menuAction.menuNodes}" var="menuNode" begin="${menuBreakPoint+1}">
                <li><a href="${menuNode.url}">${menuNode.name}</a></li>
            </c:forEach>
        </ul>
      </div>
      <%--<div class="span3 alpha">
        <h4>Brands</h4>
        <ul>
          <li><a href="">MuscleBlaze</a></li>
          <li><a href="">HealthViva</a></li>
          <li><a href="">Optimum Nutrition</a></li>
          <li><a href="">Dymatize</a></li>
          <li><a href="">Gaspari</a></li>
          <li><a href="">Accu-Chek</a></li>
          <li><a href="">L'Oreal Paris</a></li>
          <li><a href="">Muscletech</a></li>
        </ul>
      </div>--%>
      <div class="subscibe-mail-cntnr">
        <p class="label-txt">Sign Up for emails and latest offers</p>

        <div class="span4">
          <input type="text" name="subscriptionEmail" id="subscriptionEmail" placeholder="Email address" value=""/>
        </div>
        <div class="mrgn-l-30 clr-cont">
        <input type="submit" id="submitSubscription"  name="submitSubscription" value="submit"
               class="btn btn-gray fnt-sz10"/>
          </div>
      </div>
    </div>
    <div class="clearfix about-hk">
      HealthKart.com is India's largest online health & fitness store for men, women, and kids. Shop online from the
      latest collections of health, fitness, beauty, sports, eye care, parenting and similar products featuring the best
      brands.
    </div>
    <div class="clearfix fnt-sz9">
      <div class="cont-lft mrgn-t-10">
        <span class="txt-top">Pay using: </span>
        <span class="icn icn-pmt-methods"></span>
        <span class="txt-top">| Net Banking | Cash on Delivery</span>
      </div>
      <div class="cont-rht">
        <span class="txt-middle fnt-caps">CopyRight &copy; 2013-2014, HealthKart.com, or its affiliates </span>
        <span class="txt-middle mrgn-r-5"> | Connect with us:</span>

        <div class="disp-inln txt-middle mrgn-t-10">
          <a class="icn icn-fb" target="_blank" href="https://www.facebook.com/healthkart" rel="nofollow"></a>
          <a class="icn icn-twitter" target="_blank" href="https://twitter.com/healthkart" rel="nofollow"></a>
          <a class="icn icn-google-plus" target="_blank" href="https://plus.google.com/+healthkart/posts" rel="nofollow"></a>
        </div>
      </div>
    </div>

  </div>
  <div class="go-to-top-cntnr">
    <a href="javascript:void(0)" title="Back to Top" class="go-to-top cont-rht hide"></a>
  </div>
 </s:layout-definition>