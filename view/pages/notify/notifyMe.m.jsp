<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 12/20/13
  Time: 5:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.notify.NotifyMeAction" var="notifytAction"/>
<s:layout-render name="/templates/general.m.jsp">
<s:layout-component name="htmlHead">
        <style>
        
fieldset{
	border:none;
	padding:20px 0;
}

.notifyMe-hldr{
	width: 100%;
	float: left;
	padding: 10px;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	margin: 20px 0 30px 0;
}

label.font14.semi_bold{
padding:10px 0;
display:block;
}



.btn.notify{
	border-radius:0;
	width:30%!important;
}


.blue-box{
	width:10px;
	height:10px;
	background:#009cff;
	margin:2px;
}

.return-success{
	margin: 13px 0;
}
        </style>
</s:layout-component>
  <s:layout-component name="content">

    <div class="notifyMe-hldr" >
      <div class="container">
            <%--Error/success Msg begins--%>
          <s:layout-render name="/layouts/errorLayout.jsp"/>


            <%--Error/success Msg ends--%>
              <c:if test="${notifytAction.hideForm eq true}">

		<div class="return-success">
		<span class="icn-success"></span>
                  <div class="alert-messages "><a href="${notifytAction.variantLink}" class="blue_text font14" > Click here</a> to go back .</li></ul></div>
                  <span class="icn icn-close2 remove-success"></span>
          </div>
              </c:if>

          <c:if test="${notifytAction.hideForm eq false}">

          <div  class="js-disabled-dialog" >
           <div class="tcenter title font16">
    		  <div class="circle"></div>
    		  <span class="inline semi_bold">Notify Me</span>
    		  <div class="circle"></div>
    	   </div>
               <s:form beanclass="com.hk.web.action.beta.notify.NotifyMeAction" >
                 
                 	 <fieldset>  
                     <label for="userName" class="font14 semi_bold">Name <span>*</span></label>
                     <s:text  value="" tabindex="1" class="auto-adjust check-empty input-block-level" id="userName" name="userName"/>



                     <label for="email" class="font14 semi_bold">Email <span>*</span></label>
                     <s:text value="" tabindex="2" class="auto-adjust check-empty input-block-level" id="email" autocomplete="off" name="email"/>


                     <label for="phone" class="font14 semi_bold">Phone No.</label>
                     <s:text value="" tabindex="3" class="auto-adjust check-empty input-block-level" id="phone" autocomplete="off" name="phone"/>
					</fieldset>

                     
                     <s:submit name="saveData" tabindex="50" class="btn blue hide notify left font14" >Submit</s:submit>


                 <p  class="resp-msg hide"> </p>
                 <s:hidden name="oldVariantId" value="${notifytAction.oldVariantId}" />
                 <s:hidden name= "storeVariantId" value = "${notifytAction.storeVariantId}"/>
                 <s:hidden name="variantLink"  value= "${notifytAction.variantLink}" />
               </s:form>
          </div>
          </c:if>

        </div>
      </div>
  </s:layout-component>
    
  
</s:layout-render>