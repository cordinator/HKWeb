<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 9/17/13
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>

<%--lens layout begins--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
    <div class="variant-diff-attr-div flavour_size_con">
      <c:forEach items="${variant.attributes}" var="attribute">
        <c:set var="selectedValue" value="${variant.selectedAttributes[attribute.name]}"/>
        <div class="diff-attr mrgn-b-10" attr-name="${attribute.name}">
          <div class="bold attr" for="${attribute.displayName}">
          <span class="font14 bold">${attribute.displayName}</span>
          <span class="font14 blue_text">
              <c:forEach items="${attribute.attrValues}" var="attrValue" varStatus="ctr">
                <c:set var="attrValCombination"
                       value="${attribute.name}${filterKeyValueSeperator}${attrValue.internalValue}"/>
                <c:if test="${fn:toLowerCase(attrValue.internalValue) eq selectedValue}">
                      ${attrValue.displayValue}
                </c:if>
              </c:forEach>
          </span>
          </div>
          <ul class="gl blocks">
            <c:forEach items="${attribute.attrValues}" var="attrValue" varStatus="ctr">
              <c:set var="attrValCombination"
                     value="${attribute.name}${filterKeyValueSeperator}${attrValue.internalValue}"/>
                  <li attr-val-name="${attrValue.internalValue}"
                      default-variant="${attrDefaultVariantMap[attrValCombination]}"
                      class="diff-attr-val font13 grey_box ${fn:toLowerCase(attrValue.internalValue) eq selectedValue ? ' selected-val attr-val' : ''} ${fn:length(attribute.attrValues) eq "1" ? 'hide jugadDisplay' : ''}">
                    ${attrValue.displayValue}
                  </li>
              </c:forEach>
          </ul>
        </div>
      </c:forEach>
      <s:form beanclass="com.hk.web.action.beta.variant.StoreVariantCompareAction">
        <div class="left-eye-cont mt20">
          <p class="font14 bold"><!-- <input type="checkbox" id="leftLensChk" /> --> LEFT (OS)</p>
          <c:forEach items="${variant.configOptionList}" var="lensConfig">
            <div class="font13 grey_box lens selected">
              <label class="fnt-bold fnt-sz10 lftCnfgNm" configName="${lensConfig.name}" for="left-${lensConfig.name}"> ${lensConfig.displayName} </label>
              <select class="lftCnfgVal" id="left-${lensConfig.name}">
                <c:forEach items="${lensConfig.configOptionValueList}" var="lensConfVal">
                  <option value="${lensConfVal.value}">${lensConfVal.value}</option>
                </c:forEach>
              </select>
            </div>
          </c:forEach>
        </div>
        <div class="right-eye-cont mt20">
          <p class="font14 bold"><!-- <input type="checkbox" id="rightLensChk" /> --> Right (OD)</p>
          <c:forEach items="${variant.configOptionList}" var="lensConfig">
            <div class="font13 grey_box lens selected">
              <label class="fnt-bold fnt-sz10 rghtCnfgNm" configName="${lensConfig.name}" for="right-${lensConfig.name}"> ${lensConfig.displayName} </label>
              <select class="rhtCnfgVal" id="right-${lensConfig.name}">
                <c:forEach items="${lensConfig.configOptionValueList}" var="lensConfVal">
                  <option value="${lensConfVal.value}">${lensConfVal.value}</option>
                </c:forEach>
              </select>
            </div>
          </c:forEach>
        </div>
      </s:form>
    </div>
</s:layout-definition>
<%--lens layout ends--%>