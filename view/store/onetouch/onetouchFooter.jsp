<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <s:useActionBean beanclass="com.hk.web.action.beta.menu.StoreMenuAction" var="menuAction" event="pre"/>




  <%--<div class="ot-footer">--%>
    <%--<div class="wrapper">--%>
      <%--<p>This site is published by Johnson and Johnson Medical.<br>--%>

        <%--It is intended for use in India only.--%>
      <%--</p>--%>
<%--<span class="otLinkf">--%>
<%--<a href="http://www.healthkart.com/beta/hk/TermsConditions.action">PRIVACY POLICY</a> &nbsp; | &nbsp; <a href="${pageContext.request.contextPath}/store/onetouch/disclaimerOt.jsp">DISCLAIMER</a>--%>
<%--</span>--%>

    <%--</div>--%>
  <%--</div>--%>




  <div class="go-to-top-cntnr">
    <a href="javascript:void(0)" title="Back to Top" class="go-to-top cont-rht hide"></a>
  </div>
  <s:layout-component name="scriptComponent">
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/lazyload.js"></script>
    <script type="text/javascript">
      $('img.lazy').show().lazyload({threshold: 1000,failure_limit:10,skip_invisible:false});
      function goToTop() {
        $(window).scroll(function (e) {
          if ($(window).scrollTop() > 100) {
            $('.go-to-top-cntnr').css({
              position: 'fixed',
              top: '85%',
              right: '1%'
            }).fadeIn(500);
          } else {
            $('.go-to-top-cntnr').fadeOut(500);
          }
        });
      }
      goToTop();
      $(document).ready(function () {

      });
    </script>
  </s:layout-component>
</s:layout-definition>