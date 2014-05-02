package com.hk.web.action.beta.sitemap;

import com.hk.pact.service.sitemap.SitemapService;
import com.hk.web.action.beta.BaseAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.UrlBinding;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@UrlBinding("/sitemap.xml")
@Component
public class SiteMapAction extends BaseAction {

  private List<String> menuLinks = new ArrayList<String>();
  private List<String> categoryLinks = new ArrayList<String>();
  private Set<String> variantAndBrandLinks = new HashSet<String>();

  @Autowired
  private SitemapService sitemapService;

  @DefaultHandler
  public Resolution pre(){
    menuLinks = getSitemapService().getMenuNodeUrls();
    categoryLinks = getSitemapService().getCategoryUrls();
    variantAndBrandLinks = getSitemapService().getVariantAndBrandUrls();
    return new ForwardResolution("/pages/sitemap/sitemap.jsp");
  }

  public List<String> getMenuLinks() {
    return menuLinks;
  }

  public void setMenuLinks(List<String> menuLinks) {
    this.menuLinks = menuLinks;
  }

  public SitemapService getSitemapService() {
    return sitemapService;
  }

  public List<String> getCategoryLinks() {
    return categoryLinks;
  }

  public void setCategoryLinks(List<String> categoryLinks) {
    this.categoryLinks = categoryLinks;
  }

  public Set<String> getVariantAndBrandLinks() {
    return variantAndBrandLinks;
  }

  public void setVariantAndBrandLinks(Set<String> variantAndBrandLinks) {
    this.variantAndBrandLinks = variantAndBrandLinks;
  }
}
