<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes-dynattr.tld" %>
<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp">
<s:useActionBean beanclass="com.hk.web.action.beta.variant.StoreVariantAction" var="variantAction"/>
<s:layout-component name="content">


<c:set var="variant" value="${variantAction.storeVariantDetail}"/>
<c:set var="attrDefaultVariantMap" value="${variantAction.attrDefaultVariantMap}"/>
<c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>"/>
<c:set var="filterKeyValueSeperator" value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>"/>
<div class="mainContainer">
<div class="container_16 clearfix">

  <div class="marginBox">

    <div class="grid_16 embedMargin alignCenter">
      <span class="icn icn-dot"></span>
      <h4 class="displayInline embedPadding3"> ${variant.name}</h4>
      <span class="icn icn-dot"></span>

    </div>

  </div>
<br>

  <div class="grid_6 clearContainers">
    <div class="parentImg">
      <c:set var="primaryImage" value="${variant.primaryImage}"/>
      <img width="300" height="300" src="${primaryImage.slink}" alt="${primaryImage.altText}"/>

      <p>${primaryImage.caption}</p>
    </div>
    <div class="embedMargin">
      <c:forEach items="${variant.images}" var="image">
        <img class="imgBox1" src="${image.xxtlink}" sLink="${image.slink}" alt="${image.altText}" width="40" height="40"
             caption="${image.caption}"/>
      </c:forEach>
    </div>

  </div>

  <div class="grid_10 embedPadding1">
    <div class="grid_5 alpha omega">
      <ul class="sqr-lst">
        <c:forEach items="${variant.keyPoints}" var="keyPoint">
          <li><span>${keyPoint}</span></li>
        </c:forEach>
      </ul>
      
      <c:forEach items="${variant.attributes}" var="attribute">
        <c:set var="selectedValue" value="${variant.selectedAttributes[attribute.name]}"/>
        <div class="span12 diff-attr" attr-name="${attribute.name}">
          <label class="bold" for="${attribute.displayName}">${attribute.displayName}</label><br>
            <%--<select id="${attribute.displayName}">
              <option value="">- Select One -</option>
              <c:forEach items="${attribute.attrValues}" var="attrValue">
                <c:set var="attrValCombination"
                       value="${attribute.name}${filterKeyValueSeperator}${attrValue.internalValue}"/>
                <option attr-val-name="${attrValue.internalValue}"
                        default-variant="${attrDefaultVariantMap[attrValCombination]}"
                        class="label diff-attr-val
                        ${fn:toLowerCase(attrValue.internalValue) eq selectedValue ? 'label-inverse selected-val' : ''}">
                    ${attrValue.displayValue}
                </option>
              </c:forEach>
            </select>--%>
          <c:forEach items="${attribute.attrValues}" var="attrValue">
            <c:set var="attrValCombination"
                   value="${attribute.name}${filterKeyValueSeperator}${attrValue.internalValue}"/>
            <%--<span attr-val-name="${attrValue.internalValue}"
                  default-variant="${attrDefaultVariantMap[attrValCombination]}"
                  class="label diff-attr-val
                 ${fn:toLowerCase(attrValue.internalValue) eq selectedValue ? 'label-inverse italic selected-val' : ''}">
                ${attrValue.displayValue}
            </span>--%>
            <label attr-val-name="${attrValue.internalValue}"
                   default-variant="${attrDefaultVariantMap[attrValCombination]}"
                   class="label diff-attr-val
                           ${fn:toLowerCase(attrValue.internalValue) eq selectedValue ? 'label-inverse italic selected-val' : ''}">
                ${attrValue.displayValue}
            </label>
          </c:forEach><br><br>
        </div>
      </c:forEach>
      
      
    </div>
    <div class="grid_5  omega headContainer">
      <c:if test="${variant.discount > 0}">
        <p class="strikethrough">Rs. ${variant.mrp}</p>
      </c:if>
      <p>
        <span class="successText">now Rs. ${variant.offerPrice}</span>
        <c:if test="${variant.discount > 0}">
          <span class="section2 fr">You save ${variant.discount}%</span>
        </c:if>
      </p>

        <div class="offerbox" style="border:1px dashed #ccc;padding:5px;font-size:0.9em">
          <p> Limited time offer | Get Puresoft(140ml) Free</p>
        </div>
        <br>
       
      <input type="submit" class="buttonControl embedMarginleft2" value="Buy Now">
        <p class="section3">Discreet packaging | Cash on delivery </p>
      <div></div>
         
      
    </div>

      
      
    </div>
  </div>

  <div class="grid_10 embedMarginTop50">

  </div>
    <%--<div class="grid_10">
      <div class="buttonblock">
        <button class="secondaryButton"><img src="../images/addwidget.png">Add to compare</button>
        <button class="secondaryButton"><img src="../images/commentImg.png"> speak to a nutritionist</button>

        <button class="secondaryButton"><img src="../images/wishlist.png">add to wishlist</button>
      </div>
    </div>--%>
</div>

<div class="container_16 clearfix " id="ProductInfoBlock"  data-spy="scroll" data-target="#NavBox">

  <c:if test="${variantAction.displayNavBar}">
    
      <div class="grid_4" id="NavBox">
        <ul class="navBox">

          <li class="liNoStyle"> Jump To</li>
            <%--<li class="liNoStyle"><a href="#alsoBoughtContainer">also bought</a></li>--%>
            <%--<li class="liNoStyle"><a href="#offersContainer">offers</a></li>--%>
          <c:if test="${variant.description ne null}">
            <li class="liNoStyle"><a href="#detailsContainer">details,info</a></li>
          </c:if>

          <c:forEach items="${variantAction.slotToContent}" var="slotContent">
            <li class="liNoStyle"><a href="#${slotContent.key}">${variantAction.slotKeyToSlotName[slotContent.key]}</a>
            </li>
          </c:forEach>

            <%--<li class="liNoStyle"><a href="#reviewsContainer">reviews</a></li>--%>
          <li class="liNoStyle noBorder"><a href="#header">back to top</a></li>
        </ul>


      </div>

      <div class="grid_12" id="ProductDetailsBlock">


        <div id="detailsContainer" class="headContainer">
          <div id="productDetailshead">
            <div class="grid_11 alignCenter">
              <img src="../images/bulletImg.png" width="12" height="12" alt="bullet1"/>

              <h3 class="displayInline embedPadding3"> Details</h3>
              <img src="../images/bulletImg.png" width="12" height="12" alt="bullet2"/>
            </div>

          </div>
          <div id="productDetails" class="embedMargin2">

              <%--<div class="embedMargin2 ">
                <div class="grid_12  alignCenter omega">
                    &lt;%&ndash; <iframe width="560" height="315" src="http://www.youtube.com/embed/ujOR4JMYNJE" frameborder="0"
                    allowfullscreen=""></iframe>&ndash;%&gt;
                </div>
              </div>--%>

            <div class="grid_11">
                ${variant.description}

              <table class="embedMargin embedMarginTop50">
                <c:forEach items="${variant.groups}" var="group">
                  <thead>
                  <tr class="borderTopBottom alignLeft">
                    <th class="embedPadding2" group-name="${group.name}">${group.displayName}</th>
                    <th></th>
                  </tr>

                  </thead>
                  <tbody class="specifications">
                  <c:forEach items="${group.groupValues}" var="groupValue">

                    <tr>
                      <td>${groupValue.displayName}</td>
                      <td>${groupValue.value}</td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </c:forEach>
              </table>

            </div>
          </div>

        </div>

        <c:forEach items="${variantAction.slotToContent}" var="slotContent">

          <div id="${slotContent.key}" class="headContainer">

            <div class="grid_11  omega alignCenter">
              <img src="../images/bulletImg.png" width="12" height="12" alt="bullet1"/>

              <h3 class="displayInline embedPadding3">${variantAction.slotKeyToSlotName[slotContent.key]}</h3>
              <img src="../images/bulletImg.png" width="12" height="12" alt="bullet2"/>

            </div>


            <div class="grid_11  omega embedMargin ">
              <div class="productDescription embedMargin2  ">
                  ${slotContent.value.value}
              </div>
            </div>

          </div>
        </c:forEach>

      </div>
    

  </c:if>
</div>


</div>


</s:layout-component>
<s:layout-component name="scriptComponent">
  <script type="text/javascript">

    function buildFilterKey(allAttrDivs, currAttrDiv, currAttrValSpan) {
      var filterKey = "";
      var currAttrName = currAttrDiv.attr("attr-name");
      var currAttrVal = currAttrValSpan.attr("attr-val-name");

      allAttrDivs.each(function() {
        var attrName = $(this).attr("attr-name");
        if (attrName != currAttrName) {
          var selectedDiffAttrValue = $(this).find('label.diff-attr-val.selected-val').attr("attr-val-name");
          filterKey += attrName + "${filterKeyValueSeperator}" + selectedDiffAttrValue + "${filterSeperator}";
        } else {
          filterKey += currAttrName + "${filterKeyValueSeperator}" + currAttrVal + "${filterSeperator}";
        }
      });
      return filterKey;
    }

    function buildFilterKeyVariantMap() {
      return {
        <c:forEach items="${variant.availableVariants}" var="availVariantMap" varStatus="ctr">
        "${availVariantMap.key}":"${availVariantMap.value}"
        <c:if test="${!ctr.last}">
        ,
        </c:if>
        </c:forEach>
      };
    }

    function buildCurrentSelection(attrDivToBeChanged) {
      var currSelection = " in ";
      var attrNameToBeChanged = attrDivToBeChanged.attr('attr-name');
      $('label.diff-attr-val.selected-val').each(function() {
        var attrName = $(this).parents('div.diff-attr').attr('attr-name');
        if (attrName != attrNameToBeChanged) {
          currSelection += $(this).text().trim() + ", ";
        }
      });
      return currSelection;
    }

    $(document).ready(function() {
      var keyVariantMap = buildFilterKeyVariantMap();

      var variantDiffAttributesDiv = $('div.variant-diff-attr-div');
      $('img.imgBox1').click(function() {
        var primaryImageDiv = $('div.parentImg');
        var primaryImage = primaryImageDiv.find('img');
        var primaryImageCaption = primaryImageDiv.find('p');
        primaryImage.attr("src", $(this).attr("sLink"));
        primaryImage.attr("alt", $(this).attr("alt"));
        primaryImageCaption.text($(this).attr("caption"));
      });

      $('label.diff-attr-val:not(.selected-val)').click(function() {
        var parentAttrDiv = $(this).parents('div.diff-attr');
        var diffAttrDivs = variantDiffAttributesDiv.find('div.diff-attr');
        var key = "";
        var currentAttrValSpan = $(this);
        key = buildFilterKey(diffAttrDivs, parentAttrDiv, currentAttrValSpan);
        if (keyVariantMap[key] == null) {
          window.location.href = "${pageContext.request.contextPath}/variant/StoreVariant.action?pre&storeVariantId=" + $(this).attr("default-variant");
        } else {
          window.location.href = "${pageContext.request.contextPath}/variant/StoreVariant.action?pre&storeVariantId=" + keyVariantMap[key];
        }
      });

      $('label.diff-attr-val:not(.selected-val)').mouseleave(function() {
        $(this).removeClass('label-important');
        $(this).removeClass('label-success');
        $(this).removeClass('bold');
        $(this).removeAttr("title");
        //        $(this).tooltip('hide');
      });

      $('label.diff-attr-val:not(.selected-val)').mouseenter(function() {
        var parentAttrDiv = $(this).parents('div.diff-attr');
        var diffAttrDivs = variantDiffAttributesDiv.find('div.diff-attr');
        var key = "";
        var currentAttrValSpan = $(this);
        key = buildFilterKey(diffAttrDivs, parentAttrDiv, currentAttrValSpan);


        if (keyVariantMap[key] == null) {
          var currSelection = buildCurrentSelection(parentAttrDiv);
          $(this).attr("title", "Not available" + currSelection);
          $(this).addClass('label-important');
          /*$(this).tooltip({
           title:"Not available" + currSelection
           });
           $(this).tooltip('show');*/
        } else {
          $(this).addClass('label-success');
          $(this).addClass('bold');
        }
      });


      /*Fixing the left nav*/


      var initialHeight = $(".navBox").offset().top ;

      $(".navBox").css("top", initialHeight);

      $(window).scroll(function(e) {
        /*console.log(initialHeight);*/
        if ($(window).scrollTop() > initialHeight) {
          /*console.log(initialHeight);*/
          $('.navBox').css({
            position: 'fixed',
            top: 10
          });
        } else {
          $('.navBox').css({
            position: 'absolute',
            top: initialHeight
          });
        }
      });


      /*Left nav fixing ends here*/


      /*key value css selectors menubar begins here*/


      /*key value css selectors menubar ends*/


    });
  </script>
</s:layout-component>
</s:layout-render>