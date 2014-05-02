<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp" title="Health Devices Clearance Sale online in India | HealthKart.com">
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
  <s:layout-component name="htmlHead">
    <meta name="description" content="Clearance Sale of Health Devices online in India at HealthKart.com. Free home delivery across India on orders above Rs. 500." />
    <meta name="keywords" content="Health Devices Clearance sale, Health Devices branded products, Health Devices in India, Health Devices Products Online Sale" />
  </s:layout-component>

  <s:layout-component name="msHeader">
    <s:layout-render name="/store/clearance/clearanceHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
     <h1 class="headingH1">Health Devices</h1>
    <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="10049,3938,37126,264,36516,9865,40451,47078,7017,41000,12481,10242,10403,9630,37531,10199,9689,9686,9658,12573,9669,9685,12579,9690,9672,9668,9693,9666,9670,9682,9657,12578,9665,24555,9660,9943,40465,40464,40463,40461,40460,40458,40457,40456,12577,12570,10217,9331,37130,37435,40454,36533,9851,10247,10218,10153,37122,12574,44938,37125,37124,25677,18567,38368,11416,18055,11386,9673,9692,9664,9678,9662,9674,9628,9650,12583,9651,9649,37769,10213,31,37767,9726,12545,40459,9681,9656,9680,37434,36335,11388,10221,10148,25690,37770,25675,10145,10244,9722,9715,12575,12572,18502,9633,9688" showAddToCart="true"/>
   </div>
  </s:layout-component>

  <s:layout-component name="msFooter">
    <s:layout-render name="/store/clearance/clearanceFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>