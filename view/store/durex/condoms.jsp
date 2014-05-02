<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>



<s:layout-render name="/store/msGeneral.jsp" title="Durex India">
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
    <s:layout-render name="/store/durex/durexHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">



  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
    <div class="wrapper">

      <div class="cl"></div>

      <div class="dContent">

        <a href="${pageContext.request.contextPath}/mcsv/durex/durex-flavours-condoms/SP-11302?navKey=VRNT-17795" target="_blank">
          <div class="animated" style="background:url(<hk:vhostImage/>/store/durex/images/flavours.jpg) 0 0 no-repeat">
            <img class="btn-fom" src="<hk:vhostImage/>/store/durex/images/btn-fom.png">
          </div></a>


        <a href="${pageContext.request.contextPath}/mcsv/durex/durex-superthin-condoms/SP-11307?navKey=VRNT-17807" target="_blank">
          <div class="animated" style="background:url(<hk:vhostImage/>/store/durex/images/Superthin.jpg) 0 0 no-repeat">
            <img class="btn-fom" src="<hk:vhostImage/>/store/durex/images/btn-fom.png">
          </div></a>


        <a href="${pageContext.request.contextPath}/mcsv/durex/durex-performa-condoms/SP-11304?navKey=VRNT-17800" target="_blank">
          <div class="animated" style="background:url(<hk:vhostImage/>/store/durex/images/Performa.jpg) 0 0 no-repeat">
            <img class="btn-fom" src="<hk:vhostImage/>/store/durex/images/btn-fom.png">
          </div></a>


        <a href="${pageContext.request.contextPath}/mcsv/durex/durex-apple-condoms/SP-11301?navKey=VRNT-44867" target="_blank">
          <div class="animated" style="background:url(<hk:vhostImage/>/store/durex/images/Apple.jpg) 0 0 no-repeat">
            <img class="btn-fom" src="<hk:vhostImage/>/store/durex/images/btn-fom.png">
          </div></a>


        <a href="${pageContext.request.contextPath}/mcsv/durex/durex-pleasuremax-condoms/SP-11305?navKey=VRNT-17802" target="_blank">
          <div class="animated" style="background:url(<hk:vhostImage/>/store/durex/images/pleasuremax.jpg) 0 0 no-repeat">
            <img class="btn-fom" src="<hk:vhostImage/>/store/durex/images/btn-fom.png">
          </div></a>


        <a href="${pageContext.request.contextPath}/mcsv/durex/durex-sensation-condoms/SP-11306?navKey=VRNT-17804" target="_blank">
          <div class="animated" style="background:url(<hk:vhostImage/>/store/durex/images/Sensetion.jpg) 0 0 no-repeat">
            <img class="btn-fom" src="<hk:vhostImage/>/store/durex/images/btn-fom.png">
          </div></a>




      </div>
      <!--- dcontent close --->

    </div>
  </s:layout-component>

  <s:layout-component name="msFooter">
    <s:layout-render name="/store/durex/durexFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>