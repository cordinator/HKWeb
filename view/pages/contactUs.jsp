<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<%@ page import="com.hk.constants.HealthkartWebConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp" pageTitle="Contact Us | Healthkart">
  <s:useActionBean beanclass="com.hk.web.action.beta.hk.ContactUsAction" var="contactAction"/>
  <s:layout-component name="content">
    <div class="container clearfix">

        <%--breadcrumbs begins--%>
      <div class="hk-breadcrumb-cntnr mrgn-bt-10">
      <span>
        <a href="/" title="Home">Home</a>
      </span>
        <span>&raquo;</span>
        <span class="fnt-bold">Contact Us</span>
      </div>
        <%--breadcrumbs ends--%>

      <div class="ttl-cntnr">
        <span class="icn icn-sqre "></span>

        <h1>Contact Us</h1>
        <span class="icn icn-sqre"></span>
      </div>
      <div class="row">
        <div class="span4 faq-nav-box-cntnr" id="NavBox">
          <ul class="nav faq-nav-box">
            <li><a href="${pageContext.request.contextPath}/core/user/CustomerOrderHistory.action">view your
              order</a><span>&raquo;</span></li>
            <li><a href="${pageContext.request.contextPath}/core/user/UserManageAddress.action?manageAddresses=">view
              all
              addresses</a><span>&raquo;</span></li>
            <li><a href="${pageContext.request.contextPath}/core/user/MyAccount.action">update
              profile</a><span>&raquo;</span></li>
              <%--<li><s:link beanclass="com.hk.web.action.beta.account.MyAccountReorderAction">place
                re-order</s:link><span>&raquo;</span></li>--%>
          </ul>
        </div>
        <div class="span12">
          <div class="contact-opt">
            <span class="mrgn-t-10 disp-blk">Have a query,</span>
            <span class="mrgn-bt-5 disp-blk">
              Before you contact us please do have a look at our <s:link beanclass="com.hk.web.action.beta.hk.FAQAction"
                                                                         title="View All FAQs"><span class="txt-blue">FAQs</span></s:link>
              for a quicker resolution of your query.
            </span>

            <div class="faq-container row">
              <div class="span6 alpha faq-mini-box">
                <h3 class="faq-head">Order related FAQs</h3>
                <ul>
                  <li>What do the different order status mean?</li>
                  <li>How do I know my order has been confirmed?</li>
                  <li>Can I order a product that is 'Out of Stock'?</li>
                </ul>
                <s:link beanclass="com.hk.web.action.beta.hk.FAQAction" title="View All Order related FAQs"
                        class="mrgn-t-20">
                  <s:param name="reftag" value="order"/>view more<span>&nbsp&raquo;</span>
                </s:link>
              </div>
              <div class="span6 faq-mini-box">
                <h3 class="faq-head">Payment related FAQs</h3>
                <ul>
                  <li>How do I pay for a HealthKart purchase?</li>
                  <li>Are there any hidden charges when I make a purchase on HealthKart?</li>
                  <li>What is Cash on Delivery?</li>
                </ul>
                <s:link beanclass="com.hk.web.action.beta.hk.FAQAction" title="View All Payment related FAQs">
                  <s:param name="reftag" value="payment"/>view more<span>&nbsp&raquo;</span>
                </s:link>
              </div>
              <div class="span6 alpha faq-mini-box">
                <h3 class="faq-head">Delivery related FAQs</h3>
                <ul>
                  <li>What are the delivery charges?</li>
                  <li>What is the estimated delivery time?</li>
                  <li>How can I track the delivery of my order?</li>
                </ul>
                <s:link beanclass="com.hk.web.action.beta.hk.FAQAction" title="View all Delivery related FAQs"
                        class="mrgn-t-20">
                  <s:param name="reftag" value="delivery"/>view more<span>&nbsp&raquo;</span>
                </s:link>
              </div>
              <div class="span6 faq-mini-box">
                <h3 class="faq-head">Returns related FAQs</h3>
                <ul>
                  <li>What is the general return policy on HealthKart?</li>
                  <li>What should I do if I receive a Defective Item?</li>
                  <li>Is there a category specific policy for returns?</li>
                </ul>
                <s:link beanclass="com.hk.web.action.beta.hk.FAQAction" title="View All Returns related FAQs"
                        class="mrgn-t-20">
                  <s:param name="reftag" value="return"/>view more<span>&nbsp&raquo;</span>
                </s:link>
              </div>
            </div>
          </div>
          <div class="contact-opt">
            <h2 class="contact-head">REACH US</h2>

            <div class="cntct-form">
              <s:layout-render name="/layouts/errorLayout.jsp"  errorMsgClass="sign-on-msg" />
              <s:form beanclass="com.hk.web.action.beta.hk.ContactUsAction" >
                <div class="left">
                  <h2 class="mrgn-b-20">Use the contact form below </h2>

                  <div class="row">

                    <label for="name" class="span2">Name <span class="mand-aster">*</span></label>

                    <div class="span6">
                      <s:text name="name" id="name" />
                    </div>
                  </div>
                  <div class="row">
                    <label for="email" class="span2">Email <span class="mand-aster">*</span></label>

                    <div class="span6">
                      <s:text name="email" id="email" />
                    </div>
                  </div>
                  <div class="row">
                    <label for="phone" class="span2">Phone</label>

                    <div class="span6">
                      <s:text name="phone" id="phone" />
                    </div>
                  </div>
                  <div class="row">
                    <label for="msgSubject" class="span2">Subject <span class="mand-aster">*</span></label>

                    <div class="span6">
                      <s:select name="msgSubject" id="msgSubject">
                        <s:option value="General feedback/support">General feedback/support</s:option>
                        <s:option value="Order Status">Order Status</s:option>
                        <s:option value="Payment related">Payment related</s:option>
                        <s:option value="Feature Request">Feature Request</s:option>
                        <s:option value="Product Request">Product Request</s:option>
                        <s:option value="Other">Other</s:option>
                      </s:select>
                    </div>
                  </div>
                  <div class="row">
                    <label for="msgText" class="span2">Message <span class="mand-aster">*</span></label>

                    <div class="review-txt-contnr span9">
                      <textarea name="msgText" id="msgText" rows="15" cols="50">${contactAction.msgText}</textarea>
                    </div>
                  </div>
                  <div class="row">
                    <div class="span2"><div class='label'>Tell us you are human <span class="mand-aster">*</span></div></div>
                    <div class="span2">

                  <%
                    ReCaptcha captcha = ReCaptchaFactory.newReCaptcha(HealthkartWebConstants.recaptchaPublicKey, HealthkartWebConstants.recaptchaPrivateKey, false);
                    out.print(captcha.createRecaptchaHtml(request.getParameter("error"), null));
                  %>
                   </div>
                  </div>
                  <div class="send-btn-cntnr">
                    <s:submit name="sendMessage" value="Send Message" class="btn btn btn-blue" />
                  </div>

                </div>
              </s:form>
            </div>


            <span class="mrgn-t-5 disp-blk"><span
                class="fnt-bold">Call Us:</span> 0124-4616444 (9 AM to 12 Midnight)</span>
            <span class="mrgn-t-5 disp-blk"><span class="fnt-bold">Email Us:</span> For customer support, feedback and any other
              issues write
              to <span class="txt-blue">info@healthkart.com</span></span>
            <span class="mrgn-t-5 disp-blk"><span class="fnt-bold">Headquarters:</span> Aquamarine HealthCare Pvt. Ltd.</span>
            <span class="mrgn-t-5 disp-blk">4th Floor, Parshavnath Arcadia, T 01, MG Road (Opposite to Motorola), Sector-14,
              Gurgaon - 122001
            </span>
          </div>
        </div>
      </div>
    </div>
  </s:layout-component>
  <s:layout-component name="scriptComponent">
    <script type="text/javascript">

      $('[name=sendMessage]').click(function (event) {
        var doSubmit = true;
        if (HK.validator.isNull('[name=name]')) {
          HK.validator.showErrMsg('[name=name]', HK.errs.enterName);
          doSubmit = false;
        }
        else {
          HK.validator.hideErrMsg('[name=name]');
        }
        if (HK.validator.isNull('[name=email]')) {
          HK.validator.hideErrMsg('[name=email]');
          HK.validator.showErrMsg('[name=email]', HK.errs.enterEmail);
          doSubmit = false;
        }
        else if (!HK.validator.isEmail('[name=email]')) {
          HK.validator.hideErrMsg('[name=email]');
          HK.validator.showErrMsg('[name=email]', HK.errs.invalidEmail);
          doSubmit = false;
        }
        else {
          HK.validator.hideErrMsg('[name=email]');
        }
        if (HK.validator.isNull('[name=msgText]')) {
          HK.validator.showErrMsg('[name=msgText]', HK.errs.enterMessage);
          doSubmit = false;
        }
        else {
          HK.validator.hideErrMsg('[name=msgText]');
        }

        if (doSubmit != true) {
          HK.utils.Scroll.toElement($('.contact-head'));
          event.preventDefault();
        }

      });

      $(document).ready(function(){
       var error = "${contactAction.error}";
       var clrText = "${contactAction.clrText}";
       if(error  == "true"){
         if(clrText == "true"){
           $('[name=name]').val('');
           $('[name=email]').val('');
           $('[name=phone]').val('');
           $('[name=msgText]').val('');
         }
         HK.utils.Scroll.toElement($('.contact-head'));
       }
      });

    </script>
  </s:layout-component>
</s:layout-render>