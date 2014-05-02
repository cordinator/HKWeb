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
    <s:layout-render name="/store/gosf/gosfHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
    <div class="wrapper gosfCombo">
      <span class="gosfH1">Beauty Combo</span>

      <a href="http://www.healthkart.com/combo/ayu-care-lavana-tailam-double-delight-pack/CMB-ALT01"><img src="<hk:vhostImage/>/assets/images/gosf/ayucareC.jpg" /></a>
      <a href="http://www.healthkart.com/combo/keep-your-eyes-on-the-stars/CMBEYCNC"><img src="<hk:vhostImage/>/assets/images/gosf/LakmekajalMascaraC.jpg" /></a>
      <a href="http://www.healthkart.com/combo/kaya-special-value-pack/CMB-KAY01"><img src="<hk:vhostImage/>/assets/images/gosf/kayaTonerC.jpg" /></a>
      <a href="http://www.healthkart.com/combo/lakme-eyeconic-double-delight-pack/CMB-LAKEY01"><img src="<hk:vhostImage/>/assets/images/gosf/lakmeKajalC.jpg" /></a>
      <a href="http://www.healthkart.com/combo/mny-colossal-double-delight-pack/CMB-MYB1"><img src="<hk:vhostImage/>/assets/images/gosf/maybellineColossalC.jpg" /></a>
      <a href="http://www.healthkart.com/combo/cheer-for-beer-double-delight-pack/CMB-PARKAV"><img src="<hk:vhostImage/>/assets/images/gosf/ParkavenueC.jpg" /></a>
      <a href="http://www.healthkart.com/combo/vlcc-slimming-special-value-pack/CMB-VLC01"><img src="<hk:vhostImage/>/assets/images/gosf/VLCCslimmingC.jpg" /></a>




    </div>
    <div class="cl"></div>
  </s:layout-component>

  <s:layout-component name="msFooter">

    <s:layout-render name="/store/gosf/gosfFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>