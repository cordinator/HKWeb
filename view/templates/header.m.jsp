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
    <a class="cart" href="/beta/cart/Cart.action">
        <span id="semiBolditalic_H" class="semi_bolditalic"></span>
      </a>
      
      <div class="user" onclick="toggleMenu(event);"></div>
      <div class="menu" onclick="toggleMenu(event);"></div>
      <h1 class="logo"><s:link beanclass="com.hk.web.action.beta.home.HomeAction">Healthkart</s:link></h1>
    </div>
    <div class="search_hldr">
    <s:layout-render name="/includes/autoCompleteInclude.m.jsp"/>
    </div>
    <div class="menu_con" style="display:none;">
    	<s:layout-render name="/includes/menuInclude.m.jsp" tempVar="HEADER" showMenu="${showMenu}"/>
    </div>
	   <div class="account_con font13" style="display: none;">
	   			<shiro:hasAnyRoles name="<%=roles%>">
				 <div class="list_title">Account </div>
				 <div class="list_item  ellip">Hi <shiro:principal property="firstName"/></div>
				 </shiro:hasAnyRoles>
				 <shiro:hasRole name="<%=RoleConstants.TEMP_USER%>">
                     <div class="list_title">Account </div>
                     <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="list_item  ellip"> Sign In
                     <s:param name="redirectUrl" value="<%=originalUrlHeader%>"  />
                     <span></span>
                     </s:link>
                 </shiro:hasRole>
                 <shiro:guest>
                    <div class="list_title">Account </div>
                    <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="list_item  ellip"> Sign In
                      <s:param name="redirectUrl" value="<%=originalUrlHeader%>"  />
                      <span></span>
                    </s:link>
                </shiro:guest>
				<a class="list_item  ellip" href="/core/user/MyAccount.action?pre=&tabId=1">Profile<span></span></a>
				  
				<a class="list_item  ellip">Orders<span></span></a>
				
				<a class="list_item  ellip "> Re-order<span></span></a>
				  
				<a class="list_item  ellip"> Reward Points<span></span></a>  
				
				<shiro:hasAnyRoles name="<%=roles%>">
                   <s:link beanclass="com.hk.web.action.beta.auth.LogoutAction" class="list_item  ellip">LOG OUT
                   <s:param name="redirectUrl" value="/" />
                   </s:link>
                 </shiro:hasAnyRoles>
    </div>
<script>


microAjax(CONTEXT_ROOT+"/api/cart/summary" ,
		function(data){
	  data = JSON.parse(data);
	  var results = data.results;
	  document.getElementById("semiBolditalic_H").innerHTML = results.noOfItems;
	 });

</script>
</s:layout-definition>