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




        <a href="${pageContext.request.contextPath}/mcsv/durex/durex-play-massage-2-in-1-gel/SP-11333?navKey=VRNT-35675" target="_blank">
          <div class="animated" style="background:url(<hk:vhostImage/>/store/durex/images/play-sensual.jpg) 0 0 no-repeat">
            <img class="btn-fom" src="<hk:vhostImage/>/store/durex/images/btn-fom.png">
          </div></a>

        <a href="${pageContext.request.contextPath}/mcsv/durex/durex-play-massage-2-in-1-gel/SP-11333?navKey=VRNT-35676" target="_blank">
          <div class="animated" style="background:url(<hk:vhostImage/>/store/durex/images/play-simulating.jpg) 0 0 no-repeat">
            <img class="btn-fom" src="<hk:vhostImage/>/store/durex/images/btn-fom.png">
          </div></a>


        <a href="${pageContext.request.contextPath}/mcsv/durex/durex-play-lubes/SP-11339?navKey=VRNT-48695" target="_blank">
          <div class="animated" style="background:url(<hk:vhostImage/>/store/durex/images/Play-Tingle.jpg) 0 0 no-repeat">
            <img class="btn-fom" src="<hk:vhostImage/>/store/durex/images/btn-fom.png">
          </div></a>

        <a href="${pageContext.request.contextPath}/mcsv/durex/durex-play-lubes/SP-11339?navKey=VRNT-17860" target="_blank">
          <div class="animated" style="background:url(<hk:vhostImage/>/store/durex/images/Play-Cherry.jpg) 0 0 no-repeat">
            <img class="btn-fom" src="<hk:vhostImage/>/store/durex/images/btn-fom.png">
          </div></a>


        <a href="${pageContext.request.contextPath}/mcsv/durex/durex-play-lubes/SP-11339?navKey=VRNT-48734" target="_blank">
          <div class="animated" style="background:url(<hk:vhostImage/>/store/durex/images/straberry.jpg) 0 0 no-repeat">
            <img class="btn-fom" src="<hk:vhostImage/>/store/durex/images/btn-fom.png">
          </div></a>


        <a href="${pageContext.request.contextPath}/mcsv/durex/durex-play-vibrating-ring/SP-11340?navKey=VRNT-17861" target="_blank">
          <div class="animated" style="background:url(<hk:vhostImage/>/store/durex/images/Play-Vibrations.jpg) 0 0 no-repeat">
            <img class="btn-fom" src="<hk:vhostImage/>/store/durex/images/btn-fom.png">
          </div></a>


        <a href="${pageContext.request.contextPath}/mcsv/durex/durex-play-little-devil/SP-24773?navKey=VRNT-47872" target="_blank">
          <div class="animated" style="background:url(<hk:vhostImage/>/store/durex/images/Play-Little-Devil.jpg) 0 0 no-repeat">
            <img class="btn-fom" src="<hk:vhostImage/>/store/durex/images/btn-fom.png">
          </div></a>


        <a href="${pageContext.request.contextPath}/mcsv/durex/durex-play-ultra-pleasure/SP-24774?navKey=VRNT-47873" target="_blank">
          <div class="animated" style="background:url(<hk:vhostImage/>/store/durex/images/Play-Ultra.jpg) 0 0 no-repeat">
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