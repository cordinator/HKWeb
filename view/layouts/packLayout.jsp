<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglibInclude.jsp" %>

<s:layout-definition>
    <c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>"/>
    <c:set var="filterKeyValueSeperator" value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>"/>

    <div class="row pack-div mrgn-b-50" data-packId=${pack.id}>
        <c:forEach items="${pack.packStoreProducts}" var="packProduct" varStatus="packSpCtr">
            <div class="span3 pack-sp-div" data-pack-spCtr=${packSpCtr.index}>
                <c:if test="${!packSpCtr.last}">
                    <span class="icn icn-plus"></span>
                </c:if>
                <c:forEach items="${packProduct.allowedVariants}" var="allowedVariant" varStatus="varCtr">
                    <div data-vId="${allowedVariant.key}"
                         class="pack-var-div img-box img-box-160 ${varCtr.first ? '' : 'hide'}">
                        <img alt="${allowedVariant.value.primaryImage.altText}"
                             src="${allowedVariant.value.primaryImage.slink}"/>

                        <div class="mrgn-t-10">
                            <span class="varnt-title">${allowedVariant.value.name}</span>
                        </div>
                    </div>
                </c:forEach>

                     <c:set var="packBottomBorderRendered" value="false"/>
                    <c:forEach items="${packProduct.packStoreProductOptions}" var="option" varStatus="counter">
                        <c:if test="${counter.index==0 && (fn:length(option.packStoreProductOptionValues) >1)}">
                            <div class="varnt-cmpare  variant-diff-attr-div" >
                            <c:set var="packBottomBorderRendered" value="true"/>
                        </c:if>
                        <c:if test="${counter.index>0 && !packBottomBorderRendered && (fn:length(option.packStoreProductOptionValues) >1)}">
                            <div class="varnt-cmpare  variant-diff-attr-div" >
                            <c:set var="packBottomBorderRendered" value="true"/>
                        </c:if>
                        ${(counter.index == 0)  ?'<!--hr-->':''}
                        <c:if test="${fn:length(option.packStoreProductOptionValues) gt 1}">

                            <div class="styled-select ">

                                <select class="diff-attr" attr-name="${option.name}">
                                    <option class="txt-blue" value="">Change ${option.displayName}</option>
                                    <c:forEach items="${option.packStoreProductOptionValues}" var="packOptionValue">
                                        <option value="${packOptionValue.filterValue}"
                                                attr-val-name="${packOptionValue.filterValue}"
                                                attr-val-comb="${option.name}${filterKeyValueSeperator}${packOptionValue.filterValue}"
                                                class="diff-attr-val"
                                            <%--onclick="HK.Pack().changeVariantInPack(this);"--%>
                                                >
                                                ${packOptionValue.value}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            ${counter.last?'<!--hr-->':''}
                        </c:if>
                        <c:if test="${counter.last && packBottomBorderRendered}">
                            </div>
                        </c:if>

                    </c:forEach>

            </div>
        </c:forEach>
        <div  class="offer-prcng-cntnr offset${(3 - fn:length(pack.packStoreProducts))*3} span3">
            <p>= <span class="strikethrough"> Rs. ${pack.mrp} </span></p>
            <span class="sucss-txt">Now Rs. ${pack.offerPrice}</span>

            <p class="fnt-caps">You save ${pack.discount} %</p>
            <a href="javascript:void(0)" class="btn btn2 btn-blue mrgn-t-5 addPackToCart">Buy Now </a>
        </div>
    </div>

</s:layout-definition>