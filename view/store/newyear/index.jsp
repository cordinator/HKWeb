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

    <div class="wrapper">
      <div class="nyBanner">
    <img src="<hk:vhostImage/>/store/newyear/images/homeBanner.jpg"></div>  </div>
    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
   <div class="wrapper box1">




     <div>


       <div  class="box472 margin-b15"><a href="${pageContext.request.contextPath}/store/newyear/beauty.jsp"><img src="<hk:vhostImage/>/store/newyear/images/beauty-home.jpg"/></a></div>


       <div class="margin-l15 box472 margin-b15"><a href="${pageContext.request.contextPath}/store/newyear/healthDevices.jsp"><img src="<hk:vhostImage/>/store/newyear/images/hd-home.jpg"/></a></div>


     </div>

     <div class="cl"></div>



           <div class="flot-l">
             <a href="${pageContext.request.contextPath}/store/newyear/parenting.jsp"><img src="<hk:vhostImage/>/store/newyear/images/parenting-home.jpg" /></a>
           </div>

          <div class="flot-l margin-l15">
            <div class="flot-l">
              <a href="${pageContext.request.contextPath}/store/newyear/eye.jsp"><img src="<hk:vhostImage/>/store/newyear/images/eye-home.jpg" /></a> </div>


            <div class="margin-l15 flot-l">
              <a href="${pageContext.request.contextPath}/store/newyear/personalCare.jsp"><img src="<hk:vhostImage/>/store/newyear/images/pc-home.jpg" /></a>
            </div>

            <div class="cl"></div>
          <div class=" margin-t15">
            <a href="${pageContext.request.contextPath}/store/newyear/diabetes.jsp"><img src="<hk:vhostImage/>/store/newyear/images/diabetes-home.jpg" /></a></div>

          </div>


     <div class="cl"></div>



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