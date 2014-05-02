<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp" title="Vitamin Shoppe">
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
    <s:layout-render name="/store/vitaminShoppe/vitaminShoppeHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">
    <div class="container clearfix topBanner">
      <div class="bnr-main-cnt">
        <img src="<hk:vhostImage/>/store/vitaminShoppe/images/vsBanner.jpg" style="max-width:960px;" alt="Vitamin Shoppe">
      </div>
    </div>

  </s:layout-component>

  <s:layout-component name="msContent">
     <div class="container">


    <div class="ttl-cntnr mrgn-b-20 ">
         <span class="icn icn-sqre"></span>
         <h2 class="fnt-bolder fnt-caps">ARTHRITIS SUPPORT</h2>
         <span class="icn icn-sqre"></span>
          <p class="mrgn-b-25">The supplements your joints need and deserve.</p>
          <s:layout-render name="/store/vitaminShoppe/vitaminShoppeCatalogLayout.jsp" vid = "12879,13958,14224,45156" showAddToCart="true"/>
    </div>
       <!--- Arthritis Close -->

       <div class="ttl-cntnr mrgn-b-20 ">
         <span class="icn icn-sqre"></span>
         <h2 class="fnt-bolder fnt-caps">BONE &amp; MUSCLE</h2>
         <span class="icn icn-sqre"></span>
         <p class="mrgn-b-25">Stronger bones, leaner muscles and a healthier you.</p>
         <s:layout-render name="/store/vitaminShoppe/vitaminShoppeCatalogLayout.jsp" vid = "12787,12788,42624,42626,12883,42625,13968,12899" showAddToCart="true"/>
       </div>
       <!--- BONE & MUSCLE Close -->

       <div class="ttl-cntnr mrgn-b-20 ">
         <span class="icn icn-sqre"></span>
         <h2 class="fnt-bolder fnt-caps">HEART &amp; BLOOD PRESSURE</h2>
         <span class="icn icn-sqre"></span>
         <p class="mrgn-b-25">A healthier heart and peace of mind.</p>
         <s:layout-render name="/store/vitaminShoppe/vitaminShoppeCatalogLayout.jsp" vid = "12938,13952,12783,12821" showAddToCart="true"/>
       </div>
       <!--- HEART & BLOOD PRESSURE Close -->

       <div class="ttl-cntnr mrgn-b-20 ">
         <span class="icn icn-sqre"></span>
         <h2 class="fnt-bolder fnt-caps">DIABETIC SUPPORT</h2>
         <span class="icn icn-sqre"></span>
         <p class="mrgn-b-25">Deals that can not get any sweeter.</p>
         <s:layout-render name="/store/vitaminShoppe/vitaminShoppeCatalogLayout.jsp" vid = "13916,12937,12915,12785" showAddToCart="true"/>
       </div>
       <!--- DIABETIC SUPPORT Close -->

       <div class="ttl-cntnr mrgn-b-20 ">
         <span class="icn icn-sqre"></span>
         <h2 class="fnt-bolder fnt-caps">IMMUNITY SUPPORT</h2>
         <span class="icn icn-sqre"></span>
         <p class="mrgn-b-25">Your body can take so much more if your immunity is up to it.</p>
         <s:layout-render name="/store/vitaminShoppe/vitaminShoppeCatalogLayout.jsp" vid = "12827,12799,12812,12885" showAddToCart="true"/>
       </div>
       <!--- IMMUNITY SUPPORT Close -->

       <div class="ttl-cntnr mrgn-b-20 ">
         <span class="icn icn-sqre"></span>
         <h2 class="fnt-bolder fnt-caps">HAIR, SKIN &amp; NAILS</h2>
         <span class="icn icn-sqre"></span>
         <p class="mrgn-b-25">Stronger hair, glowing skin and shiny nails for a song.</p>
         <s:layout-render name="/store/vitaminShoppe/vitaminShoppeCatalogLayout.jsp" vid = "13935,13951,13955,12772" showAddToCart="true"/>
       </div>
       <!--- HAIR, SKIN & NAILS Close -->

       <div class="ttl-cntnr mrgn-b-20 ">
         <span class="icn icn-sqre"></span>
         <h2 class="fnt-bolder fnt-caps">DIGESTIVE CARE</h2>
         <span class="icn icn-sqre"></span>
         <p class="mrgn-b-25">Your tummy will thank you.</p>
         <s:layout-render name="/store/vitaminShoppe/vitaminShoppeCatalogLayout.jsp" vid = "13936,12845,13955,13935" showAddToCart="true"/>
       </div>
       <!--- Arthritis Close -->

       <div class="ttl-cntnr mrgn-b-20 ">
         <span class="icn icn-sqre"></span>
         <h2 class="fnt-bolder fnt-caps">OTHER CONCERN</h2>
         <span class="icn icn-sqre"></span>
         <p class="mrgn-b-25">For all that you cannot leave behind.</p>
         <s:layout-render name="/store/vitaminShoppe/vitaminShoppeCatalogLayout.jsp" vid = "13925,13917,12847,12944,13962,13991,42628" showAddToCart="true"/>
       </div>
       <!--- Arthritis Close -->





     </div>
    <!--- Container Close -->
  </s:layout-component>


  <s:layout-component name="msFooter">
    <s:layout-render name="/store/vitaminShoppe/vitaminShoppeFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>