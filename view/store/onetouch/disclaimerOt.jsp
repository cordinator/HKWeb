<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp">
  <%
    boolean isSecure = WebContext.isSecure();
    pageContext.setAttribute("isSecure", isSecure);

    PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
    if (principal != null) {
      pageContext.setAttribute("user_hash", principal.getUserHash());
      pageContext.setAttribute("gender", principal.getGender());
      pageContext.setAttribute("orderCount", principal.getOrderCount());
    } else {
      pageContext.setAttribute("user_hash", "guest");
      pageContext.setAttribute("gender", null);
      pageContext.setAttribute("orderCount", null);
    }
  %>


  <s:layout-component name="msHeader">
    <s:layout-render name="/store/onetouch/onetouchHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

  </s:layout-component>
    <!---- banner close --->



  <s:layout-component name="msContent">
    <div class="wrapper">

      <div class="cat-strip">
        <h2 class="otH2">DISCLAIMER</h2>
        <div class="cl"></div>
        <p class="otDisclmr">The entire content of this internet site, hereafter referred to as a &quot;store&quot; is owned or controlled by Johnson & Johnson Limited India and is protected by worldwide copyright laws. You may download content only for your personal use or for non-commercial purposes but no modification or further reproduction of the content is permitted. The content may otherwise not be copied or used in any way. HealthKart.com, henceforth referred to as &quot;Online Channel Partner&quot;, is not liable for any content on the website. Johnson & Johnson holds full responsibility and liability for the content, not limited to images, product images, text, videos or any source of digital information.
        </p>
        <p class="otDisclmr"> The owners of this store will make reasonable efforts to include up-to-date and accurate information on this internet site, but make no representations, warranties, or assurances as to the accuracy, currency, or completeness of the information provided. The owners of this store shall not be liable for any damages or injury caused from your access to, or inability to access this internet site, or from your reliance on any information provided on this site. This store is intended for people in India only.
        </p>
        <p class="otDisclmr"> This store may provide links or references to other sites but the owners of this store have no responsibility for the content of such other sites and shall not be liable for any damages or injury arising from that content. Any links to other sites are provided as merely a convenience to the users of the store.
        </p>
        <p class="otDisclmr"> The sender of any communications to this store or otherwise to the owners of this store shall be responsible for the content and information contained therein, including its truthfulness and accuracy.
      </p>
        <p class="otDisclmr"> The owners of this site shall be free to use or copy all other information in any such communications, including any ideas, inventions, concepts, techniques or know-how disclosed therein, for any purposes. Such purposes may include disclosure to third parties and/or developing, manufacturing and/or marketing goods or services. Johnson & Johnson also extends a non sub-leasable license to use its trademarks, logos, service marks, trade name, trade dress & products to Online Channel Partner on a non-transferable basis.
      </p>
        <p class="otDisclmr">  The trademarks, service marks, trade names, trade dress and products in this store are protected in India and internationally. No use of any of these may be made without the prior written authorization of the owners of this store, except to identify the products or services of the company. The store does not imply a partnership, joint venture, or any joint legal entity. Johnson & Johnson and HealthKart.com are independent parties.
      </p>

        <p class="otDisclmr"> All product pricing is in accordance with that of the products on Online Channel Partner. Any order received in the store will be processed in accordance with the guidelines as mentioned <a href="http://www.healthkart.com/beta/hk/TermsConditions.action">herein</a>. All deliveries for the successful orders will be handled in accordance with the <a href="http://www.healthkart.com/beta/hk/FAQ.action%3Freftag=delivery">Delivery Policy</a>. Johnson & Johnson shall not be held responsible for issue or concern covered in the policies mentioned above, T&C & Delivery Policy and also for policies pertaining to <a href="http://www.healthkart.com/beta/hk/FAQ.action%3Freftag=return"> Returns</a>.
        </p>



      </div>







    </div>
    <!---- wrapper close --->
  </s:layout-component>

  <s:layout-component name="msFooter">
    <s:layout-render name="/store/onetouch/onetouchFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>