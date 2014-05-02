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
    <s:layout-render name="/store/gosf/gosfHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">
    <div class="gosfBanner">
    <div class="wrapper">
    <a href="${pageContext.request.contextPath}/store/gosf/gosfExclusive.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/gosf-exclusives.jpg"></a> </div>  </div>
    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
   <div class="wrapper box1">



     <%--<div class="margin-b15">
       <a href="http://www.healthkart.com/sports-nutrition?navKey=CP-nt-sn"><img src="<hk:vhostImage/>/assets/images/gosf/Sprt_nut_960.jpg" /></a>
     </div>--%>


     <div>


       <div  class="box472"><a href="http://www.healthkart.com/health-devices/medical-care/weighing-scales?navKey=SCT-Hd-mc-ws&catPrefix=hd-mc-ws~&brands=427&fl=&pageNo=1&perPage=24&intw=Banner&intc=b_all_oc_gosf_no-offD_no-cpn_sd_Y2013M12D12&intp=hsc2_1"><img src="<hk:vhostImage/>/assets/images/gosf/hvWeighingScale.jpg"/></a></div>


       <div class="margin-l15 box472"><a href="http://www.healthkart.com/brand/dymatize?navKey=BR-497"><img src="<hk:vhostImage/>/assets/images/gosf/Dymatize_gosf.jpg"/></a></div>


     </div>

     <div class="cl"></div>


     <div class="margin-b15 margin-t15">
       <a href="http://www.healthkart.com/brand/yonex?navKey=BR-841"><img src="<hk:vhostImage/>/assets/images/gosf/Yonex_banner.jpg" /></a>
     </div>


           <div class="flot-l">
             <a href="${pageContext.request.contextPath}/store/gosf/sportsNutrition.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/sports-nutrition.jpg" /></a>
           </div>

          <div class="flot-l margin-l15">
            <div class="flot-l">
              <a href="${pageContext.request.contextPath}/store/gosf/healthNutrition.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/hlthnut.jpg" /></a> </div>


            <div class="margin-l15 flot-l">
              <a href="${pageContext.request.contextPath}/store/gosf/personalCare.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/Personalcare.jpg" /></a>
            </div>

            <div class="cl"></div>
          <div class=" margin-t15">
            <a href="${pageContext.request.contextPath}/store/gosf/beauty.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/beauty.jpg" /></a></div>

          </div>


     <div class="cl"></div>






     <div class="margin-t15 flot-l">
       <div class="box310">
         <a href="http://www.healthkart.com/beta/search/Search.action?txtQ=reebok&pageNo=1&perPage=24&_sourcePage=W4Am3QirLlY13cAGgUyU4DMp1tGcIgQWA54u4EYH0Uo=&__fp=gruFlJ8Gsuk="><img src="<hk:vhostImage/>/assets/images/gosf/reebokBanner.jpg" />   </a>
       </div>

       <div class="box310 margin-l15">
         <a href="http://www.healthkart.com/beta/search/Search.action?txtQ=stag+fitness&pageNo=1&perPage=24&_sourcePage=-QrHGq-GHzY13cAGgUyU4DMp1tGcIgQWA54u4EYH0Uo=&__fp=t7_hSgf0P2A="><img src="<hk:vhostImage/>/assets/images/gosf/stagBanner.jpg" />  </a>
       </div>

       <div class="box310 margin-l15">
         <a href="${pageContext.request.contextPath}/store/gosf/shoes.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/footwear-aditional-10.jpg" />  </a>
       </div>

     </div>
     <div class="cl"></div>



       <div class="margin-t15">


         <div  class="box472"><a href="${pageContext.request.contextPath}/store/gosf/monitoringTesting.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/HD.png"/></a></div>


     <div class="margin-l15 box472"><a href="${pageContext.request.contextPath}/store/gosf/womenCare.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/knockoutHomeBanner.jpg"/></a></div>


       </div>

     <div class="cl"></div>





     <div class="flot-l margin-t15">


       <div>
         <a href="http://www.healthkart.com/sv/muscleblaze-whey-protein/SP-8686?navKey=VRNT-13477"><img src="<hk:vhostImage/>/assets/images/gosf/mbWheyBanner.jpg" /></a></div>

       <div class="cl"></div>

       <div class="flot-l margin-t15">
         <a href="${pageContext.request.contextPath}/store/gosf/eye.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/EYE.jpg" /></a> </div>

       <div class="margin-l15 flot-l margin-t15">
         <a href="http://www.healthkart.com/personal-care/miscellaneous/mosquito-net?navKey=SCT-pc-mn&catPrefix=pc-mn~&brands=&fl=&pageNo=1&perPage=24"><img src="<hk:vhostImage/>/assets/images/gosf/Fst_move2.jpg" /></a>
       </div>


     </div>


     <div class="flot-l  margin-l15 margin-t15">
       <a href="${pageContext.request.contextPath}/store/gosf/sexualWellness.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/sexual-wellness-banner.png" /></a>
     </div>



     <div class="cl"></div>




     <div class="margin-t15">


       <div  class="box472"><a href="http://www.healthkart.com/sv/vitamin-shoppe-apple-cider-vinegar/SP-8324?navKey=VRNT-12815"><img src="<hk:vhostImage/>/assets/images/gosf/Fst_move10.jpg" /></a></div>


       <div class="margin-l15 box472"><a href="http://www.healthkart.com/sv/healthviva-daily+-(multivitamin-n-multimineral-with-ginseng)/SP-23416?navKey=VRNT-45165"><img src="<hk:vhostImage/>/assets/images/gosf/Fst_move11.jpg"/></a></div>


     </div>



     <div class="cl"></div>

    <div class="margin-t15 flot-l">
      <div class="box310">
        <a href="http://www.healthkart.com/sv/auravedic-skin-oil/SP-176?navKey=VRNT-334"><img src="<hk:vhostImage/>/assets/images/gosf/Fst_move7.jpg" />   </a>
      </div>

     <div class="box310 margin-l15">
       <a href="http://www.healthkart.com/beta/search/Search.action?txtQ=environics"><img src="<hk:vhostImage/>/assets/images/gosf/envirochips.jpg" />  </a>
     </div>

     <div class="box310 margin-l15">
       <a href="http://www.healthkart.com/beta/search/Search.action?txtQ=cosco+home+gym&pageNo=1&perPage=24&_sourcePage=Wl2vGRKU89g13cAGgUyU4DMp1tGcIgQWA54u4EYH0Uo=&__fp=upQXq2XprNY="><img src="<hk:vhostImage/>/assets/images/gosf/cosco-GOSF.jpg" />  </a>
     </div>

    </div>
     <div class="cl"></div>






   </div>
  </s:layout-component>

  <s:layout-component name="msFooter">
    <s:layout-render name="/store/gosf/gosfFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>