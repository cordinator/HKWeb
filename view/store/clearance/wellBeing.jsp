<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp"  title="Well Being Vitamins & Capsules Clearance Sale online in India">
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
    <meta name="description" content="Clearance Sale of Well Being Vitamins & Capsules online in India at HealthKart.com. Free home delivery across India on orders above Rs. 500." />
    <meta name="keywords" content="Well Being Vitamins & Capsules Clearance sale, Well Being Vitamins & Capsules branded products, Well Being Vitamins & Capsules in India, Well Being Vitamins & Capsules Products Online Sale" />
  </s:layout-component>

  <s:layout-component name="msHeader">
    <s:layout-render name="/store/clearance/clearanceHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
   <div class="wrapper">
     <h1 class="headingH1">WELL BEING</h1>
    <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="45018,13085,45038,13669,37919,37856,37852,37911,13810,13818,13815,37931,45256,13811,13812,13820,13791,45036,37934,37914,13807,13808,45044,15497,37851,13789,37850,45008,45100,13809,45165,45172,45173,37921,37910,37922,37912,37917,37853,37854,37916,46490,15860,37913,46493,46621,46622,46598,46601,46590,46607,46610,46589,46633,46634,46631,46632,13813,46568,46570,13787,13803,46586,46629,46615,46591,46612,46604,46605,46617,13084,46630,44992,46635,46580,13088,13089,44991,44997,46587,37335,37924,37847,37846,37882,45311,13798,13797,45047,45048,14433,12945,45268,13915,45177,12903,12866,45160,45159,12950,15784,46468,12877,15787,12835,13995,13917,46471,12785,45192,15193,44975,44985,12788" showAddToCart="true"/>
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