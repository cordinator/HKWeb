<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 9/13/13
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
<%--dialog begins here--%>
<div  class="js-dialog hide" id="${dialogId}">
    <p class="dialog-title">
        <span>${dialogTitle}</span>
        <span class="icn icn-close2 cont-rht mrgn-r-10 close-dialog"></span>
    </p>
    <div class="dialog-subcntnr">
            <div class="widget-box">
                <label for="${user}" class="mandatory-heading">Name <span>*</span></label>
                <input type="text" value="" tabindex="1" class="" id="${user}" name="${user}">
            </div>
            <div class="widget-box">
                <label for="${email}" class="mandatory-heading">Email <span>*</span></label>
                <input type="text" value="" tabindex="2" class="" id="${email}" autocomplete="off" name="${email}">
            </div>
          <c:if test="${layoutType == 'speakToNutritionistLayout'}">
            <div class="widget-box">
                <label for="${phone}" class="mandatory-heading">Phone No.</label>
                <input type="text" value="" tabindex="3" class="" id="${phone}" autocomplete="off" name="${phone}">
            </div>
            <div class="widget-box fnt-sz9 aggre-terms-cnt">
              <input type="hidden" value="${catId}" name="categoryId" />
              <input id="subscribeCheckbox" name="subscribeCheckbox" value="true" type="checkbox" checked="checked">
              I agree to receive updates from HealthKart.com in future through Phone and E-Mails.
            </div>
            </c:if>
            <div class="dialog-btn-cntnr">
                <button id="${dialogBtn}" value="" name="${dialogBtn}" tabindex="50" class="btn btn-blue-mini"
                        type="submit">Submit
                </button>
                <%--<button id="notify-cancel" value="" name="notify-cancel" tabindex="50" class="btn btn-gray mrgn-l-20" type="submit">Cancel</button>--%>
            </div>
    </div>
    <p  class="resp-msg hide"> </p>
</div>
<%--dialog ends here--%>
</s:layout-definition>