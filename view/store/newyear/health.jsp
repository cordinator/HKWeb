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
    <s:layout-render name="/store/newyear/newyearHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

        <div class="nyBanner">
          <div class="wrapper">
            <img src="<hk:vhostImage/>/store/newyear/images/healthDevices.jpg">
          </div>
        </div>
        <!--- banner close --->

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
    <s:layout-render name="/store/newyear/nyCatalogLayout.jsp" vid="389,417,418,423,6484,6591,36527,7017,7018,7021,37117,9845,9847,9856,9860,9867,46457,46638,46639,46642,9919,10050,10273,10274,10321,10325,10394,10426,47063,37431,44999,45000,47777,10681,37533,37551,12198,12587,16685,16686,16688,38344,18493,18500,18752,43247,25672,43461,43466,43473,36311,36312,6619,36517,6672,6674,6675,6676,6679,6698,6699,6705,6710,6711,6716,6733,6821,6822,6823,6824,6825,6826,6827,6828,6829,6830,6831,6832,6833,6841,6842,6843,6846,6847,6852,6858,6859,6869,6881,6883,6890,44703,9255,9264,9272,37092,37204,10427,10684,12775,12777,12790,12804,12805,12806,45407,45410,12887,12888,12889,12892,12893,13393,13394,13423,14886,15446,16689,16691,40423,40425,24632,24633,24635,24639,24641,24642,24645,24650,24651,24656,24657,24658,24659,24660,48334,40489,40491,40493,40498,40552,7068,7070,7072,7081,7098,7102,7116,32798,7122,33070,33209,36704,36811,36879,36880,36882,8212,8257" showAddToCart="true"/>
   </div>
  </s:layout-component>

  <s:layout-component name="msFooter">
    <s:layout-render name="/store/newyear/newyearFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>