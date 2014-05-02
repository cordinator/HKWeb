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
      <span class="gosfH1">Diabetes and Devices Combo</span>

      <a href="http://www.healthkart.com/combo/extend-wholesome-combo/CMB-DIA26"><img src="<hk:vhostImage/>/assets/images/gosf/ExtendwholesomeC.jpg" /></a>
      <a href="http://www.healthkart.com/combo/happy-diabetes-bp-monitoring-combo/CMB-DIA40"><img src="<hk:vhostImage/>/assets/images/gosf/BPmonitorC.jpg" /></a>
      <a href="http://www.healthkart.com/combo/ot-glucose-monitoring-combo/CMB-DIA35"><img src="<hk:vhostImage/>/assets/images/gosf/OTteststripsOTlancetsC.jpg" /></a>
      <a href="http://www.healthkart.com/combo/exclusive-bp-glucose-monitoring-combo/CMB-DIA55"><img src="<hk:vhostImage/>/assets/images/gosf/ExclusiveomronAccu-chekC.jpg" /></a>
      <a href="http://www.healthkart.com/combo/onetouch-strips-lancets-combo/CMB-DIA32"><img src="<hk:vhostImage/>/assets/images/gosf/OnetouchstripsLancetsC.jpg" /></a>
      <a href="http://www.healthkart.com/combo/onetouch-selectsimple-strips-combo/CMB-DIA38"><img src="<hk:vhostImage/>/assets/images/gosf/OnetouchselectstripsC.jpg" /></a>
      <a href="http://www.healthkart.com/combo/onetouch-ultra-strips-combo/CMB-DIA37"><img src="<hk:vhostImage/>/assets/images/gosf/OnetouchstripsC.jpg" /></a>



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