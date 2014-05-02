<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <s:useActionBean beanclass="com.hk.web.action.beta.menu.StoreMenuAction" var="menuAction" event="pre"/>

  <div class="dfooter">
    &copy; 2013 HealthKart. All rights reserved. This is the official Durex eCommerce store powered by <a href="http://www.healthkart.com/">HealthKart.com</a> <br/>
    <a href="http://www.durexindia.com/">Click Here</a> for the official website of Durex India</div>
  </body>


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