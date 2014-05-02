<%@ page import="com.hk.api.response.catalog.browse.CategoryBrowseNode" %>
<%@ page import="com.hk.api.response.ui.base.breadcrumb.BreadCrumb" %>
<%@ page import="com.hk.constants.email.Keys" %>
<%@ page import="com.hk.constants.marketing.TagConstants" %>
<%@ page import="com.hk.impl.service.ServiceLocatorFactory" %>
<%@ page import="com.hk.pact.service.LoadPropertyService" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="org.apache.shiro.UnavailableSecurityManagerException" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.hk.api.response.ui.base.tags.CategoryTag" %>
<%@ page import="com.hk.api.response.ui.base.tags.BrandTag" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hk.web.stripes.HKResolutionHelper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/includes/taglibInclude.jsp" %>
<c:set var="searchString" value="'"/>
<c:set var="replaceString" value="\\'"/>
<s:layout-definition>
  <%
    try {
      PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
      if (principal != null) {
        pageContext.setAttribute(TagConstants.TagVars.USER_HASH, principal.getId());
        String gender = principal.getGender();
        if (gender == null) {
          gender = "n.a.";
        }
        pageContext.setAttribute(TagConstants.TagVars.USER_GENDER, gender);
        pageContext.setAttribute(TagConstants.TagVars.ORDER_COUNT, principal.getOrderCount());
      } else {
        pageContext.setAttribute(TagConstants.TagVars.USER_HASH, "guest");
        pageContext.setAttribute(TagConstants.TagVars.USER_GENDER, "n.a.");
        pageContext.setAttribute(TagConstants.TagVars.ORDER_COUNT, "n.a.");
      }
    }catch(UnavailableSecurityManagerException ex){

    }

    LoadPropertyService loadPropertyService = ServiceLocatorFactory.getService(LoadPropertyService.class);
    String projectEnvTagManager = (String) loadPropertyService.getProperty(Keys.Env.projectEnv);

    String pageType = (String) pageContext.getAttribute("pageType");
    String parentNavKey = "";

    String variantName = (String) pageContext.getAttribute("variantName");
    if (variantName != null) {
      variantName = variantName.replaceAll("'", "\\\\'").replaceAll("[ ]+", " ").trim();
    } else {
      variantName = "";
    }

    List<BreadCrumb> breadCrumbs = (List<BreadCrumb>) pageContext.getAttribute("breadCrumbs");
    Set<CategoryBrowseNode> categoryBrowseNodes = (Set<CategoryBrowseNode>) pageContext.getAttribute("categoryBrowseNodeList");
    String allCats = "";
    String allNavKeys = "";
    if (breadCrumbs != null && pageType != null) {
      int bcSize = breadCrumbs.size();
      if (pageType.equals(TagConstants.PageType.STORE_VARIANT)) {
        // if this is a product page, the last breadcrumb is not useful.. it is simply the product name
        // we need the parentNavKey which is the product node of the product
        // one of the nodes is HOME.. we need to ignore it.. hence minus 2
        // todo ideally we'd like prefix here
        parentNavKey = bcSize > 2 ? breadCrumbs.get(bcSize - 2).getNavKey() : "";

        // create all categories and all navKeys list
        // in case of storeVariant, we should do this using breadcrumb
        StringBuilder allCatsStringBuilder = new StringBuilder();
        StringBuilder allNavKeysStringBuilder = new StringBuilder();
        for (int i = 1; i < bcSize - 1; i++) {
          BreadCrumb breadCrumb = breadCrumbs.get(i);
          allCatsStringBuilder.append("'").append(breadCrumb.getName().replaceAll("'", "\\\\'")).append("',");
          allNavKeysStringBuilder.append("'").append(breadCrumb.getNavKey()).append("',");
        }


        allCats = allCatsStringBuilder.deleteCharAt(allCatsStringBuilder.length() - 1).toString();
        allNavKeys = allNavKeysStringBuilder.deleteCharAt(allNavKeysStringBuilder.length() - 1).toString();
      } else if (pageType.equals(TagConstants.PageType.MENU_LANDING)) {
        // create all categories and all navKeys list
        // in case of menu landing, we should do this using browse nodes
        Set<String> allBrowseNodeNames = new HashSet<String>();
        Set<String> allBrowseNodeNavKeys = new HashSet<String>();
        populateAllBrowseNodeNamesAndKeys(categoryBrowseNodes, allBrowseNodeNames, allBrowseNodeNavKeys);

        StringBuilder allCatsStringBuilder = new StringBuilder();
        StringBuilder allNavKeysStringBuilder = new StringBuilder();
        for (String browseNodeName : allBrowseNodeNames) {
          allCatsStringBuilder.append("'").append(browseNodeName.replaceAll("'", "\\\\'")).append("',");
        }
        for (String browseNodeNavKey : allBrowseNodeNavKeys) {
          allNavKeysStringBuilder.append("'").append(browseNodeNavKey).append("',");
        }

        allCats = allCatsStringBuilder.deleteCharAt(allCatsStringBuilder.length() - 1).toString();
        allNavKeys = allNavKeysStringBuilder.deleteCharAt(allNavKeysStringBuilder.length() - 1).toString();
      }
    }

    List<String> svTags = (List<String>) pageContext.getAttribute("svTags");
    List<String> bTags = (List<String>) pageContext.getAttribute("bTags");
    List<String> cTags = (List<String>) pageContext.getAttribute("cTags");
    List<CategoryTag> cTagList = (List<CategoryTag>) pageContext.getAttribute("cTagList");
    List<BrandTag> bTagList = (List<BrandTag>) pageContext.getAttribute("bTagList");

    if (cTags == null) {
      cTags = new ArrayList<String>();
    }
    if (cTagList != null && !cTagList.isEmpty()) {
      for (CategoryTag categoryTag : cTagList) {
        cTags.addAll(categoryTag.getTagList());
      }
    }
    if (bTags == null) {
      bTags = new ArrayList<String>();
    }
    if (bTagList != null && !bTagList.isEmpty()) {
      for (BrandTag brandTag : bTagList) {
        bTags.addAll(brandTag.getTagList());
      }
    }


    String svTagsStr = "";
    String bTagsStr = "";
    String cTagsStr = "";
    if (svTags != null && !svTags.isEmpty()) {
      StringBuilder svTagsBuilder = new StringBuilder();
      for (String svTag : svTags) {
        svTagsBuilder.append("'").append(svTag).append("'").append(",");
      }
      svTagsStr = svTagsBuilder.deleteCharAt(svTagsBuilder.length() - 1).toString();
    }
    if (cTags != null && !cTags.isEmpty()) {
      StringBuilder cTagsBuilder = new StringBuilder();
      for (String cTag : cTags) {
        cTagsBuilder.append("'").append(cTag).append("'").append(",");
      }
      cTagsStr = cTagsBuilder.deleteCharAt(cTagsBuilder.length() - 1).toString();
    }
    if (bTags != null && !bTags.isEmpty()) {
      StringBuilder bTagsBuilder = new StringBuilder();
      for (String bTag : bTags) {
        bTagsBuilder.append("'").append(bTag).append("'").append(",");
      }
      bTagsStr = bTagsBuilder.deleteCharAt(bTagsBuilder.length() - 1).toString();
    }


    String ua = request.getHeader("User-Agent");
    boolean browserCompat = true;
    if (ua != null) {
      if (ua.indexOf("MSIE 8.0") != -1 || ua.indexOf("MSIE 7.0") != -1) {
        browserCompat = false;
      }
    } else {
      browserCompat = false;
    }

    boolean isMobile = HKResolutionHelper.shouldGetMobileJsp();

  %>
  <script type="text/javascript">
    dataLayer = [
      {
        '<%=TagConstants.TagVars.USER_HASH%>': '<%=pageContext.getAttribute(TagConstants.TagVars.USER_HASH)%>',
        '<%=TagConstants.TagVars.USER_GENDER%>': '<%=pageContext.getAttribute(TagConstants.TagVars.USER_GENDER)%>',
        '<%=TagConstants.TagVars.ORDER_COUNT%>': '<%=pageContext.getAttribute(TagConstants.TagVars.ORDER_COUNT)%>',
        'pageType': '${pageType}',
        'primaryCategory':'${fn:replace(primaryCategory, searchString, replaceString)}',
        'secondaryCategory':'${fn:replace(secondaryCategory, searchString, replaceString)}',
        'tertiaryCategory':'${fn:replace(tertiaryCategory, searchString, replaceString)}',
        'allCats' : [<%=allCats%>],
        'allNavKeys' : [<%=allNavKeys%>],
        'brand':'${fn:replace(brand, searchString, replaceString)}',
        'variantId':'${variantId}',
        'productId':'${productId}',
        'variantOfferPrice':'${variantOfferPrice}',
        'variantMrp':'${variantMrp}',
        'variantDiscount':'${variantDiscount}',
        'variantName':'<%=variantName%>',
        'variantImageM' : '${variantImageM}',
        'variantImageS' : '${variantImageS}',
        'primaryMenu':'${fn:replace(primaryMenu, searchString, replaceString)}',
        'secondaryMenu':'${fn:replace(secondaryMenu, searchString, replaceString)}',
        'tertiaryMenu':'${fn:replace(tertiaryMenu, searchString, replaceString)}',
        'navKey':'${navKey}',
        'parentNavKey' : '<%=parentNavKey%>',
        'oos' : '${oos}',
        'env' : '<%=projectEnvTagManager%>',
        'signup' : '${param["signup"]}',
        'login' : '${param["login"]}',
        'canonicalUrl' : '${fn:replace(canonicalUrl, searchString, replaceString)}',
        'errorCode' : '${errorCode}',
        'browserCompat' : '<%=browserCompat%>',
        'svTags' : [<%=svTagsStr%>],
        'cTags' : [<%=cTagsStr%>],
        'bTags' : [<%=bTagsStr%>],
        'isMobile' : <%=isMobile%>
      }
    ];
  </script>
  <%
    Boolean newSession = (Boolean) session.getAttribute(TagConstants.Session.newSession);
    //out.write("new session = "+newSession);
    if (newSession == null) {
      newSession = false;
      session.setAttribute(TagConstants.Session.newSession, newSession);
      // this is a new session!
      String originalUrlHeader = (String) request.getAttribute("javax.servlet.forward.request_uri");
      if (originalUrlHeader == null) {
        originalUrlHeader = request.getRequestURI();
      }
      pageContext.setAttribute("originalUrlHeader", originalUrlHeader);
      // the landing page URL gives us info on the context of this page
      // or we can also use the variables passed in
  %>
  <script type="text/javascript">
    dataLayer.push({'newSession' : 'true'});
    dataLayer.push({
      '<%=TagConstants.AnalyticsConstants.lpBrand%>' : '${fn:replace(brand, searchString, replaceString)}',
      '<%=TagConstants.AnalyticsConstants.lpPrimCat%>' : '${fn:replace(primaryCategory, searchString, replaceString)}',
      '<%=TagConstants.AnalyticsConstants.lpPrimMenu%>' : '${fn:replace(primaryMenu, searchString, replaceString)}'
    });
  </script>
  <%
    }
  %>
  <!-- Google Tag Manager -->
  <noscript>
    <iframe src="//www.googletagmanager.com/ns.html?id=GTM-3PX8"
            height="0" width="0" style="display:none;visibility:hidden"></iframe>
  </noscript>
  <script>(function(w, d, s, l, i) {
    w[l] = w[l] || [];
    w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});
    var f = d.getElementsByTagName(s)[0],
        j = d.createElement(s),dl = l != 'dataLayer' ? '&l=' + l : '';
    j.async = true;
    j.src =
    '//www.googletagmanager.com/gtm.js?id=' + i + dl;
    f.parentNode.insertBefore(j, f);
  })(window, document, 'script', 'dataLayer', 'GTM-3PX8');</script>
  <!-- End Google Tag Manager -->
</s:layout-definition>

<%!
  private void addChildrenNamesAndKeys(CategoryBrowseNode categoryBrowseNode, Set<String> allBrowseNodeNames, Set<String> allBrowseNodeNavKeys) {
    if (StringUtils.isNotBlank(categoryBrowseNode.getName())) {
      allBrowseNodeNames.add(categoryBrowseNode.getName());
    }
    if (StringUtils.isNotBlank(categoryBrowseNode.getNavKey())) {
      allBrowseNodeNavKeys.add(categoryBrowseNode.getNavKey());
    }
    if (categoryBrowseNode.getChildren() != null && !categoryBrowseNode.getChildren().isEmpty()) {
      for (CategoryBrowseNode childBrowseNode : categoryBrowseNode.getChildren()) {
        addChildrenNamesAndKeys(childBrowseNode, allBrowseNodeNames, allBrowseNodeNavKeys);
      }
    }
  }

  public void populateAllBrowseNodeNamesAndKeys(Set<CategoryBrowseNode> categoryBrowseNodes, Set<String> allBrowseNodeNames, Set<String> allBrowseNodeNavKeys) {
    for (CategoryBrowseNode categoryBrowseNode : categoryBrowseNodes) {
      addChildrenNamesAndKeys(categoryBrowseNode, allBrowseNodeNames, allBrowseNodeNavKeys);
    }
  }
%>
