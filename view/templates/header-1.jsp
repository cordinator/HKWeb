<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <%
    PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
    if (principal != null) {
      pageContext.setAttribute("userId", principal.getId());
    } else {
      pageContext.setAttribute("userId", null);
    }

    String roles = RoleConstants.HK_USER + "," + RoleConstants.HK_UNVERIFIED;

    String requestUrI = (String) request.getAttribute("javax.servlet.forward.request_uri");
    if(requestUrI == null){
      requestUrI = request.getRequestURI();
    }
    String queryString = request.getQueryString();
    StringBuilder stringBuilder = new StringBuilder(requestUrI);
    if(queryString!=null){
      stringBuilder.append("?").append(queryString);
    }
    String originalUrlHeader = stringBuilder.toString();

  %>
  <div class="header">
      <div class="cart">
        <span class="semi_bolditalic">10</span>
      </div>
      <div class="user" onclick="toggleMenu(event);"></div>
      <div class="menu selected" onclick="toggleMenu(event);"></div>
      <h1 class="logo"><a href="home.html">Healthkart</a></h1>
    </div>
    
    
    <div class="account_con font13" style="display: none;">
				 <div class="list_title">Account </div>
				 
				<div class="list_item  ellip">Profile<span></span></div>
				  
				<div class="list_item  ellip">Orders<span></span></div>
				
				<div class="list_item  ellip "> Re-order<span></span></div>
				  
				<div class="list_item  ellip"> Reward Points<span></span></div>  
    </div>
  
<div class="mask" onclick="toggleMenu(event)" style="height: 1112px; display: none;"> </div>




  <div class="container">

      <!--center style="font-size:36px">HEALTHKART</center><BR-->
      <div class="text-right header-info">
          <span class="txt-light pad-r-10"><s:link beanclass="com.hk.web.action.beta.hk.FAQAction" target="_blank"><s:param name="reftag" value="return"/>14 day return policy</s:link></span>
          <s:link beanclass="com.hk.web.action.beta.hk.ContactUsAction" target="_blank"><span class="txt-light pad-r-10">Contact Us</span></s:link>

          <a href="http://www.healthkartplus.com" target="_blank"><img src="<hk:vhostImage/>/assets/images/HKPlus-Logo.png" class="pad-r-10" alt="HK Plus"/></a>
          <a href="http://www.healthkart.com/resources" target="_blank"><img src="<hk:vhostImage/>/assets/images/HKResources-Logo.png" class="hk-resource" alt="HK Resources"/></a>
      </div>
      <div class="mrgn-b-10"><s:link beanclass="com.hk.web.action.beta.home.HomeAction"><img src="<hk:vhostImage/>/assets/images/HK-Logo.png" alt="HealthKart"/></s:link></div>
          
          <div class="span2">

                  <div class="hdr-drop-cntnr">
                      <div class="hdr-drop-label">
                          <shiro:hasAnyRoles name="<%=roles%>">
                              <div class="pop-label">Account</div>
                              <span class="fnt-sz10">Hi <span style="max-width: 64%;line-height:1em;display: inline-block;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;"><shiro:principal property="firstName"/></span>  <span class="icn icn-dwn-arrow"></span></span>
                          </shiro:hasAnyRoles>
                          <shiro:hasRole name="<%=RoleConstants.TEMP_USER%>">
                              <div class="pop-label">Account</div>
                              <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="fnt-sz10" > Sign in
                              <s:param name="redirectUrl" value="<%=originalUrlHeader%>"  />
                              </s:link> <span class="icn icn-dwn-arrow"></span>
                          </shiro:hasRole>
                          <shiro:guest>
                              <div class="pop-label" >Account</div>
                              <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="fnt-sz10"> Sign in
                                <s:param name="redirectUrl" value="<%=originalUrlHeader%>"  />
                              </s:link> <span class="icn icn-dwn-arrow"></span>
                          </shiro:guest>

                      </div>
                      <ul class="hdr-drop-down gl pad hide ">
                        <a href="/core/user/MyAccount.action?pre=&tabId=1"><li>
                              <%--<s:link beanclass="com.hk.web.action.beta.account.MyAccountAction" event="pre">
                                  Profile
                                  <s:param name="tabId" value="1"/>
                              </s:link>--%>
                              Profile
                          </li>
                        </a>
                        <a href="/core/user/UserManageAddress.action?manageAddresses=">
                          <li>
                              <%--<s:link beanclass="com.hk.web.action.beta.account.MyAccountAddressAction" event="pre">
                                  Addresses
                                  <s:param name="tabId" value="4"/>
                              </s:link>--%>
                              Addresses
                          </li>
                        </a>
                          <!--li>Orders</li>
                          <li>Rewards</li-->
                          <shiro:hasAnyRoles name="<%=roles%>">
                            <s:link beanclass="com.hk.web.action.beta.auth.LogoutAction"><li class="brdr-t">LOG OUT</li>
                            <s:param name="redirectUrl" value="/" />
                            </s:link>
                          </shiro:hasAnyRoles>
                      </ul>

                  </div>


          </div>
          <div class="span2 cart-pop-container">
              <div class="cart-pop-label">
                  <div class="pop-label">Your cart</div>
                  <span class="fnt-sz10"><span data-role="cart-counter"></span> items  <span class="icn icn-dwn-arrow"></span></span>
              </div>
              <div id='cartPop' class='popUp hide'>
                  <!--div class=icnSctn>
                      <div class=icn2></div>
                      <div class=icn></div>
                  </div-->
                  <div class=bdySctn>
                      <div class=body>
                          <!--div class=title style="text-align:right">
                                        <a href="javascript:void(0)" style="padding-right:8px" onclick="$('#cartPop').fadeOut('slow')">Hide</a>
                                      </div-->
                          <div class=msg>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
    <div id="logo" class="span7 alpha">
</div>
  </div>

</s:layout-definition>