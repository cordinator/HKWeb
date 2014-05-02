<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 18/07/13
  Time: 07:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglibInclude.jsp" %>

<s:layout-definition>


  <div class="new-add-cntnr">
    <div class="row">
      <div class="span7 mrgn-r-40">
        <label  for="user-name">Name<span class="icn-mandatory">*</span></label>
        <s:text name="name"  id="user-name" class="lrge-input-field" tabindex="10"
                value="${shippingAddress.name}"/>
      </div>

    </div>

    <div class="row">
      <div class="span3   mrgn-r-40">
        <label for="contactNo">Mobile no. <%--(10 digits)--%><span class="icn-mandatory">*</span></label>
        <s:text type="text" name="contactNo" id="contactNo" tabindex="20" value="${contactNo}"/>

      </div>
      <div class="span3 omega">
        <label for="alternateContactNo">Alternate phone no.</label>
        <s:text type="text" name="alternateContactNo" id="alternateContactNo" tabindex="30"
                value="${alternateContactNo}"/>

      </div>
      <div class="span7 cntct-no-alrt">Correct phone numbers ensure quick and painless deliveries.
      Please ensure at least one of the numbers is correct.</div>
    </div>
    <div class="row">

      <div class="span7 omega">
        <label for="line1">Address<span class="icn-mandatory">*</span></label>
        <s:textarea  name="line1" id="line1" class="lrge-input-field" tabindex="40">${shippingAddress.line1}</s:textarea>
      </div>
    </div>
    <div class="row">
        <div class="span3 mrgn-r-40">
          <label for="landmark">Landmark</label>
          <s:text type="text" name="landmark" id="landmark" tabindex="50" value="${shippingAddress.landmark}"/>
        </div>

      <div class="span3 omega">
        <label for="pincode">Pincode<span class="icn-mandatory">*</span></label>
        <s:text type="text" name="pincode" id="pincode" tabindex="60" value="${shippingAddress.pincode}"/>
      </div>
    </div>
    <div class="row">
      <div class="span3 mrgn-r-40">
        <label for="state">State<span class="icn-mandatory">*</span></label>
        <s:select name="stateId" id="state" value="${shippingAddress.stateId}" tabindex="70">
          <s:option value=""> -Select One-</s:option>
          <c:forEach items="${states}" var="stateList">
            <s:option value="${stateList.id}"> ${stateList.name}</s:option>

          </c:forEach>
        </s:select>
          <%--<s:text name="state" id="state" tabindex="50" value="${shippingAddress.stateName}"/>--%>
          <%--<s:hidden name="stateId" id="state-id" value="${shippingAddress.stateId}"/>--%>
      </div>

      <div class="span3 omega">
        <label for="cityName">City<span class="icn-mandatory">*</span></label>
        <s:text type="text" name="cityName" id="cityName" tabindex="80" value="${shippingAddress.cityName}"/>
        <s:hidden name="cityId" id="city-id" value="${shippingAddress.cityId}"/>
      </div>
    </div>
      <%--
        <div class="row">
        <div class="span3 mrgn-r-40">
        <label for="placeName">Locality Name</label>
        <input type="text" id="placeName" tabindex="70" value="">
        <s:hidden name="placeId" id="place-id" value="${shippingAddress.placeId}"/>
        </div>
        </div>
      --%>
    <!--TODO: this feature will be added later
    <div class="span5">
    <input type="checkbox" value="" />
    Use this address as my default address
    </div>
    -->
    <div class="row">
      <div class="span5 mrgn-bt-20">
        <s:hidden name="addressId"  id="addressId" value="${addressId}"/>
        <s:submit name="addAddressForUser" id="addAddressForUser" tabindex="90" type="submit" value="continue"
                  class="btn btn-blue"/>
      </div>
    </div>
  </div>

</s:layout-definition>