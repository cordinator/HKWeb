<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 05/08/13
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
<%--Error/success Msg begins--%>
<c:set var="em" value='<%=request.getAttribute("em")%>'/>
<c:set var="gm" value='<%=request.getAttribute("gm")%>'/>
<c:if test="${em!=null and em eq true}">
  <div class="err-cntnr">
    <span class="icn-warning-small"></span>

    <div id="error-messages" class="${errorMsgClass}"><s:messages key="errorMessages"/></div>
    <span class="icn icn-close2 remove-error"></span>
  </div>
</c:if>
<c:if test="${gm!=null and gm eq true}">
  <div class="alert-cntnr">
    <span class="icn-success"></span>
    <div class="alert-messages ${errorMsgClass}"><s:messages key="generalMessages"/></div>
    <span class="icn icn-close2 remove-success"></span>
  </div>
</c:if>

<%--Error/success Msg ends--%>
</s:layout-definition>
