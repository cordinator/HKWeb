<%@ page import="com.hk.constants.payment.PaymentGatewayParameters" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="java.math.BigInteger" %>
<%@include file="/includes/taglibInclude.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Dummy Gateway</title>
</head>
<body>
<%
  if(request.getParameter(PaymentGatewayParameters.TRANSACTIONSTATUS)!=null){
    String pass = "10703078" + "|" + PaymentGatewayParameters.hk_accountId + "|" + request.getParameter(PaymentGatewayParameters.AMOUNT) + "|" + request.getParameter(PaymentGatewayParameters.GATEWAY_ORDER_ID) + "|" + request.getParameter(PaymentGatewayParameters.TRANSACTIONSTATUS);
    MessageDigest m = null;
    try {
      m = MessageDigest.getInstance("MD5");
    } catch (NoSuchAlgorithmException e) {
      //
    }
    byte[] dataBytes = pass.getBytes();
    assert m != null;
    m.update(dataBytes, 0, dataBytes.length);
    BigInteger i = new BigInteger(1, m.digest());
    String checksum = String.format("%1$032X", i);

//    request.setAttribute(PaymentGatewayParameters.ACCOUNTID,PaymentGatewayParameters.hk_accountId);
//    request.setAttribute(PaymentGatewayParameters.AMOUNT,request.getParameter(PaymentGatewayParameters.AMOUNT));
//    request.setAttribute(PaymentGatewayParameters.GATEWAY_ORDER_ID,request.getParameter(PaymentGatewayParameters.GATEWAY_ORDER_ID));
//    request.setAttribute(PaymentGatewayParameters.TRANSACTIONSTATUS,request.getParameter(PaymentGatewayParameters.TRANSACTIONSTATUS));
//    request.setAttribute(PaymentGatewayParameters.CHECKSUM,checksum);

    RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath() + "/order/payment/PaymentReceive.action?"+ PaymentGatewayParameters.CHECKSUM +"=" +checksum);
    dispatcher.forward(request,response);
//    response.sendRedirect(request.getContextPath() + "/order/payment/PaymentReceive.action");
  }

%>
      <s:form action="${pageContext.request.contextPath}/pages/payment/dummyGateway.jsp" method="post">
        Success<s:radio name="<%=PaymentGatewayParameters.TRANSACTIONSTATUS%>" value="Y" />
        <br>
        Failure<s:radio name="<%=PaymentGatewayParameters.TRANSACTIONSTATUS%>" value="F" />
        <br>
        Authorization Pending<s:radio name="<%=PaymentGatewayParameters.TRANSACTIONSTATUS%>" value="AP" />
        <br>
        <s:hidden name="<%=PaymentGatewayParameters.GATEWAYORDER_ID%>" value="<%=request.getParameter(PaymentGatewayParameters.GATEWAY_ORDER_ID)%>" />
        <s:hidden name="<%=PaymentGatewayParameters.ACCOUNTID%>" value="<%=PaymentGatewayParameters.hk_accountId%>" />
        <s:hidden name="<%=PaymentGatewayParameters.AMOUNT%>" value="<%=request.getParameter(PaymentGatewayParameters.AMOUNT)%>" />
        <s:hidden name="<%=PaymentGatewayParameters.CHECKSUM%>" value=""  />
        <s:submit name="pre" value="SAVE" id="save" />
      </s:form>
</body>
</html>