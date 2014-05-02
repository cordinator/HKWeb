<?xml version="1.0" encoding="UTF-8"?>
<% response.setContentType("text/xml"); %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.sitemap.SiteMapAction" var="sitemapAction"/>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>http://www.healthkart.com</loc>
    <priority>1.0</priority>
    <changefreq>weekly</changefreq>
  </url>
  <url>
    <loc>http://www.healthkart.com/beta/hk/AboutUs.action</loc>
  </url>
  <url>
    <loc>http://www.healthkart.com/beta/hk/ContactUs.action</loc>
  </url>
  <url>
    <loc>http://www.healthkart.com/beta/hk/TermsConditions.action</loc>
  </url>
  <c:forEach items="${sitemapAction.menuLinks}" var="menuLink">
    <url>
      <loc>${menuLink}</loc>
      <priority>0.7</priority>
      <changefreq>weekly</changefreq>
    </url>
  </c:forEach>
  <c:forEach items="${sitemapAction.categoryLinks}" var="categoryLink">
    <url>
      <loc>${categoryLink}</loc>
      <priority>0.7</priority>
      <changefreq>weekly</changefreq>
    </url>
  </c:forEach>
  <c:forEach items="${sitemapAction.variantAndBrandLinks}" var="variantAndBrandLink">
    <url>
      <loc>${variantAndBrandLink}</loc>
      <priority>0.5</priority>
      <changefreq>weekly</changefreq>
    </url>
  </c:forEach>
</urlset>