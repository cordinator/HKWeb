<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>

  <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js"></script>

  <script type="text/javascript">//<![CDATA[
  $(window).load(function(){
    $('.animated').hover(function(){
      $(this).stop().animate({'background-position': '0 -300px'});
    }, function(){
      $(this).stop().animate({'background-position': '0 0'});
    });

    /** jquery.bgpos.js
     * @author Alexander Farkas
     * v. 1.02
     */
    (function($) {
      $.extend($.fx.step,{
        backgroundPosition: function(fx) {
          if (fx.state === 0 && typeof fx.end == 'string') {
            var start = $.curCSS(fx.elem,'backgroundPosition');
            start = toArray(start);
            fx.start = [start[0],start[2]];
            var end = toArray(fx.end);
            fx.end = [end[0],end[2]];
            fx.unit = [end[1],end[3]];
          }
          var nowPosX = [];
          nowPosX[0] = ((fx.end[0] - fx.start[0]) * fx.pos) + fx.start[0] + fx.unit[0];
          nowPosX[1] = ((fx.end[1] - fx.start[1]) * fx.pos) + fx.start[1] + fx.unit[1];
          fx.elem.style.backgroundPosition = nowPosX[0]+' '+nowPosX[1];

          function toArray(strg){
            strg = strg.replace(/left|top/g,'0px');
            strg = strg.replace(/right|bottom/g,'100%');
            strg = strg.replace(/([0-9\.]+)(\s|\)|$)/g,"$1px$2");
            var res = strg.match(/(-?[0-9\.]+)(px|\%|em|pt)\s(-?[0-9\.]+)(px|\%|em|pt)/);
            return [parseFloat(res[1],10),res[2],parseFloat(res[3],10),res[4]];
          }
        }
      });
    })(jQuery);
  });//]]>

  </script>

  <link type="text/css" rel="stylesheet" href="<hk:vhostCss/>/store/durex/durex.css"/>


  <%
    PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
    if (principal != null) {
      pageContext.setAttribute("userId", principal.getId());
    } else {
      pageContext.setAttribute("userId", null);
    }

    String roles = RoleConstants.HK_USER + "," + RoleConstants.HK_UNVERIFIED;

    String requestUrI = (String) request.getAttribute("javax.servlet.forward.request_uri");
    if (requestUrI == null) {
      requestUrI = request.getRequestURI();
    }
    String queryString = request.getQueryString();
    StringBuilder stringBuilder = new StringBuilder(requestUrI);
    if (queryString != null) {
      stringBuilder.append("?").append(queryString);
    }
    String originalUrlHeader = stringBuilder.toString();

  %>
<div class="wrapper">

<div class="dHeader"> <a href="${pageContext.request.contextPath}/store/durex/index.jsp"><img class="flot-l" src="<hk:vhostImage/>/store/durex/images/logo-durex.png"></a>



  <div class="row cont-rht marginT-13 mrgn-b-10 text-left">
    <div class="span2 mrgn-bt-15">
      <div class="hdr-drop-cntnr">
        <div class="hdr-drop-label">
          <shiro:hasAnyRoles name="<%=roles%>">
            <div class="pop-label">Account</div>
              <span class="fnt-sz10">Hi <span
                  style="max-width: 64%;line-height:1em;display: inline-block;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;"><shiro:principal
                  property="firstName"/></span>  <span class="icn icn-dwn-arrow"></span></span>
          </shiro:hasAnyRoles>
          <shiro:hasRole name="<%=RoleConstants.TEMP_USER%>">
            <div class="pop-label">Account</div>
            <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="fnt-sz10 whiteColor"> Sign in
              <s:param name="redirectUrl" value="<%=originalUrlHeader%>"/>
            </s:link> <span class="icn icn-dwn-arrow"></span>
          </shiro:hasRole>
          <shiro:guest>
            <div class="pop-label">Account</div>
            <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="fnt-sz10 whiteColor"> Sign in
              <s:param name="redirectUrl" value="<%=originalUrlHeader%>"/>
            </s:link> <span class="icn icn-dwn-arrow"></span>
          </shiro:guest>
        </div>
        <ul class="hdr-drop-down gl pad hide ">
          <a href="/core/user/MyAccount.action?pre=&tabId=1">
            <li>
              Profile
            </li>
          </a>
          <a href="/core/user/UserManageAddress.action?manageAddresses=">
            <li>
              Addresses
            </li>
          </a>
          <shiro:hasAnyRoles name="<%=roles%>">
            <s:link beanclass="com.hk.web.action.beta.auth.LogoutAction">
              <li class="brdr-t">LOG OUT</li>
              <s:param name="redirectUrl" value="/"/>
            </s:link>
          </shiro:hasAnyRoles>
        </ul>

      </div>


    </div>
    <div class="span2 mrgn-bt-15 cart-pop-container">
      <div class="cart-pop-label">
        <div class="pop-label">Your cart</div>
          <span class="fnt-sz10"><span data-role="cart-counter"></span> items  <span
              class="icn icn-dwn-arrow"></span></span>
      </div>
      <div id='cartPop' class='popUp hide'>
        <div class=bdySctn>
          <div class=body>
            <div class=msg>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>




  <div class="cl"></div>


  <ul class="dMenu">
    <li><a href="${pageContext.request.contextPath}/store/durex/playRange.jsp">Play Range</a></li>
    <li><a href="${pageContext.request.contextPath}/store/durex/condoms.jsp">Condoms</a></li>
    <a href="https://www.facebook.com/DurexIndia" target="_blank"><li><img class="dSocial" src="<hk:vhostImage/>/store/durex/images/logo-social.png"></li></a>

    <a href="https://twitter.com/DurexIndia" target="_blank"><li><img class="dSocial" src="<hk:vhostImage/>/store/durex/images/twitterDurex.png"></li></a>

    <a href="http://www.youtube.com/durexindia" target="_blank"><li><img class="dSocial" src="<hk:vhostImage/>/store/durex/images/youTube.png"></li></a>
  </ul></div>





</div>
  <div class="cl"></div>

</s:layout-definition>