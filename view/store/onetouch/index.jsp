<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp" title="OneTouch">
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
    <div class="ot-banner" ></div>
    <div class="cl"></div>
  </s:layout-component>
    <!---- banner close --->



  <s:layout-component name="msContent">
    <div class="wrapper">
      <div class="learn">
        <h1 class="learnH">LEARN MORE <strong>ABOUT DIABETES</strong> & THE IMPORTANCE OF TESTING </h1>
        <a href="${pageContext.request.contextPath}/store/onetouch/aboutOt.jsp"><img class="flot-r" src="<hk:vhostImage/>/assets/images/ms/1t/learn-more.png"></a>
      </div>


      <div class="cat-strip">
        <h2 class="otH2">Blood Glucose Meters</h2>
          <div class="deco-line"></div>
      </div>

      <s:layout-render name="/store/onetouch/msOtCatalogLayout.jsp" vid="6705,6698,48334" showAddToCart="true"/>

      <div class="cl"></div>

      <div class="cat-strip">
        <h2 class="otH2">Test Strips</h2>
        <div class="deco-line"></div>
      </div>

      <s:layout-render name="/store/onetouch/msOtCatalogLayout.jsp" vid="6832,6833,6858,6859,6829,6830,6831" showAddToCart="true"/>

      <div class="cl"></div>

      <div class="cat-strip">
        <h2 class="otH2">LANCETS</h2>
        <div class="deco-line"></div>
      </div>

      <s:layout-render name="/store/onetouch/msOtCatalogLayout.jsp" vid="6675,6676" showAddToCart="true"/>


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