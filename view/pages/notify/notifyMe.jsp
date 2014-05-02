<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 12/20/13
  Time: 5:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.notify.NotifyMeAction" var="notifytAction"/>
<s:layout-render name="/templates/general.jsp">

  <s:layout-component name="content">

    <div class="mainContainer" >
      <div class="container">

        <div class="span16">
            <%--Error/success Msg begins--%>
          <s:layout-render name="/layouts/errorLayout.jsp"/>


            <%--Error/success Msg ends--%>
              <c:if test="${notifytAction.hideForm eq true}">


                <div class="alert-cntnr">
                  <span class="icn-success"></span>
                  <div class="alert-messages "><ul class="messages"><li><a href="${notifytAction.variantLink}"> Click here</a> to go back .</li></ul></div>
                  <span class="icn icn-close2 remove-success"></span>
                </div>
              </c:if>

          <c:if test="${notifytAction.hideForm eq false}">

          <div  class="js-disabled-dialog" >
            <p class="dialog-title">
              <span>Notify Me</span>
              <span class="icn icn-close2 cont-rht mrgn-r-10 close-dialog"></span>
            </p>
               <s:form beanclass="com.hk.web.action.beta.notify.NotifyMeAction" >
                 <div class="dialog-subcntnr">
                   <div class="widget-box">
                     <label for="userName" class="mandatory-heading">Name <span>*</span></label>
                     <s:text  value="" tabindex="1" class="" id="userName" name="userName"/>

                   </div>
                   <div class="widget-box">
                     <label for="email" class="mandatory-heading">Email <span>*</span></label>
                     <s:text value="" tabindex="2" class="" id="email" autocomplete="off" name="email"/>
                   </div>
                   <div class="widget-box">
                     <label for="phone" class="mandatory-heading">Phone No.</label>
                     <s:text value="" tabindex="3" class="" id="phone" autocomplete="off" name="phone"/>
                   </div>

                   <div class="dialog-btn-cntnr">
                     <s:hidden name="oldVariantId" value="${notifytAction.oldVariantId}" />
                     <s:hidden name= "storeVariantId" value = "${notifytAction.storeVariantId}"/>
                     <s:hidden name="variantLink"  value= "${notifytAction.variantLink}" />
                     <s:submit name="saveData" tabindex="50" class="btn btn-blue-mini" >Submit</s:submit>

                   </div>
                 </div>
                 <p  class="resp-msg hide"> </p>
               </s:form>
          </div>
          </c:if>

        </div>
        </div>
      </div>
  </s:layout-component>
</s:layout-render>