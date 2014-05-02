<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp" pageTitle="About Us | Healthkart">
<s:useActionBean beanclass="com.hk.web.action.beta.hk.AboutUsAction" var="aboutAction"/>

  <s:layout-component name="content">
    <div class="container clearfix">

      <%--breadcrumbs begins--%>
      <div class="hk-breadcrumb-cntnr mrgn-bt-10">
      <span>
        <a href="/" title="Home">Home</a>
      </span>
        <span>&raquo;</span>
        <span class="fnt-bold">About Us</span>
      </div>
      <%--breadcrumbs ends--%>

      <div class="ttl-cntnr">
        <span class="icn icn-sqre "></span>
        <h1>About Us</h1>
        <span class="icn icn-sqre"></span>
      </div>
      <div class="row">
        <div class="span4">
          <s:layout-render name="/layouts/staticPagesLayout.jsp"/>
        </div>
        <div class="span12">
          <span class="disp-blk mrgn-t-10 txt-justify">
            Founded in March 2011, Healthkart.com (Aquamarine HealthCare Pvt. Ltd.) was formed on the grounds of giving
            simple, effective solutions to health enthusiasts. Today, Healthkart offers India's largest range of genuine
            health products across categories and all major brands.
          </span>
          <span class="disp-blk mrgn-t-10 txt-justify">
            HealthKart is run by a core team of highly qualified professionals (graduates from IIT, Stanford, Harvard),
            with experience in India and USA and bringing in strong skills in Healthcare, Technology, Operations and
            Customer Management. HealthKart has grown from a humble team of 4 in March 2011 to strength of 100+, heading
            towards the cherished goal of becoming India's e-health mega store. Our team of trained nutritionists,
            counselors and product experts help customers in choosing the right product/service via live chat, email and
            phone. We are backed by some of the most prestigious investors in the business - Sequoia Capital, Omidiyar
            Network and Kae Capital.
          </span>
          <span class="disp-blk mrgn-t-10 txt-justify">
            We source the best health & wellness products from across the globe & provide them to every Indian via
            online shopping. Our offering covers categories like Nutrition, Sports and Fitness, Diabetes, Home Devices,
            Eye, Personal Care, Beauty, Parenting & Health Services. We partner directly with brands and their
            authorized channels, to ensure strict quality control and deliver 100% genuine products.
          </span>
          <span class="disp-blk mrgn-t-10 txt-justify">
            We believe it is high time that we combined great technology, smart design and awesome customer care to give
            India a massive health and wellness boost. While there are challenges that need to be overcome, we are
            driven by our vision to become a dependable, household name in India, and offering customers direct access
            to genuine health products at best prices.
          </span>
        </div>
      </div>
    </div>
  </s:layout-component>
</s:layout-render>