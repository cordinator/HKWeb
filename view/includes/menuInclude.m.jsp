<%@include file="/includes/taglibInclude.jsp"%>
<%
  boolean showMenu = (Boolean) pageContext.getAttribute("showMenu");
  String tempVar = (String) pageContext.getAttribute("tempVar");
%>
<s:layout-definition>
	<s:useActionBean
		beanclass="com.hk.web.action.beta.menu.StoreMenuAction"
		var="menuAction" event="pre" />
	<c:set var="maxLeafElms" value="7" />
	<div>
		<div class="list_title font13">categories</div>
		<div class="search_hldr">
			<s:layout-render name="/includes/autoCompleteInclude.m.jsp" />
		</div>
		<div id="dropDownbox1" class="dropDownboxHomePage font13 ${showMenu!=null && showMenu=='true'?'':'hide'}">
			<c:forEach items="${menuAction.menuNodes}" var="menuNode" varStatus ="loop">
					<a class="list_item  ellip removeBold_H" hide="true" href="javascript:void(0);" onclick="togglehomeMenu('${tempVar}${fn:replace(menuNode.name,' ','_')}${loop.index}', event,this)">${menuNode.name}<span></span></a>
					<div id = "${tempVar}${fn:replace(menuNode.name,' ','_')}${loop.index}" class="hide_H sub_1 ${fn:replace(menuNode.name,' ','_')}" style="display:none">
						<a href="${menuNode.url}" class="list_item  ellip">${menuNode.name}<span></span>
						</a>
						<c:forEach items="${menuNode.childNodes}" var="l1child" varStatus="cntr">
							<a class="list_item  ellip removeBold_H" hide="false" href="javascript:void(0);" onclick="togglehomeMenu('${tempVar}${fn:replace(l1child.name,' ','_')}${loop.index}', event,this)">
								${l1child.name}<span></span>
							</a>
							<c:set var="leafElms" value="${fn:length(l1child.childNodes)>maxLeafElms?maxLeafElms:fn:length(l1child.childNodes)}" />
							
							<c:set var="seeMore" value="${fn:length(l1child.childNodes)>maxLeafElms?'true':'false'}" />
							<div id="${tempVar}${fn:replace(l1child.name,' ','_')}${loop.index}" class="hide_H2 sub_2 ${fn:replace(l1child.name,' ','_')}" style="display:none">
								<a href="${l1child.url}" class="list_item  ellip">All ${l1child.name}<span></span></a>
								<c:forEach items="${l1child.childNodes}" var="l2child" end="${leafElms}" varStatus="counter">

									<a class="list_item  ellip right_a" href="${l2child.url}">${l2child.name}<span></span></a>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
			</c:forEach>
		</div>
	</div>
</s:layout-definition>