<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <s:useActionBean beanclass="com.hk.web.action.beta.menu.StoreMenuAction" var="menuAction" event="pre"/>
  <div class="container clearfix">
    <div class="ftr-main-txt">
      <span class="fnt-bold"> authentic products</span>
      <span class="mrgn-lr-10">|</span>
      <span class="fnt-bold"> free delivery on orders over rs. 499</span>
      <span class="mrgn-lr-10">|</span>
      <span class="fnt-bold">secure payment system</span>
    </div>


    <div class="clearfix about-hk">
      HealthKart.com is India's largest online health & fitness store for men, women, and kids. Shop online from the
      latest collections of health, fitness, beauty, sports, eye care, parenting and similar products featuring the best
      brands.
    </div>
    <div class="clearfix fnt-sz9">
      <div class="cont-lft mrgn-t-10">
        <span class="txt-top">Pay using: </span>
        <span class="icn icn-pmt-methods"></span>
        <span class="txt-top">| Net Banking | Cash on Delivery</span>
      </div>
      <div class="cont-rht">
        <span class="txt-middle fnt-caps">CopyRight &copy; 2013-2014, HealthKart.com, or its affiliates </span>
        <span class="txt-middle mrgn-r-5"> | Connect with us:</span>

        <div class="disp-inln txt-middle mrgn-t-10">
          <a class="icn icn-fb" target="_blank" href="https://www.facebook.com/healthkart"></a>
          <a class="icn icn-twitter" target="_blank" href="https://twitter.com/healthkart"></a>
          <a class="icn icn-google-plus" target="_blank" href="https://plus.google.com/+healthkart/posts"></a>
        </div>
      </div>
    </div>

  </div>
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