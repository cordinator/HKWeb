<%@ page import="com.hk.constants.marketing.TagConstants" %>
<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/templates/general.jsp" showOldHKLink="false">
<s:useActionBean beanclass="com.hk.web.action.beta.affiliate.AffiliateAction" var="affiliateAction"/>

  <s:layout-component name="content">

    <div class="mainContainer">
        <div class="span16">
            <div class="ttl-cntnr mrgn-t-25">
                <span class="icn icn-sqre "></span>
                <h1 class="text-center">HealthKart Affiliate Program</h1>
                <span class="icn icn-sqre "></span>
            </div>

            <p class="mrgn-bt-20">Introduce people to the benefits of HealthKart and get benefitted in return. Take home a reward percentage on every purchase by the person you refer. So you earn, as we grow!!</p>
            <div class="disp-inln" style="margin-left:90px">
                <iframe src="https://docs.google.com/forms/d/1qnEk9-3tHa2WGpbSJUttZRkpFGDjR3pv4kvHiS99MLk/viewform?embedded=true" width="760" height="650" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>
            </div>
        </div>
    </div>


  </s:layout-component>


</s:layout-render>