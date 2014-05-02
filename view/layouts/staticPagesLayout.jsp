<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglibInclude.jsp" %>

<s:layout-definition>
  <ul class="accnt-nav-box">
    <li>
      <s:link beanclass="com.hk.web.action.beta.hk.AboutUsAction">
        About Us
      </s:link>
      <span>&raquo;</span>
    </li>
    <li>
      <s:link beanclass="com.hk.web.action.beta.hk.TermsConditionsAction">
        Terms and Conditions
      </s:link>
      <span>&raquo;</span>
    </li>
    <%--<li>--%>
      <%--<a href="/beta/hk/FAQ.action#return">--%>
        <%--Return Policy--%>
      <%--</a>--%>
      <%--<span>&raquo;</span></li>--%>
    <%--<li>--%>
      <%--<s:link beanclass="com.hk.web.action.beta.hk.FAQAction">--%>
        <%--FAQ--%>
      <%--</s:link>--%>
      <%--<span>&raquo;</span></li>--%>
    <%--<li>--%>
      <%--<s:link beanclass="com.hk.web.action.beta.hk.ContactUsAction">--%>
        <%--Contact Us--%>
      <%--</s:link>--%>
      <%--<span>&raquo;</span>--%>
    <%--</li>--%>
  </ul>
</s:layout-definition>